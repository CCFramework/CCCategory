//
//  UIScrollView+Ext.m
//  bname
//
//  Created by iMac Maxt on 2018/9/9.
//  Copyright © 2018年 SanshengTechnologyLLC. All rights reserved.
//

#import "UIScrollView+Ext.h"
#import <objc/runtime.h>

@implementation UIScrollView (Ext)
static const void *kShowNoView = @"kShowNoView";


- (UIImageView *)placeImage
{
    UIImageView *placeImage = [[UIImageView alloc]init];
    placeImage.image = [UIImage imageNamed:kDefineImg];
    placeImage.contentMode =UIViewContentModeCenter;
    
    return placeImage;
}


- (UILabel *)textLabel
{
    UILabel  *_textLabel = [[UILabel alloc]init];
    _textLabel.textColor = kTitleColor1;
    _textLabel.font = [UIFont systemFontOfSize:15];
    _textLabel.text = kTextUnSources;
    _textLabel.numberOfLines = 0;
    _textLabel.textAlignment = NSTextAlignmentCenter;
    return _textLabel;
}
- (UIView *)containerV
{
    UIView *v = [[UIView alloc]init];
    v.tag = 8808;
    // v.backgroundColor = [UIColor redColor];
    return v;
    
}


#pragma mark - BOOL类型的动态绑定
- (BOOL)showNoView
{
    return [objc_getAssociatedObject(self, kShowNoView) boolValue];
}
- (BOOL)isShowNoView
{
    return [objc_getAssociatedObject(self, kShowNoView) boolValue];
}
- (void)setShowNoView:(BOOL)showNoView
{
    objc_setAssociatedObject(self, kShowNoView, [NSNumber numberWithBool:kShowNoView], OBJC_ASSOCIATION_ASSIGN);
}

- (void)showUnSourcesView:(NSString *)title placeImage:(UIImage *)img certer:(CGPoint)center
{
    
    UIView *containerV = [self containerV];
    
    containerV.width =[UIScreen mainScreen].bounds.size.width;
    // containerV.height = 100;
    UILabel     *label  = [self textLabel];
    UIImageView *iv     = [self placeImage];
    
    if (title) {
        label.text = title;
    }
    if (img) {
        iv.image = img;
    }
    
    
    iv.size = iv.image.size;
    iv.y = 0;
    iv.centerX  = containerV.width/2.0;
    label.width = containerV.width;
    [label sizeToFit];
    label.centerX = containerV.width/2.0;
    label.y = CGRectGetMaxY(iv.frame)+12;
    
    containerV.height = CGRectGetMaxY(label.frame);
    if (center.x > 0 && center.y > 0) {
        containerV.center = center;
    } else {
        containerV.x = 0;
        containerV.y = 100;
    }
    
    [containerV addSubview:iv];
    [containerV addSubview:label];
    [self addSubview: containerV];
    [self setShowNoView:YES];
    
}

- (void)dismissUnSourcesView
{
    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj.tag == 8808) {
            [obj removeFromSuperview];
            [self setShowNoView:NO];
        }
    }];
}



@end
