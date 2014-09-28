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


@property (nonatomic,retain) NSArray *menuItems;
@property (strong, nonatomic) IBOutlet UILabel *mainTitle;
@property (readonly, nonatomic) UISwipeGestureRecognizer *recognizer_open, *recognizer_close;
@property(readonly, nonatomic) int menuDrawerX, menuDrawerWidth;

-(void) handleSwipes: (UISwipeGestureRecognizer *) sender;

-(void) drawerAnimation ;

- (void)menuSelect:(id)sender;


@end
