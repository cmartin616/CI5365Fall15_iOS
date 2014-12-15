//
//  poiDetailVC.m
//  StateFairPlanner
//
//  Created by Amy Baker on 12/6/14.
//  Copyright (c) 2014 Amy Baker. All rights reserved.
//

#import "poiDetailVC.h"
#import "NSObject+PlansModel.h"

@interface poiDetailVC ()
@property (weak, nonatomic) IBOutlet UILabel *poiLabel;
@property (weak, nonatomic) IBOutlet UILabel *durationLabel;
@property (weak, nonatomic) IBOutlet UITextView *poiDescription;
@property (weak, nonatomic) IBOutlet UILabel *areaLabel;

@end

@implementation poiDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    PlansModel* pm = [PlansModel SharedPlanModel];
    POI* poi = [pm getCurrentPOI];
    
    _poiLabel.text = poi->name;
    _poiDescription.text = poi->description;

    
    _durationLabel.text = [NSString stringWithFormat:@"%d", poi->dDuration];
    _areaLabel.text = poi->area;
    
    //region
    MKCoordinateRegion region;
    //center
    CLLocationCoordinate2D center;
    center.latitude = poi->dLat;
    center.longitude = poi->dLon;
    //span
    MKCoordinateSpan span;
    span.latitudeDelta = 0.003;
    span.longitudeDelta = 0.003;
    
    region.center = center;
    region.span = span;
    
    [_poiMap  setRegion:region animated:YES];
    
    MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
    [annotation setCoordinate:center];
    [annotation setTitle:poi->name];
    [self.poiMap addAnnotation:annotation];
    


    
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
