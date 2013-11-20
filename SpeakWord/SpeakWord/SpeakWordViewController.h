//
//  SpeakWordViewController.h
//  SpeakWord
//
//  Created by Jana on 04/11/2013.
//  Copyright (c) 2013 jana. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SpeakWordViewController : UIViewController

-(IBAction)speechWord;//btn
@property (strong, nonatomic) IBOutlet UITextField *text;//txtField
@property (strong, nonatomic) IBOutlet UILabel *responseLbl;//response

@end
