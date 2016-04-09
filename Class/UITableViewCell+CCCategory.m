//
//  UITableViewCell+CCCategory.m
//  CCCategoryDemo
//
//  Created by 李飞恒 on 16/4/9.
//  Copyright © 2016年 李飞恒. All rights reserved.
//

#import "UITableViewCell+CCCategory.h"

@implementation UITableViewCell (CCCategory)

+ (instancetype)cellNibWithFrmae:(CGRect)frame {
    UITableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] firstObject];
    [cell setFrame:frame];
    return cell;
}

@end
