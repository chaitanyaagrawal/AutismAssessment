//
//  MainViewController.m
//  AutismAssessment
//
//  Created by Chaitanya Agrawal on 24/09/14.
//  Copyright (c) 2014 Chaitanya Agrawal. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

@synthesize menuDrawerWidth, menuDrawerX, recognizer_close, recognizer_open, menuItems, mainTitle;

- (void)viewDidLoad {
    [super viewDidLoad];
    int statusBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height;
    menuDrawerWidth = self.view.frame.size.width * 0.75;
    menuDrawerX = self.view.frame.origin.x  - menuDrawerWidth;
    menuDrawer = [[UIView alloc] initWithFrame:CGRectMake(menuDrawerX, self.view.frame.origin.y + statusBarHeight, menuDrawerWidth, self.view.frame.size.height - statusBarHeight)];
    menuDrawer.backgroundColor = [UIColor whiteColor];
    
    recognizer_close = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipes:)];
    recognizer_open = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipes:)];
    recognizer_close.direction = UISwipeGestureRecognizerDirectionLeft;
    recognizer_open.direction = UISwipeGestureRecognizerDirectionRight;
    
    [self.view addGestureRecognizer:recognizer_open];
    [self.view addGestureRecognizer:recognizer_close];
    
    UILabel *menuTitle = [[UILabel alloc] initWithFrame:CGRectMake(60.0f, 5.0f , 200.0f, 50.0f)];
    menuTitle.text = @"Menu Options";
    [menuDrawer addSubview:menuTitle];
                          
    
    [self.view addSubview:menuDrawer];

    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)menuButton:(id)sender {
    [self drawerAnimation];
}

-(void) handleSwipes: (UISwipeGestureRecognizer *) sender{
    [self drawerAnimation];
}

-(void) drawerAnimation{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:-5];
    
    CGFloat new_x = 0;
    if(menuDrawer.frame.origin.x < self.view.frame.origin.x){
        new_x = menuDrawer.frame.origin.x + menuDrawerWidth;
    }
    else{
        new_x = menuDrawer.frame.origin.x - menuDrawerWidth;
    }
    menuDrawer.frame  = CGRectMake(new_x, menuDrawer.frame.origin.y, menuDrawer.frame.size.width, menuDrawer.frame.size.height);
    
    [UIView commitAnimations];
}

/*
- (IBAction)menuButton:(id)sender {
}
 */

@end
