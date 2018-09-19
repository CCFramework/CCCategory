//
//  SESystemsetup.h
//  SESystemsetup
//
//  Created by 李飞恒 on 2018/9/13.
//  Copyright © 2018年 JerryLee. All rights reserved.
//
//系统设置

#import <Foundation/Foundation.h>
#import "SEPushsetup.h"

@interface SESystemsetup : NSObject

/**
 搜索范围 m为单位  默认 5km
 */
@property (nonatomic, assign) NSInteger distance;

/**
 是否可以被搜索 默认YES
 */
@property (nonatomic) BOOL isSearchVisible;

@end
