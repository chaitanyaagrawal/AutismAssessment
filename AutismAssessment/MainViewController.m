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

/*
- (id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:<#nibNameOrNil#> bundle:<#nibBundleOrNil#>];
    if(self){
        
    }
    return self;
}
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    int statusBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height;
    menuDrawerWidth = self.view.frame.size.width * 0.75;
    menuDrawerX = self.view.frame.origin.x  - menuDrawerWidth;
    menuDrawer = [[UIView alloc] initWithFrame:CGRectMake(menuDrawerX, self.view.frame.origin.y + statusBarHeight, menuDrawerWidth, self.view.frame.size.height - statusBarHeight)];
    menuDrawer.backgroundColor = [UIColor redColor];
    
    recognizer_close = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipes:)];
    recognizer_open = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipes:)];
    recognizer_close.direction = UISwipeGestureRecognizerDirectionLeft;
    recognizer_open.direction = UISwipeGestureRecognizerDirectionRight;
    
    [self.view addGestureRecognizer:recognizer_open];
    [self.view addGestureRecognizer:recognizer_close];
    
    UILabel *menuTitle = [[UILabel alloc] initWithFrame:CGRectMake(60.0f, 5.0f , 200.0f, 50.0f)];
    menuTitle.text = @"Menu";
    [menuDrawer addSubview:menuTitle];
    
    UIScrollView *m_scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(3.0f, 65.0f, menuDrawerWidth, menuDrawer.frame.size.height)];
    [m_scrollView setScrollEnabled:YES];
    [m_scrollView setShowsHorizontalScrollIndicator:NO];
    [m_scrollView setShowsVerticalScrollIndicator:YES];
    [m_scrollView setBackgroundColor:[UIColor clearColor]];
    [m_scrollView setIndicatorStyle:UIScrollViewIndicatorStyleDefault];
    [m_scrollView setCanCancelContentTouches:NO];
    [m_scrollView setClipsToBounds:YES];
    
    float originOfButtons = 10.0f;
    float buttonWidth = 227.0f;
    float buttonHeight = 50.0f;
    int buttonSeparator = 10;
    
    menuItems = [[NSArray alloc]initWithObjects:@"Page1",@"Page 2", @"Page3",@"Page 4",@"Page5",@"Page 6",@"Page7",@"Page 8", nil ];
    for(int b=0; b<[menuItems count];b++)
    {
        UIButton *myButton = [[UIButton alloc]initWithFrame:CGRectMake(3.0f, originOfButtons, buttonWidth, buttonHeight)];
        myButton.backgroundColor = [UIColor blueColor];
        [myButton setTag:b];
        [myButton setTitle:[menuItems objectAtIndex:b] forState:UIControlStateNormal];
        [myButton setSelected:false];
        [myButton addTarget:self action:@selector(menuSelect:) forControlEvents:UIControlEventTouchUpInside];
        
        [m_scrollView addSubview:myButton];
        
        originOfButtons += (buttonHeight + buttonSeparator);
    }

    [m_scrollView setContentSize:CGSizeMake([m_scrollView bounds].size.width, originOfButtons+85)];
    
    [menuDrawer addSubview:m_scrollView];
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

- (void)menuSelect:(id)sender{
    NSString *selectedTitle = [menuItems objectAtIndex:[sender tag]];
    mainTitle.text = selectedTitle;
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



@end
