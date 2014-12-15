#if !defined(__has_feature) || !__has_feature(objc_arc)
#error "This file requires ARC support."
#endif

#import "SDKDemos/Samples/MarkerInfoWindowViewController.h"

#import <GoogleMaps/GoogleMaps.h>

@interface MarkerInfoWindowViewController ()<GMSMapViewDelegate>
@end

@implementation MarkerInfoWindowViewController {
  GMSMarker *_sydneyMarker;
  GMSMarker *_melbourneMarker;
  GMSMarker *_brisbaneMarker;
  UIView *_contentView;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:48.781833
                                                          longitude:-96.011508
                                                               zoom:8.5];
  GMSMapView *mapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];


  _sydneyMarker = [[GMSMarker alloc] init];
  _sydneyMarker.title = @"Karlstad";
  _sydneyMarker.snippet = @"Population: 747";
  _sydneyMarker.position = CLLocationCoordinate2DMake(48.578199, -96.521504);
  _sydneyMarker.map = mapView;
  NSLog(@"sydneyMarker: %@", _sydneyMarker);


  _melbourneMarker.map = nil;
  _melbourneMarker = [[GMSMarker alloc] init];
  _melbourneMarker.title = @"Newfolden";
  _melbourneMarker.snippet = @"Population: 368";
  _melbourneMarker.position = CLLocationCoordinate2DMake(48.356754, -96.326670);
  _melbourneMarker.map = mapView;
  NSLog(@"melbourneMarker: %@", _melbourneMarker);

  _brisbaneMarker.map = nil;
  _brisbaneMarker = [[GMSMarker alloc] init];
  _brisbaneMarker.title = @"Hallock";
  _brisbaneMarker.snippet = @"Population: 968";
  _brisbaneMarker.position = CLLocationCoordinate2DMake(48.775216, -96.946894);
  _brisbaneMarker.map = mapView;
  NSLog(@"brisbaneMarker: %@", _brisbaneMarker);

  _contentView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"aeroplane"]];

  mapView.delegate = self;
  self.view = mapView;
}

#pragma mark GMSMapViewDelegate

- (UIView *)mapView:(GMSMapView *)mapView markerInfoWindow:(GMSMarker *)marker {
  if (marker == _sydneyMarker) {
    return _contentView;
  }
  return nil;
}

- (UIView *)mapView:(GMSMapView *)mapView markerInfoContents:(GMSMarker *)marker {
  if (marker == _brisbaneMarker) {
    return _contentView;
  }
  return nil;
}

@end
