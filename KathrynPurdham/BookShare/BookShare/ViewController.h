//
//  ViewController.h
//  BookShare
//
//  Created by Cindy Purdham on 12/3/14.
//  Copyright (c) 2014 U of M. All rights reserved.
//

#import <Parse/Parse.h>
#import "ProfileViewController.h"


@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *zipCode;
@property (weak, nonatomic) IBOutlet UITextField *City;
@property (weak, nonatomic) IBOutlet UITextField *address;
- (IBAction)loginAction:(id)sender;
- (IBAction)registerAction:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *reEnterPassword;
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UITextField *userName;


@end

