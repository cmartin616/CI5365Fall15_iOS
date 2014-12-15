//
//  LoginViewController.h
//  BookShare
//
//  Created by Cindy Purdham on 12/5/14.
//  Copyright (c) 2014 U of M. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface LoginViewController : UIViewController
- (IBAction)loginAction:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *loginPassword;
@property (weak, nonatomic) IBOutlet UITextField *loginUsername;
- (IBAction)registerAction:(id)sender;

@end
