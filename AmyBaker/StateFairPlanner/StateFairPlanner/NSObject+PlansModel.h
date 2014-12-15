//
//  NSObject+PlansModel.h
//  StateFairPlanner
//
//  Created by Amy Baker on 12/6/14.
//  Copyright (c) 2014 Amy Baker. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface POI : NSObject
{
    @public
    int index;
    NSString *name;
    NSString *description;
    NSString *area;
    double dLat;
    double dLon;
    int dDuration; // time activity typically takes in minutes

}
@end

@interface PLAN : NSObject
{
@public
    int index;
    NSString *name;
    NSMutableArray *planSteps;
}

- (NSArray*) getPoiNames;

- (void) addPoi:(POI*)aPoi;

- (int) poiIndex:(int)planIndex;

@end

@interface PlansModel : NSObject
{
    @public
    int currentPlanIndex;
    int currentPoiIndex;
    
    @private
    NSMutableArray *poiArray;
    NSMutableArray *planArray;

}

- (POI*) addPoi:(NSString*)name:(NSString*)area :(NSString*)desc :(int)mins :(double)lat :(double)lon ;
- (PLAN*) addPlan:(NSString*)np;

- (PLAN *) getCurrentPlan;
- (POI *) getCurrentPOI;

- (NSArray*) getPlanNames;

- (NSArray*) getAllPoiNames;
- (POI*) getPoi:(int)index;
- (POI*) getPoiByName:(NSString*)name;

- (void) initHelper;

+ (PlansModel *) SharedPlanModel;


@end
