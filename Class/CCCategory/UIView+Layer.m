//
//  UIView+Layer.m
//  bname
//
//  Created by administrator on 2018/7/12.
//  Copyright © 2018年 JerryLee. All rights reserved.
//

#import "UIView+Layer.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIView (Layer)

- (void)addShadeBtn:(CGRect)make {
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];//colorWithRed:64 green:149 blue:216 alpha:1  colorWithRed:0 green:238 blue:238 alpha:1
    gradientLayer.colors = @[(id)[UIColor colorWithRed:64.0/255.0 green:149.0/255.0 blue:216.0/255.0 alpha:1].CGColor, (id)[UIColor colorWithRed:0.0/255.0 green:238.0/255.0 blue:238.0/255.0 alpha:1].CGColor];
    gradientLayer.locations = @[@0.0,@1.0];
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1, 0);
    gradientLayer.frame = make;
    [self.layer insertSublayer:gradientLayer atIndex:0];
}



-(void)addCellLine {
    UIView *separatorViews = [self viewWithTag:4444];
    if (separatorViews) {
        return;
    }
    UIView *separatorView = [[UIView alloc] initWithFrame:CGRectMake(10, self.bounds.size.height-0.5, kWidth-20, 0.5)];
    separatorView.tag = 4444;
    separatorView.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:separatorView];
}

- (void)addFullWidthLine:(CGFloat)height{
    UIView *separatorViews = [self viewWithTag:5555];
    if (separatorViews) {
        return;
    }
    UIView *separatorView = [[UIView alloc] initWithFrame:CGRectMake(0, height-0.5, kWidth, 0.5)];
    separatorView.backgroundColor = [UIColor lightGrayColor];
    separatorView.tag = 5555;
    [self addSubview:separatorView];
}

- (void)addVersionUpdateOrigin {
    UIView *origin = [[UIView alloc] initWithFrame:CGRectMake(79, 11, 7, 7)];
    origin.backgroundColor = [UIColor redColor];
    origin.layer.cornerRadius = 3.5;
    origin.layer.masksToBounds = YES;
    [self addSubview:origin];
}

// 计算文本的高度
- (CGFloat)labHeight:(UILabel*)lab{
    NSDictionary *attribute = @{NSFontAttributeName:lab.font};
    CGSize size = [lab.text boundingRectWithSize:CGSizeMake(lab.frame.size.width, MAXFLOAT)
                                         options: NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading
                                      attributes:attribute
                                         context:nil].size;
    return size.height;
}

+ (instancetype)addSupView:(UIView *)aView
{
    UIView *view = [[super alloc] init];
    
    [aView addSubview:view];
    return view;
}



- (void)startAnimationRotation
{
    CABasicAnimation *animation =  [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    //默认是顺时针效果，若将fromValue和toValue的值互换，则为逆时针效果
    animation.fromValue = [NSNumber numberWithFloat:0.f];
    animation.toValue =  [NSNumber numberWithFloat: M_PI *2];
    animation.duration  = 6.0f;
    animation.autoreverses = NO;
    animation.fillMode = kCAFillModeForwards;
    animation.repeatCount = MAXFLOAT; //如果这里想设置成一直自旋转，可以设置为MAXFLOAT，否则设置具体的数值则代表执行多少次
    [self.layer addAnimation:animation forKey:nil];

}

- (void)startAnimationBalanus
{
    CABasicAnimation *animation =  [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
    //默认是顺时针效果，若将fromValue和toValue的值互换，则为逆时针效果
    animation.fromValue = [NSNumber numberWithFloat:0.f];
    animation.toValue =  [NSNumber numberWithFloat: M_PI *2];
    animation.duration  = 6.0f;
    animation.autoreverses = NO;
    animation.fillMode = kCAFillModeForwards;
    animation.repeatCount = MAXFLOAT; //如果这里想设置成一直自旋转，可以设置为MAXFLOAT，否则设置具体的数值则代表执行多少次
    [self.layer addAnimation:animation forKey:nil];
}

- (void)anticlockwiseRotateViewDuration:(NSTimeInterval)duration
{
    CABasicAnimation* rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 ];
    rotationAnimation.duration = duration ? duration : 0.5;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = 2;
    [self.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}

- (void)clockwiseRotateViewDuration:(NSTimeInterval)duration
{
    CABasicAnimation* rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: -M_PI * 2.0 ];
    rotationAnimation.duration = duration ? duration : 0.5;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = HUGE_VALF;
    [self.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}


- (void)stopAnimation
{
    [self.layer removeAllAnimations];
}



/**
 截图
 */
- (UIImage *)screenshot
{
    // 下面方法，第一个参数表示区域大小。第二个参数表示是否是非透明的。如果需要显示半透明效果，需要传NO，否则传YES。第三个参数就是屏幕密度了，关键就是第三个参数。
    UIGraphicsBeginImageContextWithOptions(self.size, NO, [UIScreen mainScreen].scale);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (void)borderWidth:(CGFloat)width color:(UIColor *)color
{
    // 设置边框及边框颜色
    self.layer.borderWidth = width;
    self.layer.borderColor = [color CGColor];
}


- (UIViewController *)supportViewController
{
    for (UIView *next = [self superview]; next; next = next.superview) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}

@end
