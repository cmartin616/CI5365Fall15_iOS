//
//  StartScreenViewController.m
//  BookShare
//
//  Created by Cindy Purdham on 12/5/14.
//  Copyright (c) 2014 U of M. All rights reserved.
//

#import "StartScreenViewController.h"
#import <Parse/Parse.h>

@interface StartScreenViewController ()

@end

@implementation StartScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

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

- (IBAction)register:(id)sender {
    [self performSegueWithIdentifier:@"register" sender:self];
}

- (IBAction)login:(id)sender {
    [self performSegueWithIdentifier:@"login" sender:self];
}
@end
