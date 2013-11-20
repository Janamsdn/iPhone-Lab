//
//  HelloWorldViewController.m
//  HelloWorld
//
//  Created by Jana on 28/10/2013.
//  Copyright (c) 2013 jana. All rights reserved.
//

#import "HelloWorldViewController.h"

@interface HelloWorldViewController ()

@end

@implementation HelloWorldViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction)showmessage;{
   

    UIAlertView *helloWorldAlert = [[UIAlertView alloc]
                                    initWithTitle:@"Jaba First App " message:@"Hello, Jana!" delegate:nil cancelButtonTitle:@"Okey" otherButtonTitles:nil];
    // show alert
    [helloWorldAlert show];
}

@end
