//
//  LoginViewController.m
//  BookShare
//
//  Created by Cindy Purdham on 12/5/14.
//  Copyright (c) 2014 U of M. All rights reserved.
//

#import "LoginViewController.h"
#import "ViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated {
    PFUser *user = [PFUser currentUser];
    if (user.username != nil) {
        [self performSegueWithIdentifier:@"loginToProfile" sender:self];
    }}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)registerAction:(id)sender {
    [self performSegueWithIdentifier:@"toRegister" sender:self];
}
- (IBAction)loginAction:(id)sender {
    [PFUser logInWithUsernameInBackground:_loginUsername.text password:_loginPassword.text block:^(PFUser *user, NSError *error){
        if (!error){
            NSLog(@"Login user!");
            _loginUsername.text = nil;
            _loginPassword.text = nil;
            
            [self performSegueWithIdentifier:@"loginToProfile" sender:self];
        }
        if (error){
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Ooops!" message:@"Login was unsuccessful!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
        }
        
    }];
}
@end
