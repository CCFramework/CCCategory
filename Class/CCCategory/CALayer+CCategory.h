//
//  CALayer+CCategory.h
//  CustomFrameworkExample
//
//  Created by 李飞恒 on 16/3/17.
//  Copyright © 2016年 李飞恒. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "CALayer+CCategory.h"

@interface CALayer (CCategory)


@property (nonatomic) CGFloat x;
@property (nonatomic) CGFloat y;
@property (nonatomic) CGFloat maxX;
@property (nonatomic) CGFloat minX;
@property (nonatomic) CGFloat maxY;
@property (nonatomic) CGFloat minY;
@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat height;
@property (nonatomic) CGSize size;

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

@property (nonatomic, assign) CGFloat transformDepth;
@property (nonatomic, assign) UIViewContentMode contentMode;


- (void)addFadeAnimationWithDuration:(NSTimeInterval)duration curve:(UIViewAnimationCurve)curve;
- (void)removePreviousFadeAnimation;

/** 切圆 (需要宽高相等才可以切圆) */
- (void)setLayerCornerRadiusWithWidth:(CGFloat)Width;
/** 切边 */
- (void)setLayerCorerRadiusForm:(CGFloat)radius;

/*!
 *  添加阴影 (注意,切勿添加clipsToBounds,否则阴影无效)
 *
 *  @param color  阴影颜色
 *  @param size   阴影偏移量
 *  @param radius 阴影厚度 (默认值为3)
 *  @param alpha  阴影透明度0->1
 *
 */
- (void)setLayerShadowColor:(UIColor *)color
               shadowOffset:(CGSize )size
               shadowRadius:(CGFloat)radius
                      alpha:(CGFloat)alpha;



@end
