//
//  Annotation.h
//  BookShare
//
//  Created by Cindy Purdham on 12/9/14.
//  Copyright (c) 2014 U of M. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface Annotation : NSObject <MKAnnotation>

@property(nonatomic, assign) CLLocationCoordinate2D coordinate;
@property(nonatomic, copy) NSString *title;
@property(nonatomic, copy) NSString *subtitle;

@end
