//
//  ViewController.m
//  Animation
//
//  Created by Arol Viñolas on 12/04/13.
//  Copyright (c) 2013 lafosca. All rights reserved.
//

#import "ViewController.h"

#import "UIImage+Additions.h"

#import <QuartzCore/QuartzCore.h>

@interface ViewController (){
    BOOL alternativeState;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
}

-(void)viewDidAppear:(BOOL)animated{
    // Make the view rounded by setting the corner radius to be the half of it size
    [[[self animatedView] layer] setCornerRadius:[[self animatedView] frame].size.height/2];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CABasicAnimation*)setupAnimation{
    // Create the basic animation
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    
    // Alternate between states
    if(!alternativeState){
        [animation setFromValue:[NSNumber numberWithFloat:1.f]];
        [animation setToValue:[NSNumber numberWithFloat:1.5f]];
    }else{
        [animation setFromValue:[NSNumber numberWithFloat:1.5f]];
        [animation setToValue:[NSNumber numberWithFloat:1.f]];
    }
    alternativeState = !alternativeState;

    // Set duration
    [animation setDuration:0.5f];
    
    // Set animation to be consistent on completion
    [animation setRemovedOnCompletion:NO];
    [animation setFillMode:kCAFillModeForwards];
    
    return animation;
}

- (IBAction)linear:(id)sender{
    CABasicAnimation *animation = [self setupAnimation];
    
    // Add no timing function
    
    [[[self animatedView] layer] addAnimation:animation forKey:@"scale"];
}
- (IBAction)eased:(id)sender{
    CABasicAnimation *animation = [self setupAnimation];
    
    
    // Add a ease in&out timing function on the animation
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    
    [[[self animatedView] layer] addAnimation:animation forKey:@"scale"];
    
}

- (IBAction)bezier:(id)sender{
    CABasicAnimation *animation = [self setupAnimation];
    
    // Add custom timing as a bezier curve
    [animation setTimingFunction:[CAMediaTimingFunction functionWithControlPoints:.34 :.01 :.69 :1.37]];
    
    [[[self animatedView] layer] addAnimation:animation forKey:@"scale"];
    
}

@end
