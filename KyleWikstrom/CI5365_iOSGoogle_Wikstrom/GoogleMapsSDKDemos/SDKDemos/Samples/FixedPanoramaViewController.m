#if !defined(__has_feature) || !__has_feature(objc_arc)
#error "This file requires ARC support."
#endif

#import "SDKDemos/Samples/FixedPanoramaViewController.h"

#import <GoogleMaps/GoogleMaps.h>

static CLLocationCoordinate2D kPanoramaNear = {44.9844435, -93.1820597};

@interface FixedPanoramaViewController () <GMSPanoramaViewDelegate>
@end

@implementation FixedPanoramaViewController {
  GMSPanoramaView *view_;
}

- (void)viewDidLoad {
  [super viewDidLoad];

  view_ = [GMSPanoramaView panoramaWithFrame:CGRectZero
                              nearCoordinate:kPanoramaNear];
  view_.camera = [GMSPanoramaCamera cameraWithHeading:260
                                                pitch:0
                                                 zoom:0];
  view_.delegate = self;
  view_.orientationGestures = NO;
  view_.navigationGestures = NO;
  view_.navigationLinksHidden = YES;
  self.view = view_;
}

@end
