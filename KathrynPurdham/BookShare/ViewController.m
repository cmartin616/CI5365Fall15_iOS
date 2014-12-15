//
//  ViewController.m
//  BookShare
//
//  Created by Cindy Purdham on 12/3/14.
//  Copyright (c) 2014 U of M. All rights reserved.
//

#import "ViewController.h"
#import <Parse/Parse.h>


@interface ViewController ()

@property (nonatomic, readwrite) double latitude;
@property (nonatomic, readwrite) double longitude;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
       // Do any additional setup after loading the view, typically from a nib.
}
/*
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    ProfileViewController *pvc = [segue destinationViewController];
}*/

- (void)viewDidAppear:(BOOL)animated {
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginAction:(id)sender {
    [self performSegueWithIdentifier:@"toLogin" sender:self];
}

- (IBAction)registerAction:(id)sender {
    [_userName resignFirstResponder];
    [_email resignFirstResponder];
    [_password resignFirstResponder];
    [_reEnterPassword resignFirstResponder];
    [_address resignFirstResponder];
    [_City resignFirstResponder];
    [_zipCode resignFirstResponder];
    
    [self checkFieldsComplete];
    
}

-(void) checkFieldsComplete {
    if ([_userName.text isEqualToString:@""] || [_email.text isEqualToString:@""] || [_password.text isEqualToString:@""] || [_reEnterPassword.text isEqualToString:@""] || [_address.text isEqualToString: @""] || [_City.text isEqualToString: @""] || [_zipCode.text isEqualToString: @""]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oooops!" message:@"You need to complete all fields." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    else {
        [self checkPasswordsMatch];
    }
}

-(void) checkPasswordsMatch {
    if (![_password.text isEqualToString:_reEnterPassword.text]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oooops!" message:@"Passwords don't match." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    else {
        [self geocodeAddress];
    }
}


-(void) geocodeAddress{
    
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    NSString *state=@"Minnesota";
    
    NSString *fullAddress = [NSString stringWithFormat:@"%@, %@, %@, %@", _address.text, _City.text, state, _zipCode.text];
    NSLog(@"fullAddress = %@", fullAddress);
    [geocoder geocodeAddressString:fullAddress
                 completionHandler:^(NSArray *placemarks, NSError *error) {
                     
                     if (error) {
                         NSLog(@"Geocode failed with error: %@", error);
                         return;
                     }
                     
                     if(placemarks && placemarks.count > 0)
                     {
                         CLPlacemark *placemark = placemarks[0];
                         CLLocation *location = placemark.location;
                         CLLocationCoordinate2D coords =
                         location.coordinate;
                         
                         NSLog(@"Latitude = %f, Longitude = %f",
                               coords.latitude, coords.longitude);
                         
                         _latitude = coords.latitude;
                         _longitude = coords.longitude;
                         [self registerNewUser];
                     }
                     else{
                         NSLog(@"Error: %@", error);
                     }
                 }];
    
}

-(void) registerNewUser{
    PFUser *newUser = [PFUser user];
    newUser.username = _userName.text;
    newUser.password = _password.text;
    newUser.email = _email.text;
    newUser[@"address"] = _address.text;
    newUser[@"city"] = _City.text;
    newUser[@"zipcode"] = _zipCode.text;
    newUser[@"longitude"] = @(_longitude);
    newUser[@"latitude"] = @(_latitude);
    NSLog(@"Latitude2 = %f, Longitude2 = %f", _latitude, _longitude);
    
    [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            NSLog(@"Registration was successful.");
            _userName.text = nil;
            _email.text = nil;
            _password.text = nil;
            _reEnterPassword.text = nil;
            _address.text = nil;
            _City.text = nil;
            _zipCode.text = nil;
            [self performSegueWithIdentifier:@"registerToProfile" sender:self];
        }
        
        else {
            NSLog(@"There was an error with registration.");
            
        }
    }];
    
}




@end
