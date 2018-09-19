//
//  SEButton.m
//  SEUI
//
//  Created by iMac Maxt on 2018/7/31.
//  Copyright © 2018年 SanshengTechnologyLLC. All rights reserved.
//

#import "SEButton.h"
#import <UIView+CCCategory.h>
#import "UIView+Layer.h"

@implementation SEButton

- (void)setIsBnameTheme:(BOOL)isBnameTheme
{
    _isBnameTheme = isBnameTheme;
    
    if (isBnameTheme) {
        [self addShadeBtn:self.bounds];
    }
}

- (void)setRadianValue:(CGFloat)radianValue
{
    _radianValue = radianValue;
    
    [self setCornerRadius:radianValue];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
