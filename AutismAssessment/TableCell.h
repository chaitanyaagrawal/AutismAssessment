//
//  TableCell.h
//  AutismAssessment
//
//  Created by Chaitanya Agrawal on 29/09/14.
//  Copyright (c) 2014 Chaitanya Agrawal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableCell : UITableViewCell


@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *DescriptionLabel;
@property (strong, nonatomic) IBOutlet UIImageView *thumbImage;


@end
