//
//  WelcomeViewController.m
//  ThoughtCatcher2
//
//  Created by Kris Isaacson on 11/19/14.
//  Copyright (c) 2014 Kris Isaacson. All rights reserved.
//

#import "WelcomeViewController.h"

@interface ViewController () {
    UIPopoverController *popover2Controller;
}

@end

@implementation WelcomeViewController

- (void)viewDidLoad {
    // Do any additional setup after loading the view.

    self.welcomeLabel.text = self.labelText;

}

- (void)didReceiveMemoryWarning {
    // Dispose of any resources that can be recreated.
    
    

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

}

@end
