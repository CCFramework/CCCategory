//
//  UIColor+CCCategory.h
//  CCCategoryDemo
//
//  Created by 李飞恒 on 16/4/8.
//  Copyright © 2016年 MuZiLee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (CCCategory)


/**
 *  单例
 *
 
 */
+ (instancetype)colorShared;

+ (void)registerColor:(UIColor *)color forName:(NSString *)name;

/**
 *  十六制颜色值
 *
 *  @param string #XXXX
 *
 *  @return 返回一个新的颜色对象
 */
+ (UIColor *)colorWithString:(NSString *)string;
/**
 *  32位RGB值
 *
 *  @param rgb
 *
 *  @return
 */
+ (UIColor *)colorWithRGBValue:(uint32_t)rgb;
+ (UIColor *)colorWithRGBAValue:(uint32_t)rgba;
/**
 *  十六进制颜色值
 *
 *  @param string #XXXXXX
 *
 *  @return 返回一个新的颜色对象
 */
- (UIColor *)initWithString:(NSString *)string;
- (UIColor *)initWithRGBValue:(uint32_t)rgb;
- (UIColor *)initWithRGBAValue:(uint32_t)rgba;

- (uint32_t)RGBValue;
- (uint32_t)RGBAValue;
- (NSString *)stringValue;

- (BOOL)isMonochromeOrRGB;
- (BOOL)isEquivalent:(id)object;
- (BOOL)isEquivalentToColor:(UIColor *)color;

- (UIColor *)colorWithBrightness:(CGFloat)brightness;
- (UIColor *)colorBlendedWithColor:(UIColor *)color factor:(CGFloat)factor;

//+ (UIColor *)themeColorNamed:(NSString *)key;

+ (UIColor *)colorWithHex:(NSInteger)rgbHexValue;
+ (UIColor *)colorWithHex:(NSInteger)rgbHexValue alpha:(CGFloat)alpha;

+ (UIColor *)colorWithHexString:(NSString *)hexStr;

@end
