//
//  WelcomeViewController.h
//  ThoughtCatcher2
//
//  Created by Kris Isaacson on 11/19/14.
//  Copyright (c) 2014 Kris Isaacson. All rights reserved.
//

#import <UIKit/UIKit.h>
@import CoreImage;

@interface ViewController :

@property (weak, nonatomic) IBOutlet UILabel *welcomeLabel;
@property (weak, nonatomic) NSString *labelText;
@property (weak, nonatomic) IBOutlet UISwitch *toggleCamera;
@property (weak, nonatomic) IBOutlet UIImageView *displayImageView;

- (IBAction)chooseImage:(id)sender;


@end
