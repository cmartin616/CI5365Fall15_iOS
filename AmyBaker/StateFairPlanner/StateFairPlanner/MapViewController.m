//
//  MapViewController.m
//  StateFairPlanner
//
//  Created by Amy Baker on 11/13/14.
//  Copyright (c) 2014 Amy Baker. All rights reserved.
//

#import "MapViewController.h"

//State Fair
#define SF_LATITUDE 44.981114;
#define SF_LONGITUDE -93.167665;

#define SPAN_VALUE 0.01f;

@interface MapViewController ()

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //region
    MKCoordinateRegion region;
    //center    
    CLLocationCoordinate2D center;
    center.latitude = SF_LATITUDE;
    center.longitude = SF_LONGITUDE;
    //span
    MKCoordinateSpan span;
    span.latitudeDelta = SPAN_VALUE;
    span.longitudeDelta = SPAN_VALUE;
    
    region.center = center;
    region.span = span;
    
    [_mapView setRegion:region animated:YES];
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

@end
