//
//  MainViewController.h
//  AutismAssessment
//
//  Created by Chaitanya Agrawal on 24/09/14.
//  Copyright (c) 2014 Chaitanya Agrawal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController{
    UIView *menuDrawer;
}

@property (strong, nonatomic) IBOutlet UILabel *mainTitle;
@property (nonatomic,retain) NSArray *menuItems;
@property (readonly, nonatomic) UISwipeGestureRecognizer *recognizer_open, *recognizer_close;
@property(readonly, nonatomic) int menuDrawerX, menuDrawerWidth;

-(void) handleSwipes: (UISwipeGestureRecognizer *) sender;

-(void) drawerAnimation ;

- (IBAction)menuSelect:(id)sender;


@end
