//
//  NJDViewController.m
//  Journey Organiser
//
//  Created by Jana on 21/10/2013.
//  Copyright (c) 2013 Jana . All rights reserved..
//

#import "NJDViewController.h"

@interface NJDViewController ()

@end

@implementation NJDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSString *path = [[NSBundle mainBundle] pathForResource:@"NJDTravelCards" ofType:@"plist"];
    
    self.content = [NSDictionary dictionaryWithContentsOfFile:path];
    
    self.ID = self.content[@"ID"];
    
    self.transport = self.content[@"Transport"];
    self.depart = self.content[@"Depart"];
    self.destination = self.content[@"Destination"];
    self.transportNumber = self.content[@"TransportNumber"];
    self.seat = self.content[@"Seat"];
    self.details = self.content[@"Details"];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.transport count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *SimpleTableIdentifier = @"SimpleTableIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SimpleTableIdentifier];
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:SimpleTableIdentifier];
    }
    

    
    cell.textLabel.text = [NSString stringWithFormat:@"%@ - %@", self.transport[indexPath.row],self.transportNumber[indexPath.row]];
    cell.detailTextLabel.text =[NSString stringWithFormat:@"%@ > %@", self.depart[indexPath.row],self.destination[indexPath.row]];

    
    return cell;
}


#pragma mark -
#pragma mark Table Delegate Methods

-(NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {

        return indexPath;

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *message = [[NSString alloc] initWithFormat:@"%@ - %@\n\n%@ > %@\nSeat: %@\n\nDetails: %@", self.transport[indexPath.row],self.transportNumber[indexPath.row], self.depart[indexPath.row],self.destination[indexPath.row],self.seat[indexPath.row],self.details[indexPath.row]];
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"Transport Link"
                          message:message
                          delegate:self
                          cancelButtonTitle:@"Ok"
                          otherButtonTitles:nil];
    [alert show];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (IBAction)sortButton:(id)sender {
    [UIView beginAnimations:@"View Change" context:nil];
    [UIView setAnimationDuration:1.0];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    
    if (self.sortingInstance == nil) {
        self.sortingInstance = [[NJDViewControllerSorting alloc] initWithNibName:@"NJDViewControllerSorting" bundle:nil];
        //self.sortingInstance.delegate = self;
    }
    [UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:self.view cache:NO];
    
    [self.view addSubview:self.sortingInstance.view];
    [self.sortingInstance.view setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    
    //self.sortingInstance.activity.enabled = YES;
    
    [UIView commitAnimations];
    
    [self sort];
}

- (void)sort {
    int currentCard[] = {0,1,2,3};
    int nextCard[]  = {-1,-1,-1,-1};
    
    int newOrder[] = {0,0,0,0};
    
    for(int i = 0;i<[self.ID count];i++) {
        nextCard[i] = [self findNextCard:currentCard[i]];
        NSLog(@"%d>%d",currentCard[i],nextCard[i]);
    }
    
    int tripCount = [self.ID count];
    
    int position = tripCount-1;
    int target = -1;
        
    for(int i = 0;i<tripCount;i++) {
        if(nextCard[i]==target) {
            newOrder[position] = i;
        }
    }
    
    for(int i = 0;i<tripCount-1;i++) {
        target = newOrder[position];
        position--;
        
        for(int i = 0;i<tripCount;i++) {
            if(nextCard[i]==target) {
                newOrder[position] = i;
            }
        }
    }
    
    NSLog(@"%d",newOrder[0]);
    NSLog(@"%d",newOrder[1]);
    NSLog(@"%d",newOrder[2]);
    NSLog(@"%d",newOrder[3]);
    
    if (self.sortedInstance == nil) {
        self.sortedInstance = [[NJDViewControllerSorted alloc] initWithNibName:@"NJDViewControllerSorted" bundle:nil];
        self.sortedInstance.delegate = self;
    }
    self.sortedInstance.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController: self.sortedInstance animated:YES completion:nil];
    
    //NSArray *sortedOrder2 = {newOrder[0],newOrder[1],newOrder[2],newOrder[3]};
    
    //self.sortedInstance.sortedOrder = @[[newOrder[0] ]];
    self.sortedInstance.position0 = newOrder[0];
    self.sortedInstance.position1 = newOrder[1];
    self.sortedInstance.position2 = newOrder[2];
    self.sortedInstance.position3 = newOrder[3];
}


-(int)findNextCard:(int)currentCard {
    NSString *potentialStartDestination = self.destination[currentCard];
    int nextCard = -1;
    for(int i = 0;i<[self.ID count];i++) {
        if([potentialStartDestination isEqualToString:self.depart[i]]) {
            nextCard = i;
            break;
        }
    }
    return nextCard;
}

@end
