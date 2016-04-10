//
//  UIButton+CCCategory.m
//  CCCategoryDemo
//
//  Created by 李飞恒 on 16/4/8.
//  Copyright © 2016年 李飞恒. All rights reserved.
//

#import "UIButton+CCCategory.h"
#import "UIView+CCCategory.h"

@implementation UIButton (CCCategory)

+ (instancetype)buttonWithType:(UIButtonType)buttonType
                         title:(NSString *)title
                    titleColor:(UIColor *)titleColor
                          font:(UIFont *)font
                      forState:(UIControlState)state
                  cornerRadius:(void(^)(NSInteger radius))radius {
    UIButton *button = [UIButton buttonWithType:buttonType];
    [button setTitle:title forState:state];
    [button setTitleColor:titleColor forState:state];
    button.layer.cornerRadius = button.height;
    button.layer.masksToBounds = YES;
    button.titleLabel.font = font;
    radius(button.layer.cornerRadius);
    return button;
}

@end
