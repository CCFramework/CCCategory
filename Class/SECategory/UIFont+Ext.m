//
//  UIFont+Ext.m
//  Bname
//
//  Created by administrator on 2018/8/1.
//  Copyright © 2018年 SanshengTechnologyLLC. All rights reserved.
//

#import "UIFont+Ext.h"

@implementation UIFont (Ext)

+ (instancetype)fontWithSize:(float)size {
    return [UIFont systemFontOfSize:size];
}

+ (instancetype)fontTTFWithSize:(CGFloat)fontSize
{
    return [UIFont fontWithName:@"Bauhaus93.TTF" size:fontSize];
}

@end
