//
//  CALayer+CCategory.m
//  CustomFrameworkExample
//
//  Created by 李飞恒 on 16/3/17.
//  Copyright © 2016年 李飞恒. All rights reserved.
//

#import "CALayer+CCategory.h"

UIViewContentMode __VE_CAGravityToUIViewContentMode(NSString *gravity) {
    static NSDictionary *dic;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dic = @{ kCAGravityCenter:@(UIViewContentModeCenter),
                 kCAGravityTop:@(UIViewContentModeTop),
                 kCAGravityBottom:@(UIViewContentModeBottom),
                 kCAGravityLeft:@(UIViewContentModeLeft),
                 kCAGravityRight:@(UIViewContentModeRight),
                 kCAGravityTopLeft:@(UIViewContentModeTopLeft),
                 kCAGravityTopRight:@(UIViewContentModeTopRight),
                 kCAGravityBottomLeft:@(UIViewContentModeBottomLeft),
                 kCAGravityBottomRight:@(UIViewContentModeBottomRight),
                 kCAGravityResize:@(UIViewContentModeScaleToFill),
                 kCAGravityResizeAspect:@(UIViewContentModeScaleAspectFit),
                 kCAGravityResizeAspectFill:@(UIViewContentModeScaleAspectFill) };
    });
    if (!gravity) return UIViewContentModeScaleToFill;
    return (UIViewContentMode)((NSNumber *)dic[gravity]).integerValue;
}

NSString *__VE_UIViewContentModeToCAGravity(UIViewContentMode contentMode) {
    switch (contentMode) {
        case UIViewContentModeScaleToFill: return kCAGravityResize;
        case UIViewContentModeScaleAspectFit: return kCAGravityResizeAspect;
        case UIViewContentModeScaleAspectFill: return kCAGravityResizeAspectFill;
        case UIViewContentModeRedraw: return kCAGravityResize;
        case UIViewContentModeCenter: return kCAGravityCenter;
        case UIViewContentModeTop: return kCAGravityTop;
        case UIViewContentModeBottom: return kCAGravityBottom;
        case UIViewContentModeLeft: return kCAGravityLeft;
        case UIViewContentModeRight: return kCAGravityRight;
        case UIViewContentModeTopLeft: return kCAGravityTopLeft;
        case UIViewContentModeTopRight: return kCAGravityTopRight;
        case UIViewContentModeBottomLeft: return kCAGravityBottomLeft;
        case UIViewContentModeBottomRight: return kCAGravityBottomRight;
        default: return kCAGravityResize;
    }
}


@implementation CALayer (CCategory)

- (CGFloat)x {
    return self.frame.origin.x;
}
- (void)setX:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)y {
    return self.frame.origin.y;
}
- (void)setY:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)maxX {
    return CGRectGetMaxX(self.frame);
}
- (void)setMaxX:(CGFloat)maxX{};

- (CGFloat)maxY {
    return CGRectGetMaxY(self.frame);
}
- (void)setMaxY:(CGFloat)maxY{};

- (CGFloat)minX {
    return CGRectGetMinX(self.frame);
}
- (void)setMinX:(CGFloat)minX{};

- (void)setMinY:(CGFloat)minY{};
- (CGFloat)minY {
    return CGRectGetMinY(self.frame);
}

- (CGFloat)width {
    return self.frame.size.width;
}
- (void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}


- (CGFloat)height {
    return self.frame.size.height;
}
- (void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.width = height;
    self.frame = frame;
}

- (CGSize)size {
    return self.frame.size;
}
- (void)setSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

//--------
- (CGFloat)transformDepth {
    return self.transform.m34;
}

- (void)setTransformDepth:(CGFloat)transformDepth {
    CATransform3D d = self.transform;
    d.m34 = transformDepth;
    self.transform = d;
}

- (UIViewContentMode)contentMode {
    return __VE_CAGravityToUIViewContentMode(self.contentsGravity);
}

- (void)setContentMode:(UIViewContentMode)contentMode {
    self.contentsGravity = __VE_UIViewContentModeToCAGravity(contentMode);
}
//--------

- (CGFloat)transformRotation {
    NSNumber *v = [self valueForKeyPath:@"transform.rotation"];
    return v.doubleValue;
}

- (void)setTransformRotation:(CGFloat)v {
    [self setValue:@(v) forKeyPath:@"transform.rotation"];
}

- (CGFloat)transformRotationX {
    NSNumber *v = [self valueForKeyPath:@"transform.rotation.x"];
    return v.doubleValue;
}

- (void)setTransformRotationX:(CGFloat)transformRotationX {
    [self setValue:@(transformRotationX) forKeyPath:@"transform.rotation.x"];
}
- (CGFloat)transformRotationY {
    NSNumber *v = [self valueForKeyPath:@"transform.rotation.y"];
    return v.doubleValue;
}

- (void)setTransformRotationY:(CGFloat)transformRotationY {
    [self setValue:@(transformRotationY) forKeyPath:@"transform.rotation.y"];
}

- (CGFloat)transformRotationZ {
    NSNumber *v = [self valueForKeyPath:@"transform.rotation.z"];
    return v.doubleValue;
}

- (void)setTransformRotationZ:(CGFloat)transformRotationZ {
    [self setValue:@(transformRotationZ) forKeyPath:@"transform.rotation.z"];
}

- (CGFloat)transformScaleX {
    NSNumber *v = [self valueForKeyPath:@"transform.scale.x"];
    return v.doubleValue;
}

- (void)setTransformScaleX:(CGFloat)transformScaleX {
    [self setValue:@(transformScaleX) forKeyPath:@"transform.scale.x"];
}

- (CGFloat)transformScaleY {
    NSNumber *v = [self valueForKeyPath:@"transform.scale.y"];
    return v.doubleValue;
}

- (void)setTransformScaleY:(CGFloat)transformScaleY {
    [self setValue:@(transformScaleY) forKeyPath:@"transform.scale.y"];
}

- (CGFloat)transformScaleZ {
    NSNumber *v = [self valueForKeyPath:@"transform.scale.z"];
    return v.doubleValue;
}

- (void)setTransformScaleZ:(CGFloat)transformScaleZ {
    [self setValue:@(transformScaleZ) forKeyPath:@"transform.scale.z"];
}

- (CGFloat)transformScale {
    NSNumber *v = [self valueForKeyPath:@"transform.scale"];
    return v.doubleValue;
}

- (void)setTransformScale:(CGFloat)transformScale {
    [self setValue:@(transformScale) forKeyPath:@"transform.scale"];
}

- (CGFloat)transformTranslationX {
    NSNumber *v = [self valueForKeyPath:@"transform.translation.x"];
    return v.doubleValue;
}

- (void)setTransformTranslationX:(CGFloat)transformTranslationX {
    [self setValue:@(transformTranslationX) forKeyPath:@"transform.translation.x"];
}

- (CGFloat)transformTranslationY {
    NSNumber *v = [self valueForKeyPath:@"transform.translation.y"];
    return v.doubleValue;
}

- (void)setTransformTranslationY:(CGFloat)transformTranslationY {
    [self setValue:@(transformTranslationY) forKeyPath:@"transform.translation.y"];
}

- (CGFloat)transformTranslationZ {
    NSNumber *v = [self valueForKeyPath:@"transform.translation.z"];
    return v.doubleValue;
}

- (void)setTransformTranslationZ:(CGFloat)transformTranslationZ {
    [self setValue:@(transformTranslationZ) forKeyPath:@"transform.translation.z"];
}

//--------

- (void)addFadeAnimationWithDuration:(NSTimeInterval)duration curve:(UIViewAnimationCurve)curve {
    if (duration <= 0) return;
    
    NSString *mediaFunction;
    switch (curve) {
        case UIViewAnimationCurveEaseInOut: {
            mediaFunction = kCAMediaTimingFunctionEaseInEaseOut;
        } break;
        case UIViewAnimationCurveEaseIn: {
            mediaFunction = kCAMediaTimingFunctionEaseIn;
        } break;
        case UIViewAnimationCurveEaseOut: {
            mediaFunction = kCAMediaTimingFunctionEaseOut;
        } break;
        case UIViewAnimationCurveLinear: {
            mediaFunction = kCAMediaTimingFunctionLinear;
        } break;
        default: {
            mediaFunction = kCAMediaTimingFunctionLinear;
        } break;
    }
    
    CATransition *transition = [CATransition animation];
    transition.duration = duration;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:mediaFunction];
    transition.type = kCATransitionFade;
    [self addAnimation:transition forKey:@"yykit.fade"];
}

- (void)removePreviousFadeAnimation {
    [self removeAnimationForKey:@"yykit.fade"];
}

//--------


- (void)setLayerCornerRadiusWithWidth:(CGFloat)Width {
    if (self.frame.size.width != self.frame.size.height) {
        NSLog(@"宽高不一至,无法切圆");
        return;
    }
    //    self.masksToBounds = YES;//防止子元素溢出父视图。(注意,切勿添加clipsToBounds,否则阴影就无效果了)
    self.cornerRadius = Width/2;
    
}

- (void)setLayerCorerRadiusForm:(CGFloat)radius {
    self.masksToBounds = YES;//防止子元素溢出父视图。(注意,切勿添加clipsToBounds,否则阴影就无效果了)
    self.cornerRadius = radius;
}

- (void)setLayerShadowColor:(UIColor *)color
               shadowOffset:(CGSize )size
               shadowRadius:(CGFloat)radius
                      alpha:(CGFloat)alpha {
    
    self.shadowColor = color.CGColor;
    self.shadowOffset = size;
    self.shadowOpacity = YES;
    self.shadowRadius = radius;
    self.shadowOpacity = alpha;
}



@end

