//
//  SEFavoriteButton.h
//  bname
//
//  Created by iMac Maxt on 2018/8/17.
//  Copyright © 2018年 SanshengTechnologyLLC. All rights reserved.
//

#import "SEButton.h"

IB_DESIGNABLE
@interface SEFavoriteButton : SEButton

@property (nonatomic, strong) IBInspectable UIImage *image;
@property (nonatomic, strong) IBInspectable UIColor *favoredColor;
@property (nonatomic, strong) IBInspectable UIColor *defaultColor;
@property (nonatomic, strong) IBInspectable UIColor *circleColor;
@property (nonatomic, strong) IBInspectable UIColor *lineColor;
@property (nonatomic, assign) IBInspectable CGFloat duration;


@end
