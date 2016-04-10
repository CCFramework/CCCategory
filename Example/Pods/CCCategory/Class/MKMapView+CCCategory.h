//
//  MKMapView+CCCategory.h
//  CCCategoryDemo
//
//  Created by 李飞恒 on 16/4/9.
//  Copyright © 2016年 李飞恒. All rights reserved.
//

#import <MapKit/MapKit.h>

@interface MKMapView (CCCategory)

//判断是否已经超出中国范围
+ (BOOL)isLocationOutOfChina:(CLLocationCoordinate2D)location;

//转GCJ-02
+ (CLLocationCoordinate2D)transformFromWGSToGCJ:(CLLocationCoordinate2D)wgsLoc;


@end
