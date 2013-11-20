//
//  SimpleTableCell.h
//  SimpleTableView
//
//  Created by Jana on 28/10/2013.
//  Copyright (c) 2013 jana. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SimpleTableCell:UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UILabel *prepTimeLabel;
@property (nonatomic, weak) IBOutlet UIImageView *thumbnailImageView;

@end
