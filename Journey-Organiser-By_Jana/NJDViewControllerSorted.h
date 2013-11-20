//
//  NJDViewControllerSorted.h
//  Journey Organiser
//
//  Created by Jana on 21/05/2013.
//  Copyright (c) 2013 jana. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NJDViewControllerSorted;

@protocol NJDViewControllerSortedDelegate <NSObject>
//Variables
- (NSArray *)transport;
- (NSArray *)depart;
- (NSArray *)destination;
- (NSArray *)seat;
- (NSArray *)transportNumber;
- (NSArray *)details;
@end


@interface NJDViewControllerSorted : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (copy, nonatomic) NSArray *sortedOrder;

@property (nonatomic, weak) id <NJDViewControllerSortedDelegate> delegate;

@property (copy, nonatomic) NSArray *sortedTransport;
@property (copy, nonatomic) NSArray *sortedDepart;
@property (copy, nonatomic) NSArray *sortedDestination;
@property (copy, nonatomic) NSArray *sortedSeat;
@property (copy, nonatomic) NSArray *sortedTransportNumber;
@property (copy, nonatomic) NSArray *sortedDetails;

@property (nonatomic,assign) int position0;
@property (nonatomic,assign) int position1;
@property (nonatomic,assign) int position2;
@property (nonatomic,assign) int position3;

@end