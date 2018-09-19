//
//  UIView+Layer.h
//  bname
//
//  Created by administrator on 2018/7/12.
//  Copyright © 2018年 JerryLee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Layer)
//颜色渐变buttoom
- (void)addShadeBtn:(CGRect)make;
//自定义cell底部线条
-(void)addCellLine;        //全屏宽x-10;
- (void)addFullWidthLine:(CGFloat)height; //全屏宽
//版本更新红点
- (void)addVersionUpdateOrigin;
// 计算文本的高度
- (CGFloat)labHeight:(UILabel*)lab;
////好评视图
//- (void)addReputtablyWithView;
////灰色透明遮罩层
//- (void)addGrayView;

+ (instancetype)addSupView:(UIView *)aView;


- (void)startAnimationRotation;

- (void)startAnimationBalanus;


/**
 顺时针

 @param duration 持续时间 默认 0.5
 */
- (void)anticlockwiseRotateViewDuration:(NSTimeInterval)duration;

/**
 逆时针

 @param duration 持续时间 默认 0.5
 */
- (void)clockwiseRotateViewDuration:(NSTimeInterval)duration;
- (void)stopAnimation;


/**
 截图
 */
- (UIImage *)screenshot;


/**
 设置边框

 @param width 边框厚度
 @param color 颜色
 */
- (void)borderWidth:(CGFloat)width color:(UIColor *)color;


- (UIViewController *)supportViewController;

@end
