//
//  ViewController.h
//  AutismAssessment
//
//  Created by Chaitanya Agrawal on 12/09/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MissionController : UIViewController{
    IBOutlet UIScrollView *scroller;
}


-(UIStatusBarStyle)preferredStatusBarStyle;

- (BOOL)prefersStatusBarHidden ;

@end
