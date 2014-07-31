//
//  MapViewController.h
//  maps_test
//
//  Created by Georgii on 7/23/14.
//  Copyright (c) 2014 tryparse. All rights reserved.
//

#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIKit.h>
#import <Mapbox-iOS-SDK/Mapbox.h>
#import "SWRevealViewController/SWRevealViewController.h"

@interface MapViewController : UIViewController <SWRevealViewControllerDelegate>
//@property (nonatomic) double lat;
//@property (nonatomic) double lon;
//@property (nonatomic) int days;

// a class "property"
+ (double) lat;
+ (void) setLat:(double)value;
+ (double) lon;
+ (void) setLon:(double)value;
+ (int) days;
+ (void) setDays:(int)value;

@end
