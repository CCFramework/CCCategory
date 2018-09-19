//
//  UIBarButtonItem+SSCategory.h
//  YYCK
//
//  Created by 李飞恒 on 2017/7/6.
//  Copyright © 2017年 李飞恒. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (SSCategory)

+ (UIBarButtonItem *)itemWithImageName:(NSString *)imageName highImageName:(NSString *)highImageName target:(id)target action:(SEL)action;

@end
