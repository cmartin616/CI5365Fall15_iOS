#if !defined(__has_feature) || !__has_feature(objc_arc)
#error "This file requires ARC support."
#endif

#import "SDKDemos/Samples/MarkerLayerViewController.h"

#import <GoogleMaps/GoogleMaps.h>

@interface CoordsList : NSObject
@property(nonatomic, readonly, copy) GMSPath *path;
@property(nonatomic, readonly) NSUInteger target;

- (id)initWithPath:(GMSPath *)path;

- (CLLocationCoordinate2D)next;

@end

@implementation CoordsList

- (id)initWithPath:(GMSPath *)path {
  if ((self = [super init])) {
    _path = [path copy];
    _target = 0;
  }
  return self;
}

- (CLLocationCoordinate2D)next {
  ++_target;
  if (_target == [_path count]) {
    _target = 0;
  }
  return [_path coordinateAtIndex:_target];
}

@end

@implementation MarkerLayerViewController {
  GMSMapView *mapView_;
  GMSMarker *fadedMarker_;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  mapView_ = [[GMSMapView alloc] init];
  mapView_.camera = [GMSCameraPosition cameraWithLatitude:46.512357 longitude:-93.372815 zoom:7];
  mapView_.delegate = self;
  self.view = mapView_;

  GMSMutablePath *coords;
  GMSMarker *marker;

  // Create a plane that flies to several airports around western Europe.
  coords = [GMSMutablePath path];
  [coords addLatitude:47.952383 longitude:-97.181260];
  [coords addLatitude:46.926986 longitude:-96.816143];
  [coords addLatitude:46.403060 longitude:-94.129486];
  [coords addLatitude:44.882836 longitude:-93.222707];
  marker = [GMSMarker markerWithPosition:[coords coordinateAtIndex:0]];
  marker.icon = [UIImage imageNamed:@"aeroplane"];
  marker.groundAnchor = CGPointMake(0.5f, 0.5f);
  marker.flat = YES;
  marker.map = mapView_;
  marker.userData = [[CoordsList alloc] initWithPath:coords];
  [self animateToNextCoord:marker];

  // Create a boat that moves around the Baltic Sea.
  coords = [GMSMutablePath path];
  [coords addLatitude:46.780719 longitude:-92.086320];
  [coords addLatitude:46.778411 longitude:-92.043099];
  [coords addLatitude:46.802304 longitude:-92.003960];
  [coords addLatitude:46.978070 longitude:-91.542052];
  [coords addLatitude:46.838400 longitude:-91.543941];
  [coords addLatitude:47.120600 longitude:-91.133373];  // final point
  [coords addLatitude:47.787585 longitude:-89.801095];  // final point
  [coords addLatitude:47.945708 longitude:-89.667302];  // and back again
  marker = [GMSMarker markerWithPosition:[coords coordinateAtIndex:0]];
  marker.icon = [UIImage imageNamed:@"boat"];
  marker.map = mapView_;
  marker.userData = [[CoordsList alloc] initWithPath:coords];
  [self animateToNextCoord:marker];
}

- (void)animateToNextCoord:(GMSMarker *)marker {
  CoordsList *coords = marker.userData;
  CLLocationCoordinate2D coord = [coords next];
  CLLocationCoordinate2D previous = marker.position;

  CLLocationDirection heading = GMSGeometryHeading(previous, coord);
  CLLocationDistance distance = GMSGeometryDistance(previous, coord);

  // Use CATransaction to set a custom duration for this animation. By default, changes to the
  // position are already animated, but with a very short default duration. When the animation is
  // complete, trigger another animation step.

  [CATransaction begin];
  [CATransaction setAnimationDuration:(distance / (50 * 1000))];  // custom duration, 50km/sec

  __weak MarkerLayerViewController *weakSelf = self;
  [CATransaction setCompletionBlock:^{
    [weakSelf animateToNextCoord:marker];
  }];

  marker.position = coord;

  [CATransaction commit];

  // If this marker is flat, implicitly trigger a change in rotation, which will finish quickly.
  if (marker.flat) {
    marker.rotation = heading;
  }
}

- (void)fadeMarker:(GMSMarker *)marker {
  fadedMarker_.opacity = 1.0f;  // reset previous faded marker

  // Fade this new marker.
  fadedMarker_ = marker;
  fadedMarker_.opacity = 0.5f;
}

#pragma mark - GMSMapViewDelegate

- (BOOL)mapView:(GMSMapView *)mapView didTapMarker:(GMSMarker *)marker {
  [self fadeMarker:marker];
  return YES;
}

- (void)mapView:(GMSMapView *)mapView didTapAtCoordinate:(CLLocationCoordinate2D)coordinate {
  [self fadeMarker:nil];
}

@end
