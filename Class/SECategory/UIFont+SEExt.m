//
//  UIFont+SEExt.m
//  Bname
//
//  Created by iMac Maxt on 2018/8/8.
//  Copyright © 2018年 SanshengTechnologyLLC. All rights reserved.
//

#import "UIFont+SEExt.h"

//字体大小
#define kMaxs 20
#define kMax  18
#define kMid  16
#define kMin  14
#define kMins 12

@implementation UIFont (SEExt)

+ (instancetype)setupSizeMaxs
{
    return [UIFont fontWithSize:kMaxs];
}

+ (instancetype)setupSizeMax
{
    return [UIFont fontWithSize:kMax];
}

+ (instancetype)setupSizeMid
{
    return [UIFont fontWithSize:kMid];
}

+ (instancetype)setupSizeMin
{
    return [UIFont fontWithSize:kMin];
}

+ (instancetype)setupSizeMins
{
    return [UIFont fontWithSize:kMins];
}

@end
