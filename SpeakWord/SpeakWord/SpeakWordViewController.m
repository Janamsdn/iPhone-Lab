//
//  SpeakWordViewController.m
//  SpeakWord
//
//  Created by Jana on 04/11/2013.
//  Copyright (c) 2013 jana. All rights reserved.
//

#import "SpeakWordViewController.h"
#import "UNIHTTPJsonResponse.h"
#import "UNIRest.h"
#import "UNISimpleRequest.h"

@interface SpeakWordViewController ()
{
    
}

@end

@implementation SpeakWordViewController

@synthesize text;
@synthesize responseLbl;

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

// hide keyboard
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [text resignFirstResponder];
}

// click on btn 
- (IBAction)speechWord
{
    
    // Get ing string
    NSString* encodedString ;
    NSString *enterText = self.text.text;
    NSRange whiteSpaceRange = [enterText rangeOfCharacterFromSet:[NSCharacterSet whitespaceCharacterSet]];
    if (whiteSpaceRange.location != NSNotFound) {
        // add space=%20 because API call expecting
       encodedString = [enterText stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding] ;
    }
    else{
        encodedString=enterText;
    }
    
   // Key -X-Mashape-Authorization
    NSDictionary* headers = [NSDictionary dictionaryWithObjectsAndKeys:@"I3EOfETMa5MVT4L2AoeyIfmKK6u0slGK", @"X-Mashape-Authorization", nil];
  // NSDictionary* parameters = [NSDictionary dictionaryWithObjectsAndKeys:enterText,@"name",nil];
     NSDictionary* parameters = [NSDictionary dictionaryWithObjectsAndKeys:nil];
        
    UNIHTTPJsonResponse* response = [[UNIRest get:^(UNISimpleRequest * request) {
        [request setUrl:[NSString stringWithFormat:@"https://yoda.p.mashape.com/yoda?sentence=%@",encodedString]];
         //[request setUrl:[NSString stringWithFormat:@"http://httpbin.org/get?name=%@",enterText]];
         [request setHeaders:headers];
         [request setParameters:parameters];
    }] asJson];
    
    // if 200 geting sucess 
    if (200 == response.code)
    {
        NSDictionary* args = [response.body.object valueForKey:@"args"];
        self.responseLbl.text= enterText;//[args valueForKey:@"sentence"];//currenly args geting null 
        NSLog (@"args = %@" , args);
    }
    else{
        NSDictionary* args = [response.body.object valueForKey:@"args"];
        NSLog (@"args = %@" , args);
        
    }
    

 
}

@end
