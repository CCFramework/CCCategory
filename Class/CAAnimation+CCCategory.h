//
//  CAAnimation+CCCategory.h
//  CCCategoryDemo
//
//  Created by 李飞恒 on 16/4/5.
//  Copyright © 2016年 MuZiLee. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>


typedef NS_ENUM(NSUInteger, WAxis)
{
    WAxisX = 0,
    WAxisY,
    WAxisZ
};

// 弧度
#define DEGREES_TO_RADIANS(angle) ((angle) / 180.0 * M_PI)
#define RADIANS_TO_DEGREES(radians) ((radians) * (180.0 / M_PI))


@interface CAAnimation (CCCategory)

/**
 *  慢慢透明,没了....
 *  @param  透明到底
 */
+ (CABasicAnimation *)cc_opacityOneAnimation:(float)time;

/**
 *  心跳
 *  @param  心跳时间
 */
+ (CABasicAnimation *)cc_opacityForeverAnimation:(float)time;

/**
 *  breathing with fixed repeated times
 *
 *  @param repeatTimes times
 *  @param time        duritaion, from clear to fully seen
 *
 *  @return animation obj
 */
+ (CABasicAnimation *)cc_opacityTimesAnimation:(float)repeatTimes durTimes:(float)time;

/**
 *  //旋转
 *
 *  @param dur         duration
 *  @param degree      rotate degree in radian(弧度)
 *  @param axis        axis
 *  @param repeatCount repeat count
 *
 *  @return animation obj
 */
+ (CABasicAnimation *)cc_rotation:(float)dur degree:(float)degree direction:(WAxis)axis repeatCount:(int)repeatCount;


/**
 *  放大
 *
 *  @param fromScale   the original scale value, 1.0 by default
 *  @param toScale     target scale
 *  @param time        duration
 *  @param repeatTimes repeat counts
 *
 *  @return animaiton obj
 */
+ (CABasicAnimation *)cc_scaleFrom:(CGFloat)fromScale toScale:(CGFloat)toScale durTimes:(float)time rep:(float)repeatTimes;
/**
 *  摇摆
 *
 *  @param repeatTimes time
 *  @param time        duration
 *  @param obj         always be CALayer at present
 *  @return aniamtion obj
 */
+ (CAKeyframeAnimation *)cc_shake_AnimationRepeatTimes:(float)repeatTimes durTimes:(float)time forObj:(id)obj;


@end
