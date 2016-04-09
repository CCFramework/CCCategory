//
//  CALayer+CCCategory.m
//  CCCategoryDemo
//
//  Created by 李飞恒 on 16/4/5.
//  Copyright © 2016年 MuZiLee. All rights reserved.
//

#import "CALayer+CCCategory.h"

UIViewContentMode __CC_CAGravityToUIViewContentMode(NSString *gravity) {
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

NSString *__CC_UIViewContentModeToCAGravity(UIViewContentMode contentMode) {
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

@implementation CALayer (CCCategory)

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
- (void)setMaxY:(CGFloat)maxY {};

- (CGFloat)minX {
    return CGRectGetMinX(self.frame);
}
- (void)setMinX:(CGFloat)minX {};

- (CGFloat)minY {
    return CGRectGetMinY(self.frame);
}
- (void)setMinY:(CGFloat)minY {};

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
    frame.size.height = height;
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

#pragma makr - init
+ (instancetype)cc_createLayer {
    CAGradientLayer *layer = [CAGradientLayer layer];
    layer.startPoint = CGPointMake(0, 0);
    layer.endPoint   = CGPointMake(0, 1);
    layer.locations  = @[@(0), @(0.03), @(0.1)];
    layer.colors = @[(__bridge id)[UIColor colorWithWhite:0 alpha:0.0].CGColor,
                     (__bridge id)[UIColor colorWithWhite:0 alpha:0.1].CGColor,
                     (__bridge id)[UIColor colorWithWhite:0 alpha:1].CGColor];
    return layer;
}

#pragma mark - tranform.rotation
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


#pragma mark - tranform
- (CGFloat)transformDepth {
    return self.transform.m34;
}

- (void)setTransformDepth:(CGFloat)transformDepth {
    CATransform3D d = self.transform;
    d.m34 = transformDepth;
    self.transform = d;
}

- (UIViewContentMode)contentMode {
    return __CC_CAGravityToUIViewContentMode(self.contentsGravity);
}

- (void)setContentMode:(UIViewContentMode)contentMode {
    self.contentsGravity = __CC_UIViewContentModeToCAGravity(contentMode);
}


#pragma makr - Animation
- (void)cc_setFadeAnimationWithDuration:(NSTimeInterval)duration curve:(UIViewAnimationCurve)curve {
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
    [self addAnimation:transition forKey:@"__CC_Category.fade"];
}

- (void)cc_removePreviousFadeAnimation {
    [self removeAnimationForKey:@"__CC_Category.fade"];
}


- (CAAnimation *)cc_animationShake:(NSArray *)rotations
                       duration:(NSTimeInterval)duration
                    repeatCount:(NSUInteger)repeatCount {
    //创建关键帧动画
    CAKeyframeAnimation *kfa = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation.z"];
    
    kfa.values = rotations;
    kfa.duration = duration;
    kfa.repeatCount=repeatCount;
    kfa.removedOnCompletion = YES;
    [self addAnimation:kfa forKey:@"rotation"];
    
    return kfa;
}

- (CATransition *)cc_transitionWithAnimType:(CGAffineTransformType)animType
                                 subType:(CGAffineTransformSubType)subType
                                   curve:(CGAffineTransformCurve)curve
                                duration:(CGFloat)duration {
    
    NSString *key = @"transition";
    
    if ([self animationForKey:key] != nil) {
        [self removeAnimationForKey:key];
    }
    
    CATransition *transition = [CATransition animation];
    transition.duration = duration;//动画时长
    transition.type     = [self cc_privateAnimaTypeWithTransitionType:animType];//动画类型
    transition.subtype  = [self cc_privateAnimaSubtype:subType];//动画方向
    transition.timingFunction = [CAMediaTimingFunction functionWithName:[self cc_privateCurve:curve]];//缓动函数
    transition.removedOnCompletion = YES;//完成动画删除
    [self addAnimation:transition forKey:key];
    
    return transition;
}

/**  返回动画曲线 */
- (NSString *)cc_privateCurve:(CGAffineTransformCurve)curve{
    
    //曲线数组
    NSArray *funcNames = @[kCAMediaTimingFunctionDefault,kCAMediaTimingFunctionEaseIn,kCAMediaTimingFunctionEaseInEaseOut,kCAMediaTimingFunctionEaseOut,kCAMediaTimingFunctionLinear];
    
    return [self cc_privateObjFromArray:funcNames index:curve isRamdom:(CGAffineTransformCurveRamdom == curve)];
}

/**  返回动画方向 */
- (NSString *)cc_privateAnimaSubtype:(CGAffineTransformSubType)subType{
    //设置转场动画的方向
    NSArray *subtypes = @[kCATransitionFromTop,kCATransitionFromLeft,kCATransitionFromBottom,kCATransitionFromRight];
    
    return [self cc_privateObjFromArray:subtypes index:subType isRamdom:(CGAffineTransformSubTypeFromRamdom == subType)];
}

/** 返回动画类型 */
- (NSString *)cc_privateAnimaTypeWithTransitionType:(CGAffineTransformType)type{
    
    //设置转场动画的类型
    NSArray *animArray = @[@"rippleEffect",@"suckEffect",@"pageCurl",@"oglFlip",@"cube",@"reveal",@"pageUnCurl"];
    
    return [self cc_privateObjFromArray:animArray index:type isRamdom:(CGAffineTransformTypeRamdom == type)];
}

/** 统一从数据返回对象 */
- (id)cc_privateObjFromArray:(NSArray *)array index:(NSUInteger)index isRamdom:(BOOL)isRamdom{
    
    NSUInteger count = array.count;
    
    NSUInteger i = isRamdom?arc4random_uniform((u_int32_t)count) : index;
    
    return array[i];
}


#pragma mark - CuttingTools
- (void)cc_setLayerShadowColor:(UIColor *)color
               shadowOffset:(CGSize )size
               shadowRadius:(CGFloat)radius
                      alpha:(CGFloat)alpha {
    self.shadowColor = color.CGColor;
    self.shadowOffset = size;
    self.cornerRadius = radius;
    self.shadowOpacity = alpha;
    self.masksToBounds = YES;
}

- (void)setLayerBorderWidth:(CGFloat)borderWidth borderColor:(UIColor *)brderColor {
    self.borderWidth = borderWidth;
    self.borderColor = brderColor.CGColor;
}


@end

