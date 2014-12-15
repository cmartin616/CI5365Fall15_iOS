//
//  MapViewController.h
//  BookShare
//
//  Created by Cindy Purdham on 12/9/14.
//  Copyright (c) 2014 U of M. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface MapViewController : UIViewController <MKMapViewDelegate>{
    
    IBOutlet MKMapView *mapView;
    
    
    NSMutableArray *username;
}
@property (nonatomic, retain) IBOutlet MKMapView *mapView;


- (IBAction)logoutAction:(id)sender;

@end
