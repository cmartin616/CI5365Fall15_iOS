#if !defined(__has_feature) || !__has_feature(objc_arc)
#error "This file requires ARC support."
#endif

#import "SDKDemos/Samples/BasicMapViewController.h"

#import <GoogleMaps/GoogleMaps.h>

@implementation BasicMapViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:46.512357
                                                          longitude:-93.372815
                                                               zoom:7];
  self.view = [GMSMapView mapWithFrame:CGRectZero camera:camera];
}

@end
