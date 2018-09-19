//
//  UIImage+SSCategory.h
//  YYCK
//
//  Created by 李飞恒 on 2017/7/5.
//  Copyright © 2017年 李飞恒. All rights reserved.
//

#import <UIKit/UIKit.h>

#define iOS7 ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0)

@interface UIImage (SSCategory)

+ (UIImage*)createImageWithColor:(UIColor*)color;

/*! 自定义Size 和 颜色 来创建UIImage */
+ (instancetype)imageWithColor:(UIColor *)color size:(CGSize)size;

+ (instancetype)setImageSize:(CGSize)size;

+ (UIImage *)imageWithName:(NSString *)name;

/**
 *  使用UIColor对象创建UIImage(固定100px * 100px)
 *
 *  @param color 一个UIColor对象
 *
 *  @return 返回一张新图片
 */
+ (instancetype)imageColor:(UIColor *)color;

/**
 *  使用16进制颜色值创建UIImage
 *
 *  @param hexColor 16进制颜色值
 *  @param size     CGSize size
 *
 *  @return UIImage obj
 */
+ (instancetype)imageHexColor:(NSString *)hexColor size:(CGSize)size;

/**
 *  使用16进制颜色值创建UIImage(固定100px * 100px)
 *
 *  @param hexColor 16进制颜色值
 *
 *  @return UIImage obj
 */
+ (instancetype)imageHexColor:(NSString *)hexColor;

/**
 *  马赛格Image
 *
 *  @param image 需要处理的image
 *  @param blur  伐值 (0<-->1)
 *
 *  @return 返回一张马赛格图
 */
+ (instancetype)blurryImage:(UIImage *)image blur:(CGFloat)blur;



/**
 获取图片的主要颜色值 （可用于判断，图片是否为暗色还是亮色）
 */
- (UIColor *)mostColor;

// 获取视频第一帧
+ (UIImage*)imageWithVideoUrl:(NSString *)path;


/**
 64base 字符串 转成 UIImage
 
 @param str 64base 字符串
 @return UIImage
 */
+ (UIImage *)stringToImage:(NSString *)str;




/**
 通过字符串绘制二维码
 
 @param string 需要绘制的二维码
 */
+ (UIImage *)qrCodeWithString:(NSString *)string;

@end
