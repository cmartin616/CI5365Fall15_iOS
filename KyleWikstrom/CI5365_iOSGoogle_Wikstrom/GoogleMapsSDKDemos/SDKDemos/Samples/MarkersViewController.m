#if !defined(__has_feature) || !__has_feature(objc_arc)
#error "This file requires ARC support."
#endif

#import "SDKDemos/Samples/MarkersViewController.h"

#import <GoogleMaps/GoogleMaps.h>

@implementation MarkersViewController {
  GMSMarker *_sydneyMarker;
  GMSMarker *_melbourneMarker;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:46.440863
                                                          longitude:-94.302423
                                                               zoom:15];
  GMSMapView *mapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];

  _sydneyMarker = [[GMSMarker alloc] init];
  _sydneyMarker.title = @"North Long Lake";
  _sydneyMarker.snippet = @"Minnesota";
  _sydneyMarker.position = CLLocationCoordinate2DMake(46.440863, -94.302423);
  _sydneyMarker.flat = NO;
  _sydneyMarker.rotation = 30.0;
  NSLog(@"sydneyMarker: %@", _sydneyMarker);

  GMSMarker *australiaMarker = [[GMSMarker alloc] init];
  australiaMarker.title = @"North Long Lake";
  australiaMarker.position = CLLocationCoordinate2DMake(46.440863,-94.302423);
  australiaMarker.appearAnimation = kGMSMarkerAnimationPop;
  australiaMarker.flat = YES;
  australiaMarker.draggable = YES;
  australiaMarker.groundAnchor = CGPointMake(0.5, 0.5);
  australiaMarker.icon = [UIImage imageNamed:@"boat"];
  australiaMarker.map = mapView;

  // Set the marker in Sydney to be selected
  mapView.selectedMarker = _sydneyMarker;

  self.view = mapView;
  self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(didTapAdd)];
}

- (void)didTapAdd {
  if (_sydneyMarker.map == nil) {
    _sydneyMarker.map = (GMSMapView *)self.view;
//    _sydneyMarker.rotation += 45.0;
  } else {
    _sydneyMarker.map = nil;
  }

  _melbourneMarker.map = nil;
  _melbourneMarker = [[GMSMarker alloc] init];
  _melbourneMarker.title = @"North Long Lake";
  _melbourneMarker.snippet = @"Minnesota";
  _melbourneMarker.position = CLLocationCoordinate2DMake(46.440863, -94.302423);
  _melbourneMarker.map = (GMSMapView *)self.view;
}


@end
