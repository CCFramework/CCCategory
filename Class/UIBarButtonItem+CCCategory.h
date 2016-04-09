//
//  UIBarButtonItem+CCCategory.h
//  CCCategoryDemo
//
//  Created by 李飞恒 on 16/4/8.
//  Copyright © 2016年 李飞恒. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (CCCategory)

/**
 *  初始化方法
 *
 *  @param imageName     默认图片
 *  @param highImageName 高亮图片
 *  @param target        target
 *  @param action        action
 *
 *  @return 返回一个XMCUIBarButtonItem对象
 */
+ (instancetype)barButtonItemWithImage:(NSString *)imageName
                             highImage:(NSString *)highImageName
                                target:(id)target
                                action:(SEL)action;

@end
