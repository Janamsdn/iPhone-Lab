//
//  NJDViewControllerSorted.m
//  Journey Organiser
//
//  Created by Jana on 21/10/2013.
//  Copyright (c) 2013 Jana . All rights reserved.
//

#import "NJDViewControllerSorted.h"
#import "NJDViewController.h"


@interface NJDViewControllerSorted ()

@end

@implementation NJDViewControllerSorted

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;//[self.sortedOrder count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *SimpleTableIdentifier = @"SimpleTableIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SimpleTableIdentifier];
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:SimpleTableIdentifier];
    }
    
    int position;
    if(indexPath.row==0) {
        position = self.position0;
    }else if(indexPath.row==1) {
        position = self.position1;
    }else if(indexPath.row==2) {
        position = self.position2;
    }else {
        position = self.position3;
    }

    cell.textLabel.text = [NSString stringWithFormat:@"%@ - %@", self.delegate.transport[position],self.delegate.transportNumber[position]];
    cell.detailTextLabel.text =[NSString stringWithFormat:@"%@ > %@", self.delegate.depart[position],self.delegate.destination[position]];
    
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *message = [[NSString alloc] initWithFormat:@"%@ - %@\n\n%@ > %@\nSeat: %@\n\nDetails: %@", self.delegate.transport[indexPath.row],self.delegate.transportNumber[indexPath.row], self.delegate.depart[indexPath.row],self.delegate.destination[indexPath.row],self.delegate.seat[indexPath.row],self.delegate.details[indexPath.row]];
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"Transport Link"
                          message:message
                          delegate:self
                          cancelButtonTitle:@"Ok"
                          otherButtonTitles:nil];
    [alert show];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
- (IBAction)unsortButton:(id)sender{
    
    NJDViewController *mvc = [[NJDViewController alloc]initWithNibName:@"NJDViewController" bundle:nil];
    //[self presentModalViewController:mvc animated:NO];
    self.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController: mvc animated:YES completion:nil];
    
}

#pragma mark -
#pragma mark Table Delegate Methods

-(NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return indexPath;
    
}
@end
