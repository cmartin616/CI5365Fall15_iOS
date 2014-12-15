//
//  NSObject+PlansModel.m
//  StateFairPlanner
//
//  Created by Amy Baker on 12/6/14.
//  Copyright (c) 2014 Amy Baker. All rights reserved.
//

#import "NSObject+PlansModel.h"

@implementation POI

@end

@implementation PLAN

- (NSArray*) getPoiNames{
    
    NSMutableArray *ma = [[NSMutableArray alloc] init];

    for (POI *item in planSteps)
    {
        [ma addObject:item->name];
    }
    NSArray *array = [NSArray arrayWithArray:ma];
    return array;
}

- (void) addPoi:(POI*)aPoi{
    [planSteps addObject:aPoi];
}

// translates index of POI in this Plan to its normal index
- (int) poiIndex:(int)planIndex{
    PLAN* p = [planSteps objectAtIndex:planIndex];
    return p->index; // return POI index
}

@end

@implementation PlansModel

static PlansModel *PM = nil;

+ (PlansModel*) SharedPlanModel {
    if (PM == nil){
        PM = [[self allocWithZone:NULL] init];
        [PM initHelper];
    }
    return PM;
}

- (PLAN *) getCurrentPlan{
  return [planArray objectAtIndex:currentPlanIndex];
}

- (NSArray*) getPlanNames{
    NSMutableArray *ma = [[NSMutableArray alloc] init];
    for (PLAN *item in planArray)
    {
        [ma addObject:item->name];
    }
    NSArray *array = [NSArray arrayWithArray:ma];
    return array;
}

- (POI *) getCurrentPOI{
    return [poiArray objectAtIndex:currentPoiIndex];
}

- (POI*) addPoi:(NSString*)name :(NSString*)area :(NSString*)desc :(int)mins :(double)lat :(double)lon{
    POI *p = [[POI alloc] init];
    p->name = name;
    p->description = desc;
    p->area = area;
    p->dDuration = mins;
    p->dLat = lat;
    p->dLon = lon;
    p->index = [poiArray count];
    [poiArray addObject:p];
    return p;
}

- (PLAN*) addPlan:(NSString*)np{
    PLAN *p = [[PLAN alloc] init];
    p->name = np;
    p->index = [planArray count];
    p->planSteps = [[NSMutableArray alloc] init];
    [planArray addObject:p];
    return p;
}

- (NSArray*) getAllPoiNames{
    NSMutableArray *ma = [[NSMutableArray alloc] init];
    for (POI *item in poiArray)
    {
        [ma addObject:item->name];
    }
    NSArray *array = [NSArray arrayWithArray:ma];
    return array;
}

- (POI*) getPoi:(int)index{
    return [poiArray objectAtIndex:index];

}

- (POI*) getPoiByName:(NSString*)name{
    for (POI *item in poiArray)
    {
        if (item->name == name) return item;
    }
    return NULL;
}

- (void) initHelper{
    
    poiArray = [[NSMutableArray alloc] init];
    planArray = [[NSMutableArray alloc] init];
    
    [self addPoi:@"Visit West End Market":@"West End Market":@"The West End Market, completely redone in 2014, has MN vendors and unique food at The Blue Barn. The area also includes the Schell's stage for live entertainment.":40:44.981617f:-93.175607f];
    [self addPoi:@"Giant Slide":@"Carnes Avenue":@"Take a ride on the Giant Slide!":20:44.980358f:-93.17192f];
    [self addPoi:@"Sweet Martha's Cookies: Grandstand":@"Grandstand":@"These cookies are a Fair staple. Sweet Martha's nets the most revenue of any vendor at the Fair.":15:44.98109f:-93.174574f];
    [self addPoi:@"Sweet Martha's Cookies: Carnes Ave":@"Carnes Ave":@"These cookies are a Fair staple. Sweet Martha's nets the most revenue of any vendor at the Fair.":10:44.980358f:-93.17192f];
    [self addPoi:@"Lulu's Public House":@"West End Market":@"Some beers, a fish taco, and rooftop seating for an amazing view of the fireworks each night.":15:44.980358f:-93.17192f];
    [self addPoi:@"Sky Ride: West End Market":@"West End Market":@"Ride in style between West End Market and the Food Building plaza. Lucky riders can ride in unique cars like the police car, the ketchup and mustard car, or the cow car.":15:44.980358f:-93.17192f];
    [self addPoi:@"Sky Ride: Food Bldg":@"Leinie Lodge":@"Ride in style between West End Market and the Food Building plaza. Lucky riders can ride in unique cars like the police car, the ketchup and mustard car, or the cow car.":15:44.980358f:-93.17192f];
    [self addPoi:@"The Bazaar":@"Bazaar":@"The Bazaar features Summit beers, international vendors, and a stage that hosts a wide variety of acts. The Bazaar is one of the few venues open until 10pm, for those looking for someplace to hangout pre-fireworks!":15:44.978438f:-93.169422f];
    [self addPoi:@"Leinie Lodge":@"Leinie Lodge":@"Shows and beer. And giant adirondack chairs.":15:44.980308f:-93.168998f];
    [self addPoi:@"Visit the Alphabet Forest":@"Baldwin Park":@"Free, fun, Fair-centric activities for the young ones.":15:44.980358f:-93.17192f];
    [self addPoi:@"See Butterheads":@"Dairy Bldg":@"See Princess Kay and her runner ups all carved in blocks of butter!":15:44.978396f:-93.17095f];
   [self addPoi:@"O'Garas":@"Dan Patch":@"The St. Paul original has bagpipes, Guinness, and the only air conditioned public bathroom at the Fair. A great place to hangout in the rain.":15:44.980358f:-93.17192f];
    [self addPoi:@"Drink 1919 Rootbeer":@"Food Bldg":@"Your best family-friendly beverage choice at the Fair!":15:44.980358f:-93.17192f];
    [self addPoi:@"Enjoy Craft Beer":@"Hort Bldg":@"Local craft beer flights are so great. Not to be missed!":15:44.979231f:-93.169797f];
    [self addPoi:@"Sky Glider: Dan Patch":@"Dan Patch Ave":@"The Sky Glider slowly transports riders on a chair lift between Dan Patch Ave and the Pet Building.":15:44.980358f:-93.17192f];
    [self addPoi:@"Eat Crab Fritters":@"Pet Building":@"Best food ever.":15:44.980358f:-93.17192f];
    [self addPoi:@"Ride the Space Tower":@"Leinie Lodge":@"Ride up the iconic Space Tower for an amazing view of the Fairgrounds.":15:44.980358f:-93.17192f];
    [self addPoi:@"Ride the Kidway":@"Kidway":@"All the little kid rides your little kid heart desires.":15:44.980358f:-93.17192f];
    [self addPoi:@"Climb the Fire Tower":@"Carnes Ave":@"Free stairmaster! And great views from the top.":15:44.980358f:-93.17192f];
    [self addPoi:@"Spin a Paint":@"Carnes Ave":@"Fun at every age!":15:44.980358f:-93.17192f];
    [self addPoi:@"Pig Barn":@"The Barns":@"Don't forget your pig ears!":15:44.980358f:-93.17192f];
    [self addPoi:@"Cow Barn":@"The Barns":@"It doesn't get any cowier than this.":15:44.980358f:-93.17192f];
    [self addPoi:@"Horse Barn":@"The Barns":@"The Minnesota Zoo's draft horses are not to be missed.":15:44.980358f:-93.17192f];
    [self addPoi:@"Sheep Barn":@"The Barns":@"Be sure to check the show ring for judging. Nothing better than an uncooperative goat.":15:44.980358f:-93.17192f];
    [self addPoi:@"Bunny Barn":@"The Barns":@"The chapel of the Fair. Go worship the bunnies!":15:44.980358f:-93.17192f];
    [self addPoi:@"See the Creative Activities":@"Main Gate":@"A mecca of quilting, knitting, baking, and crafts!":15:44.980358f:-93.17192f];
    [self addPoi:@"Browse the Grandstand":@"Grandstand":@"The lower Grandstand is a particular favorite for shopping--don't miss the Salsa chopper demonstration!":15:44.980358f:-93.17192f];
    [self addPoi:@"Get a photo booth photo":@"Dan Patch":@"Inside the arcade are the old-fashioned photo booths. Cram inside! A Fair tradition!":15:44.980358f:-93.17192f];
    [self addPoi:@"Watch the fireworks":@"All over":@"The fireworks go off every night after the Grandstand show ends. Ooooh ahhhh!":15:44.980358f:-93.17192f];
    [self addPoi:@"See the crop art":@"Hort Bldg":@"Seed art. A must see.":15:44.979231f:-93.169797f];
    [self addPoi:@"See the Giant Pumpkin":@"Hort Bldg":@"The veggie room is especially nice at sunset.":15:44.979231f:-93.169797f];
    
   
    
    // PLAN's
    PLAN * pl;
    pl = [self addPlan:@"For the Stroller Set"];
    // [pl addPoi: [poiArray objectAtIndex:1]];
    [pl addPoi: [self getPoiByName:@"Visit West End Market"]];
    [pl addPoi: [self getPoiByName:@"Sky Ride: West End Market"]];
    [pl addPoi: [self getPoiByName:@"Drink 1919 Rootbeer"]];
    [pl addPoi: [self getPoiByName:@"Get a photo booth photo"]];
    [pl addPoi: [self getPoiByName:@"Spin a Paint"]];
    [pl addPoi: [self getPoiByName:@"Cow Barn"]];
    [pl addPoi: [self getPoiByName:@"Bunny Barn"]];
    [pl addPoi: [self getPoiByName:@"Climb the Fire Tower"]];
    [pl addPoi: [self getPoiByName:@"See Butterheads"]];
    [pl addPoi: [self getPoiByName:@"Giant Slide"]];
    [pl addPoi: [self getPoiByName:@"Ride the Space Tower"]];
    [pl addPoi: [self getPoiByName:@"The Bazaar"]];
    [pl addPoi: [self getPoiByName:@"Ride the Kidway"]];
    [pl addPoi: [self getPoiByName:@"Visit the Alphabet Forest"]];

    pl = [self addPlan:@"Boozin' It Up"];
    [pl addPoi: [self getPoiByName:@"Visit West End Market"]];
    [pl addPoi: [self getPoiByName:@"Lulu's Public House"]];
    [pl addPoi: [self getPoiByName:@"Sky Ride: West End Market"]];
    [pl addPoi: [self getPoiByName:@"Enjoy Craft Beer"]];
    [pl addPoi: [self getPoiByName:@"See the crop art"]];
    [pl addPoi: [self getPoiByName:@"Leinie Lodge"]];
    [pl addPoi: [self getPoiByName:@"The Bazaar"]];
    [pl addPoi: [self getPoiByName:@"O'Garas"]];
    [pl addPoi: [self getPoiByName:@"Watch the fireworks"]];
    
    pl = [self addPlan:@"Barn Stormin'"];
    [pl addPoi: [self getPoiByName:@"Visit West End Market"]];
    [pl addPoi: [self getPoiByName:@"Bunny Barn"]];
    [pl addPoi: [self getPoiByName:@"Horse Barn"]];
    [pl addPoi: [self getPoiByName:@"Pig Barn"]];
    [pl addPoi: [self getPoiByName:@"Sheep Barn"]];

    pl = [self addPlan:@"See It All or Die Trying"];
    [pl addPoi: [self getPoiByName:@"Visit West End Market"]];
    [pl addPoi: [self getPoiByName:@"Lulu's Public House"]];
    [pl addPoi: [self getPoiByName:@"Sky Ride: West End Market"]];
    [pl addPoi: [self getPoiByName:@"Leinie Lodge"]];
    [pl addPoi: [self getPoiByName:@"Drink 1919 Rootbeer"]];
    [pl addPoi: [self getPoiByName:@"Get a photo booth photo"]];
    [pl addPoi: [self getPoiByName:@"Spin a Paint"]];
    [pl addPoi: [self getPoiByName:@"Cow Barn"]];
    [pl addPoi: [self getPoiByName:@"Bunny Barn"]];
    [pl addPoi: [self getPoiByName:@"Climb the Fire Tower"]];
    [pl addPoi: [self getPoiByName:@"See Butterheads"]];
    [pl addPoi: [self getPoiByName:@"Giant Slide"]];
    [pl addPoi: [self getPoiByName:@"Ride the Space Tower"]];
    [pl addPoi: [self getPoiByName:@"The Bazaar"]];
    [pl addPoi: [self getPoiByName:@"Ride the Kidway"]];
    [pl addPoi: [self getPoiByName:@"Visit the Alphabet Forest"]];
    [pl addPoi: [self getPoiByName:@"Eat Crab Fritters"]];
    [pl addPoi: [self getPoiByName:@"See the Giant Pumpkin"]];
    [pl addPoi: [self getPoiByName:@"See the crop art"]];
    [pl addPoi: [self getPoiByName:@"O'Garas"]];
    [pl addPoi: [self getPoiByName:@"Browse the Grandstand"]];
    [pl addPoi: [self getPoiByName:@"Sweet Martha's Cookies: Grandstand"]];
    [pl addPoi: [self getPoiByName:@"See the Creative Activities"]];
    [pl addPoi: [self getPoiByName:@"Watch the fireworks"]];
    
    pl = [self addPlan:@"Date Night"];
    [pl addPoi: [self getPoiByName:@"Visit West End Market"]];
    [pl addPoi: [self getPoiByName:@"Lulu's Public House"]];
    [pl addPoi: [self getPoiByName:@"Sky Ride: West End Market"]];
    [pl addPoi: [self getPoiByName:@"Leinie Lodge"]];
    [pl addPoi: [self getPoiByName:@"Enjoy Craft Beer"]];
    [pl addPoi: [self getPoiByName:@"See the crop art"]];
    [pl addPoi: [self getPoiByName:@"Leinie Lodge"]];
    [pl addPoi: [self getPoiByName:@"The Bazaar"]];
    [pl addPoi: [self getPoiByName:@"Get a photo booth photo"]];
    [pl addPoi: [self getPoiByName:@"Watch the fireworks"]];
    
    pl = [self addPlan:@"Me Time at the Fair"];
    [pl addPoi: [self getPoiByName:@"Visit West End Market"]];
    [pl addPoi: [self getPoiByName:@"Browse the Grandstand"]];
    [pl addPoi: [self getPoiByName:@"Leinie Lodge"]];
    [pl addPoi: [self getPoiByName:@"Drink 1919 Rootbeer"]];
    [pl addPoi: [self getPoiByName:@"Cow Barn"]];
    [pl addPoi: [self getPoiByName:@"Bunny Barn"]];
    [pl addPoi: [self getPoiByName:@"See Butterheads"]];
    [pl addPoi: [self getPoiByName:@"The Bazaar"]];
    [pl addPoi: [self getPoiByName:@"Eat Crab Fritters"]];
    [pl addPoi: [self getPoiByName:@"See the Giant Pumpkin"]];
    [pl addPoi: [self getPoiByName:@"See the crop art"]];
    [pl addPoi: [self getPoiByName:@"See the Creative Activities"]];
    [pl addPoi: [self getPoiByName:@"Watch the fireworks"]];
    
    pl = [self addPlan:@"Peppercam Faves"];
    [pl addPoi: [self getPoiByName:@"Visit West End Market"]];
    [pl addPoi: [self getPoiByName:@"Lulu's Public House"]];
    [pl addPoi: [self getPoiByName:@"Sky Ride: West End Market"]];
    [pl addPoi: [self getPoiByName:@"Leinie Lodge"]];
    [pl addPoi: [self getPoiByName:@"Drink 1919 Rootbeer"]];
    [pl addPoi: [self getPoiByName:@"Get a photo booth photo"]];
    [pl addPoi: [self getPoiByName:@"Spin a Paint"]];
    [pl addPoi: [self getPoiByName:@"Cow Barn"]];
    [pl addPoi: [self getPoiByName:@"Bunny Barn"]];
    [pl addPoi: [self getPoiByName:@"Climb the Fire Tower"]];
    [pl addPoi: [self getPoiByName:@"See Butterheads"]];
    [pl addPoi: [self getPoiByName:@"Giant Slide"]];
    [pl addPoi: [self getPoiByName:@"Ride the Space Tower"]];
    [pl addPoi: [self getPoiByName:@"The Bazaar"]];
    [pl addPoi: [self getPoiByName:@"Visit the Alphabet Forest"]];
    [pl addPoi: [self getPoiByName:@"Eat Crab Fritters"]];
    [pl addPoi: [self getPoiByName:@"See the Giant Pumpkin"]];
    [pl addPoi: [self getPoiByName:@"See the crop art"]];
    [pl addPoi: [self getPoiByName:@"O'Garas"]];
    [pl addPoi: [self getPoiByName:@"Browse the Grandstand"]];
    [pl addPoi: [self getPoiByName:@"See the Creative Activities"]];
    [pl addPoi: [self getPoiByName:@"Watch the fireworks"]];
    
    
   // [pl addPoi: [poiArray objectAtIndex:0]];
   // [pl addPoi: [poiArray objectAtIndex:2]];
    
}

@end
