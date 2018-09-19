//
//  CALayer+CCCategory.h
//  CCCategoryDemo
//
//  Created by 李飞恒 on 16/4/5.
//  Copyright © 2016年 MuZiLee. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>


/** 动画类型 */
typedef NS_ENUM(NSInteger, CGAffineTransformType) {
    CGAffineTransformTypeRippleEffect = 0,//水波
    CGAffineTransformTypeSuckEffect   = 1 << 0,//吸走
    CGAffineTransformTypePageCurl     = 1 << 1,//翻开书本
    CGAffineTransformTypeOglFlip      = 1 << 2,//正反翻转
    CGAffineTransformTypeCube         = 1 << 3,//正方体
    CGAffineTransformTypeReveal       = 1 << 4,//push推开
    CGAffineTransformTypePageUnCurl   = 1 << 5,//合上书本
    CGAffineTransformTypeRamdom       = 1 << 6,//随机
};

/** 动画方向 */
typedef NS_ENUM(NSInteger, CGAffineTransformSubType) {
    CGAffineTransformSubTypeFromTop    = 0,//上
    CGAffineTransformSubTypeFromLeft   = 1 << 0,//左
    CGAffineTransformSubTypeFromBotoom = 1 << 1,//下
    CGAffineTransformSubTypeFromRight  = 1 << 2,//右
    CGAffineTransformSubTypeFromRamdom = 1 << 3,//随机
};

/**  动画曲线 */
typedef NS_ENUM(NSInteger, CGAffineTransformCurve) {
    CGAffineTransformCurveDefault       = 0,//默认
    CGAffineTransformCurveEaseIn        = 1 << 0,//渐入
    CGAffineTransformCurveEaseOut       = 1 << 1,//缓出
    CGAffineTransformCurveEaseInEaseOut = 1 << 2,//缓进缓出
    CGAffineTransformCurveLinear        = 1 << 3,//线性
    CGAffineTransformCurveRamdom        = 1 << 4,//随机
};


@interface CALayer (CCCategory)

@property (nonatomic) CGFloat x;
@property (nonatomic) CGFloat y;
@property (nonatomic) CGFloat maxX;
@property (nonatomic) CGFloat minX;
@property (nonatomic) CGFloat maxY;
@property (nonatomic) CGFloat minY;
@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat height;
@property (nonatomic) CGSize  size;

#pragma mark - tranform.rotation
@property (nonatomic) CGFloat transformRotation;     /*! key path "tranform.rotation" */
@property (nonatomic) CGFloat transformRotationX;    /*! key path "tranform.rotation.x" */
@property (nonatomic) CGFloat transformRotationY;    /*! key path "tranform.rotation.y" */
@property (nonatomic) CGFloat transformRotationZ;    /*! key path "tranform.rotation.z" */
@property (nonatomic) CGFloat transformScale;        /*! key path "tranform.scale" */
@property (nonatomic) CGFloat transformScaleX;       /*! key path "tranform.scale.x" */
@property (nonatomic) CGFloat transformScaleY;       /*! key path "tranform.scale.y" */
@property (nonatomic) CGFloat transformScaleZ;       /*! key path "tranform.scale.z" */
@property (nonatomic) CGFloat transformTranslationX; /*! key path "tranform.translation.x" */
@property (nonatomic) CGFloat transformTranslationY; /*! key path "tranform.translation.y" */
@property (nonatomic) CGFloat transformTranslationZ; /*! key path "tranform.translation.z" */

#pragma mark - tranform
@property (nonatomic, assign) CGFloat transformDepth;
@property (nonatomic, assign) UIViewContentMode contentMode;

#pragma makr - init
+ (instancetype)cc_createLayer;/** 创建渐变图层 ,类似直播室中的tableView被切割掉一样 */

#pragma makr - Animation
/**
 *  CGLayer的褪色动画
 *
 *  @param duration 退色时间
 *  @param curve    退色类型
 */
- (void)cc_setFadeAnimationWithDuration:(NSTimeInterval)duration curve:(UIViewAnimationCurve)curve;
- (void)cc_removePreviousFadeAnimation;

/**
 *
 *  绘制动画 @"transform.rotation.z"
 *
 *
 *  @param rotations   关键帧动画动画数组
 //(数组的使用示例) 设定关键帧位置，必须含起始与终止位置
 CALayer *rectLayer = [[CALayer alloc] init];
 rectLayer.frame = CGRectMake(15 200 30 30;
 rectLayer.cornerRadius = 15;
 rectLayer.backgroundColor = [UIColor clearColor].CGColor;
 
 @[[NSValue valueWithCGPoint:rectLayer.frame.origin],
 [NSValue valueWithCGPoint:CGPointMake(320 - 15 rectLayer.frame.origin.y)],
 [NSValue valueWithCGPoint:CGPointMake(320 - 15 rectLayer.frame.origin.y + 100)],
 [NSValue valueWithCGPoint:CGPointMake(15 rectLayer.frame.origin.y + 100)],
 [NSValue valueWithCGPoint:rectLayer.frame.origin]];
 
 *  @param duration    动画时长
 *  @param repeatCount 重复次数
 *
 *  @return 返回一个CAAnimation对象
 *
 */
- (CAAnimation *)cc_animationShake:(NSArray *)rotations
                       duration:(NSTimeInterval)duration
                    repeatCount:(NSUInteger)repeatCount;

/**
 *  转场动画
 *
 *  @param animType 转场动画类型
 *  @param subtype  转动动画方向
 *  @param curve    转动动画曲线
 *  @param duration 转动动画时长
 *
 *  @return 转场动画实例
 */
- (CATransition *)cc_transitionWithAnimType:(CGAffineTransformType)animType
                                 subType:(CGAffineTransformSubType)subType
                                   curve:(CGAffineTransformCurve)curve
                                duration:(CGFloat)duration;


#pragma mark - CuttingTools
/**
 *  切割Layer圆形
 *
 *  @param color  layer颜色
 *  @param size   layer尺寸
 *  @param radius 弧度
 *  @param alpha  透明度
 */
- (void)cc_setLayerShadowColor:(UIColor *)color
               shadowOffset:(CGSize )size
               shadowRadius:(CGFloat)radius
                      alpha:(CGFloat)alpha;

/**
 *  设备阴影/颜色
 *
 *  @param borderWidth 阴影
 *  @param brderColor  阴影颜色
 */
- (void)setLayerBorderWidth:(CGFloat)borderWidth borderColor:(UIColor *)brderColor;


@end

