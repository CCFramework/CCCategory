//
//  NSString+SSCategory.h
//  YYCK
//
//  Created by 李飞恒 on 2017/7/5.
//  Copyright © 2017年 李飞恒. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (SSCategory)

/**
 *	@author meexun, 16-12-28 10:12:37
 *
 *	传入user_id经过解密后返回前8位的密码
 *
 *	@param input	需要解密的字符串
 *
 *	@return 返回一个解密后的字符串
 *
 *	@since 1.0.0
 */
+ (NSString*)digest:(NSString*)input;

/**
 *  MD5加密
 *
 *  @return 返回一个MD5加密的String
 */
- (NSString *)stringFromMD5;



/**
 *  据报String内容计算出来个新的Size
 *
 *  @param size 需要计算的范围
 *  @param font 用于计算的字号
 *
 *  @return 返回一个Size对象
 */
- (CGSize)sizeWithSize:(CGSize)size andFont:(UIFont *)font;
/*! 根据固定宽,计算Size */
- (CGSize)sizeWithFont:(UIFont *)font forWidth:(CGFloat)width;
/*! 根据固定高,计算Size */
- (CGSize)sizeWithFont:(UIFont *)font forHeight:(CGFloat)height;


- (NSString *)getOriginalImageURL;

/**
 *  使用CoreFoundation 将string to UTF-8
 *
 *  @param input 需要转码的string
 *
 *  @return UTF-8编码
 */
- (NSString *)encodeToPercentEscapeString:(NSString *)input;

//处理字符串空格
- (NSString *)isEmptyString;

/**
 *  时间戳转成字符串
 *
 *
 *  @return 格式化后的字符串
 */
/**
 *  时间戳转成字符串
 *
 *
 *  @return 格式化后的字符串
 */
- (NSString *)timeBeforeInfo;


/**
 处理符串数组
 */
- (NSArray *)setupReplacing;


/**
 根据月日计算星座

 @param month 月
 @param day 日
 @return 星座
 */
+ (NSString *)getConstellationWithMonth:(int)month day:(int)day;

@end
