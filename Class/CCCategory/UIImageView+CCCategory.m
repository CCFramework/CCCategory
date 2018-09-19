//
//  UIImageView+CCCategory.m
//  CCCategoryDemo
//
//  Created by 李飞恒 on 16/4/9.
//  Copyright © 2016年 李飞恒. All rights reserved.
//

#import "UIImageView+CCCategory.h"
#import "UIView+CCCategory.h"
#import "UIImage+CCCategory.h"
#import "CALayer+CCCategory.h"

@implementation UIImageView (CCCategory)

- (instancetype)initWithRadiusFrame:(CGRect)frame {
    return [[UIImageView alloc] imageWithRadiusFrame:frame radius:frame.size.width*0.5];
}

- (instancetype)imageWithRadiusFrame:(CGRect)frame radius:(CGFloat)radius {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
    imageView.layer.cornerRadius = radius;
    imageView.layer.masksToBounds = YES;
    return imageView;
}

- (void)setImageBorderWidth:(CGFloat)borderWidth borderColor:(UIColor *)brderColor {
    [self.layer setLayerBorderWidth:borderWidth borderColor:brderColor];
    self.layer.masksToBounds = YES;
    self.userInteractionEnabled = YES;
    self.layer.rasterizationScale = [UIScreen mainScreen].scale;
}


- (instancetype)imageWithName:(NSString *)imageName frame:(CGRect)frame {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
    imageView.image = [UIImage imageNamed:imageName];
    return imageView;
}
- (instancetype)imageWithPNGName:(NSString *)imageName frame:(CGRect)frame {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
    imageView.image = [UIImage imageWithPNGFileName:imageName];
    return imageView;
}

- (instancetype)imageWithMPEGName:(NSString *)imageName frame:(CGRect)frame {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
    imageView.image = [UIImage imageWithMPEGFileName:imageName];
    return imageView;
}


@end
