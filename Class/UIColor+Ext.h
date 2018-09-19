//
//  UIColor+Ext.h
//  bname
//
//  Created by iMac Maxt on 2018/7/22.
//  Copyright © 2018年 JerryLee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Ext)

//判断颜色是暗色还是亮色
- (BOOL)isLightColor;

- (UIColor *)colorAlpha:(CGFloat)alpha;

@end
