#if !defined(__has_feature) || !__has_feature(objc_arc)
#error "This file requires ARC support."
#endif

#import "SDKDemos/Samples/TrafficMapViewController.h"

#import <GoogleMaps/GoogleMaps.h>

@implementation TrafficMapViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:44.980639
                                                          longitude:-93.253420
                                                               zoom:12];

  GMSMapView *mapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];
  mapView.trafficEnabled = YES;
  self.view = mapView;
}

@end
