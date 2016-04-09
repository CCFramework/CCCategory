//
//  UIImageView+CCCategory.h
//  CCCategoryDemo
//
//  Created by 李飞恒 on 16/4/9.
//  Copyright © 2016年 李飞恒. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (CCCategory)

- (instancetype)initWithRadiusFrame:(CGRect)frame;
/** 绘制圆角 */
- (instancetype)imageWithRadiusFrame:(CGRect)frame radius:(CGFloat)radius;
/**
 *  绘制边框
 *
 *  @param borderWidth 边框厚度
 *  @param brderColor  边框颜色
 */
- (void)setImageBorderWidth:(CGFloat)borderWidth borderColor:(UIColor *)brderColor;


/**
 *  创建化方法
 *
 *  @param imageName 图片名
 *  @param frame     CGRect
 *
 *  @return UIImageView
 */
- (instancetype)imageWithName:(NSString *)imageName frame:(CGRect)frame; /** 缓存到内存 */
- (instancetype)imageWithPNGName:(NSString *)imageName frame:(CGRect)frame; /** 些方法中的image 不会缓存到内存,仅读取本地图片 */
- (instancetype)imageWithMPEGName:(NSString *)imageName frame:(CGRect)frame; /** 些方法中的image 不会缓存到内存,仅读取本地图片 */



@end
