//
//  RegisterControllerViewController.m
//  AutismAssessment
//
//  Created by Chaitanya Agrawal on 01/10/14.
//  Copyright (c) 2014 Chaitanya Agrawal. All rights reserved.
//

#import "RegisterController.h"

@interface RegisterController ()

@end

@implementation RegisterController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[UILabel appearanceWhenContainedIn:[UITextField class], nil] setTextColor:[UIColor whiteColor]];
    // Do any additional setup after loading the view.
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
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

@end
