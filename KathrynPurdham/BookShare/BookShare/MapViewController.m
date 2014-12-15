//
//  MapViewController.m
//  BookShare
//
//  Created by Cindy Purdham on 12/9/14.
//  Copyright (c) 2014 U of M. All rights reserved.
//

#import "MapViewController.h"
#import <Parse/Parse.h>
#import "Annotation.h"

@interface MapViewController ()

@property (nonatomic, readwrite) NSMutableArray *lat;
@property (nonatomic, readwrite) NSMutableArray *lon;
@end

#define THE_SPAN 0.90f;
@implementation MapViewController
@synthesize mapView;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MKCoordinateRegion myRegion;
    
    CLLocationCoordinate2D center;
    center.latitude = 45;
    center.longitude = -93.2;
    
    MKCoordinateSpan span;
    span.latitudeDelta = THE_SPAN;
    span.longitudeDelta = THE_SPAN;
    
    myRegion.center = center;
    myRegion.span = span;
    
    [mapView setRegion:myRegion animated:YES];
    
    NSMutableArray *locations = [[NSMutableArray alloc] init];
    CLLocationCoordinate2D location;
    Annotation *myAnn;
    
    MKPointAnnotation *myAnnotation = [[MKPointAnnotation alloc]init];
    CLLocationCoordinate2D pinCoordinate;
    pinCoordinate.latitude = 44.944745;
    pinCoordinate.longitude = -93.094445;
    myAnnotation.title = @"Test 3";
    myAnnotation.subtitle = @"";
    myAnnotation.coordinate = pinCoordinate;
    [self.mapView addAnnotation:myAnnotation];

    
   /* PFQuery *query = [PFUser query];
    [query selectKeys:@[@"latitude", @"longitude", @"username"]];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error){
            _lat = [[NSMutableArray alloc] init];
            _lon = [[NSMutableArray alloc] init];
            username = [[NSMutableArray alloc] init];
        };
        
        for (PFObject *object in objects){
            [self->_lat addObject:[object objectForKey:@"latitude"]];
           // NSLog(@"lat = %@", _lat);
            [self->_lon addObject:[object objectForKey:@"longitude"]];
           // NSLog(@"lon = %@", _lon);
            [self->username addObject: [object objectForKey:@"username"]];
            //NSLog(@"username = %@", username);
        } */
        
      /*  myAnn = [[Annotation alloc] init];
        location.latitude = 44.944739;
        location.longitude = -93.094437;
        myAnn.coordinate = location;
        myAnn.title = @"Test 3";
        myAnn.subtitle = @"";
        [locations addObject: myAnn];*/
        
        myAnn = [[Annotation alloc] init];
        location.latitude = 44.93992930231084;
        location.longitude = -93.16708100017871;
        myAnn.coordinate = location;
        myAnn.title = @"Test 2";
        myAnn.subtitle = @"";
        [locations addObject: myAnn];
    
        myAnn = [[Annotation alloc] init];
        location.latitude = 45.10142;
        location.longitude = -93.2609499;
        myAnn.coordinate = location;
        myAnn.title = @"Test";
        myAnn.subtitle = @"";
        [locations addObject: myAnn];
    
    
        [self.mapView addAnnotations:locations];
        
        
       /* int i;
        int count;
        count = [_lat count];
        NSLog(@"count = %d", count);
        for (int i=0; i<count; i++)
            location.latitude = [[NSString stringWithFormat: @"%@", [_lat objectAtIndex:i]] floatValue];
            NSLog(@"location.latitude = %f", location.latitude);
            location.longitude = [[NSString stringWithFormat: @"%@", [_lon objectAtIndex:i]] floatValue];
            myAnn = [[Annotation alloc] init];
            myAnn.coordinate = location;
            NSLog(@"myAnn = %@", myAnn);
            myAnn.title = @"Title";
            myAnn.subtitle = @"Subtitle";
            [locations addObject: myAnn];
            NSLog(@"locations = %@", locations);
            [self.mapView addAnnotations:locations];*/
    //}];

}


-(MKAnnotationView *) mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    MKPinAnnotationView *MyPin=[[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"current"];
    MyPin.pinColor = MKPinAnnotationColorPurple;
    
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    [rightButton addTarget:self action:@selector(button:) forControlEvents:UIControlEventTouchUpInside];
    
    MyPin.rightCalloutAccessoryView = rightButton;
    MyPin.draggable = NO;
    MyPin.highlighted = YES;
    MyPin.animatesDrop=TRUE;
    MyPin.canShowCallout = YES;
    
    return MyPin;
}

-(void)button:(id)sender {
    
    NSLog(@"Button action");
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewDidUnload{
    [self setMapView:nil];
    [super viewDidUnload];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)logoutAction:(id)sender {
    [PFUser logOut];
    PFUser *currentUser = [PFUser currentUser];
    [self performSegueWithIdentifier:@"mapToStartScreen" sender:self];
}
@end
