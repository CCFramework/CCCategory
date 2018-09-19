//
//  UIBarButtonItem+CCCategory.m
//  CCCategoryDemo
//
//  Created by 李飞恒 on 16/4/8.
//  Copyright © 2016年 李飞恒. All rights reserved.
//

#import "UIBarButtonItem+CCCategory.h"

@implementation UIBarButtonItem (CCCategory)

+ (instancetype)barButtonItemWithImage:(NSString *)imageName
                             highImage:(NSString *)highImageName
                                target:(id)target
                                action:(SEL)action {
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.bounds = CGRectMake(0, 0, 30, 30);
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:highImageName] forState:UIControlStateHighlighted];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return  [[UIBarButtonItem alloc] initWithCustomView:button];
}

@end
