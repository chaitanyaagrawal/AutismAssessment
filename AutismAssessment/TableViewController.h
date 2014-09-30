//
//  tableTableViewController.h
//  AutismAssessment
//
//  Created by Chaitanya Agrawal on 29/09/14.
//  Copyright (c) 2014 Chaitanya Agrawal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface tableTableViewController : UITableViewController{
     UIView *menuDrawer;
}

@property (nonatomic, strong) NSArray *Images;
@property (nonatomic, strong) NSArray *Title;
@property (nonatomic, strong) NSArray *Description;

@property (nonatomic,retain) NSArray *menuItems;
@property (strong, nonatomic) IBOutlet UILabel *mainTitle;
@property (readonly, nonatomic) UISwipeGestureRecognizer *recognizer_open, *recognizer_close;
@property(readonly, nonatomic) int menuDrawerX, menuDrawerWidth;


//- (IBAction)menuButton:(id)sender;

-(void) handleSwipes: (UISwipeGestureRecognizer *) sender;

-(void) drawerAnimation ;

- (void)menuSelect:(id)sender;



@end
