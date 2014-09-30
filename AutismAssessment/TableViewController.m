//
//  tableTableViewController.m
//  AutismAssessment
//
//  Created by Chaitanya Agrawal on 29/09/14.
//  Copyright (c) 2014 Chaitanya Agrawal. All rights reserved.
//

#import "TableViewController.h"
#import "TableCell.h"

@interface tableTableViewController ()

@end

@implementation tableTableViewController

@synthesize menuDrawerWidth, menuDrawerX, recognizer_close, recognizer_open, menuItems, mainTitle;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    _Title = @[@"Chaitanya Agrawal",
               @"Shubham Bakshi",
               @"Vardan Tandon",
               @"Sean Frost",
               @"Archit Sachdeva",
               @"Sam Fallahi",
               @"Dhruv Goel",
               @"Isha Maggu",];
    
    _Description = @[@"Hi",
                     @"Bye",
                     @"Guy",
                     @"Sly",
                     @"Phenyl",
                     @"Shamail",
                     @"File",
                     @"Dial",];
    
    _Images = @[@"ChaitanyaAgrawal.jpg",
                @"ShubhamBakshi.jpg",
                @"VardanTandon.jpg",
                @"SeanFrost.jpg",
                @"ArchitSachdeva.jpg",
                @"SamFallahi.jpg",
                @"DhruvGoel.jpg",
                @"IshaMaggu.jpg",];
    
    menuDrawerWidth = self.view.frame.size.width * 0.75;
    menuDrawerX = self.view.frame.origin.x  - menuDrawerWidth;
    menuDrawer = [[UIView alloc] initWithFrame:CGRectMake(menuDrawerX, self.view.frame.origin.y , menuDrawerWidth, self.view.frame.size.height)]; //+ statusBarHeight to y axis co-ordinate for shifting slider menu below the status bar, -statusBarHeight from height for not extending the slider menu to the bottom
    menuDrawer.backgroundColor = [UIColor whiteColor];
    
    recognizer_close = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipes:)];
    recognizer_open = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipes:)];
    recognizer_close.direction = UISwipeGestureRecognizerDirectionLeft;
    recognizer_open.direction = UISwipeGestureRecognizerDirectionRight;
    
    [self.view addGestureRecognizer:recognizer_open];
    [self.view addGestureRecognizer:recognizer_close];
    
    UILabel *menuTitle = [[UILabel alloc] initWithFrame:CGRectMake(60.0f, 5.0f , 200.0f, 50.0f)];
    menuTitle.text = @"Shubham Bakshi";
    [menuDrawer addSubview:menuTitle];
    
    UILabel *menuEmail = [[UILabel alloc] initWithFrame:CGRectMake(60.0f, 25.0f , 200.0f, 50.0f)];
    menuEmail.text = @"abc@gmail.com";
    [menuDrawer addSubview:menuEmail];
    
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
    int buttonSeparator = 2;
    
    menuItems = [[NSArray alloc]initWithObjects:@"My Cases",@"Our Mission", @"Tutorial",@"Contact Us",@"Settings",@"Sign Out", nil ];
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

    
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)menuSelect:(id)sender{
    NSString *selectedTitle = [menuItems objectAtIndex:[sender tag]];
    mainTitle.text = selectedTitle;
    [self drawerAnimation];
}

/*
- (IBAction)menuButton:(id)sender {
}
 */

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


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return _Title.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"TableCell";
    TableCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    long row = [indexPath row];
    
    cell.titleLabel.text = _Title[row];
    cell.DescriptionLabel.text = _Description[row];
    cell.thumbImage.image = [UIImage imageNamed:_Images[row]];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}



// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}


// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
