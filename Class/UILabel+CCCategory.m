//
//  UILabel+CCCategory.m
//  CCCategoryDemo
//
//  Created by 李飞恒 on 16/4/9.
//  Copyright © 2016年 李飞恒. All rights reserved.
//

#import "UILabel+CCCategory.h"


@implementation UILabel (CCCategory)

- (instancetype)initWithFrame:(CGRect)frame text:(NSString *)text {
    self = [super initWithFrame:frame];
    if (self) {
        self.text = text;
    }
    return self;
}

@end
