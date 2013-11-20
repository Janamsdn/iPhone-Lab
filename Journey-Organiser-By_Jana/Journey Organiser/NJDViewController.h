//
//  NJDViewController.h
//  Journey Organiser
//
//  Created by Jana on 21/05/2013.
//  Copyright (c) 2013 Jana. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "NJDViewControllerSorting.h"
#import "NJDViewControllerSorted.h"

@class NJDViewControllerSorted;

@protocol NJDViewControllerDelegate <NSObject>
//Variables
@end

@interface NJDViewController : UIViewController <UITableViewDataSource, UITableViewDelegate,NJDViewControllerSortedDelegate>
@property (nonatomic, weak) id <NJDViewControllerDelegate> delegate;

@property (copy, nonatomic) NSDictionary *content;

@property (copy, nonatomic) NSArray *ID;
@property (copy, nonatomic) NSArray *transport;
@property (copy, nonatomic) NSArray *depart;
@property (copy, nonatomic) NSArray *destination;
@property (copy, nonatomic) NSArray *seat;
@property (copy, nonatomic) NSArray *transportNumber;
@property (copy, nonatomic) NSArray *details;

@property (strong, nonatomic) NJDViewControllerSorting *sortingInstance;
@property (strong, nonatomic) NJDViewControllerSorted *sortedInstance;

- (IBAction)sortButton:(id)sender;

@end
