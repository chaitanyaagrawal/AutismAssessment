//
//  LoginController.m
//  AutismAssessment
//
//  Created by Chaitanya Agrawal on 30/09/14.
//  Copyright (c) 2014 Chaitanya Agrawal. All rights reserved.
//

#import "LoginController.h"

@interface LoginController ()

@end

@implementation LoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[UILabel appearanceWhenContainedIn:[UITextField class], nil] setTextColor:[UIColor whiteColor]];
    // Do any additional setup after loading the view.
}


- (BOOL)prefersStatusBarHidden {
    return YES;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
