//
//  ViewController.m
//  AutismAssessment
//
//  Created by Chaitanya Agrawal on 12/09/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "MissionController.h"

@interface MissionController ()



@end

@implementation MissionController


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"NavBar.png"] forBarMetrics:UIBarMetricsDefault];
    
 
    return YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"NavBar.png"] forBarMetrics:UIBarMetricsDefault];

    
    //[self setNeedsStatusBarAppearanceUpdate];
    
    [scroller setScrollEnabled:YES];
    [scroller setContentSize:CGSizeMake(320, 1000)];
    
   
 
    
	// Do any additional setup after loading the view, typically from a nib.
}




- (BOOL)prefersStatusBarHidden {
    return NO;
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}


 


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
NSShadow *shadow = [[NSShadow alloc] init];
shadow.shadowColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.8];
shadow.shadowOffset = CGSizeMake(0, 1);
[[UINavigationBar appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:
                                                       [UIColor colorWithRed:245.0/255.0 green:245.0/255.0 blue:245.0/255.0 alpha:1.0], NSForegroundColorAttributeName,
                                                       shadow, NSShadowAttributeName,
                                                       [UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:21.0], NSFontAttributeName, nil]];
 */


@end
