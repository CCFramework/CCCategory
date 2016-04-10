//
//  UIButton+CCCategory.h
//  CCCategoryDemo
//
//  Created by 李飞恒 on 16/4/8.
//  Copyright © 2016年 李飞恒. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (CCCategory)

+ (instancetype)buttonWithType:(UIButtonType)buttonType
                         title:(NSString *)title
                    titleColor:(UIColor *)titleColor
                         font:(UIFont *)font
                      forState:(UIControlState)state
                  cornerRadius:(void(^)(NSInteger radius))radius;

@end
