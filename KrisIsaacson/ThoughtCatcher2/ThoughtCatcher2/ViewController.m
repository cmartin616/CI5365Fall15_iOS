//
//  ViewController.m
//  ThoughtCatcher2
//
//  Created by Kris Isaacson on 11/12/14.
//  Copyright (c) 2014 Kris Isaacson. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
    - (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
        
        
        WelcomeViewController *svc = [segue destinationViewController];
        svc.labelText = self.userName.text;

}

@end
