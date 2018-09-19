//
//  NSString+CCCategory.h
//  CCCategoryDemo
//
//  Created by 李飞恒 on 16/4/9.
//  Copyright © 2016年 李飞恒. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
//#import <GTMBase64.h>

@interface NSString (CCCategory)
/** 将JSON->NSString */
- (NSString *)stringWithJSON;

- (NSString *)MD5Hex;

//+ (NSString*)sha256:(NSString *)stringpass;

/**
 *  从16进制的字符串格式转换为NSData
 *
 *  @return NSData
 */
- (NSData *)hexStringToData;


/**
 *  移除字符串最后一个字符(非空格)
 *
 *  @return 返回一个新的字符串
 */
- (NSString *)deleteRangeLastOne;

/**
 *  移除字符串首尾各一个字符
 *
 *  @return 返回一个新的字符串
 */
- (NSString *)deleteLastCharacterFirst;

- (CGSize)sizeWithFont:(UIFont *)font;
- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize;
- (CGSize)sizeWithFont:(UIFont *)font fixWith:(CGFloat)with;
- (CGSize)sizeWithFont:(UIFont *)font fixHigh:(CGFloat)high;
- (CGSize)sizeWithFont:(UIFont *)font fixSize:(CGSize)size;
@end
