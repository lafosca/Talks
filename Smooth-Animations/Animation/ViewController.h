//
//  ViewController.h
//  Animation
//
//  Created by Arol Viñolas on 12/04/13.
//  Copyright (c) 2013 lafosca. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *animatedView;

- (IBAction)linear:(id)sender;
- (IBAction)eased:(id)sender;
- (IBAction)bezier:(id)sender;
@end
