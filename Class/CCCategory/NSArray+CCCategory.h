//
//  NSArray+CCCategory.h
//  CCCategoryDemo
//
//  Created by 李飞恒 on 16/4/9.
//  Copyright © 2016年 李飞恒. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (CCCategory)
/**
 *  判断数据中是否存在某个对象
 */
- (BOOL)existInObj:(id)anObj;

/**
 *  计算某对象在数组的下标为
 *
 */
- (NSInteger)indextFormObj:(id)anObj;

/**
 *  将字符串数组转化为NSArray
 *  "[1,3,4]" -> [1,3,4]
 */
+ (instancetype)arrayFormString:(NSString *)arrayString;
+ (instancetype)arrayFormString:(NSString *)arrayString deleteSpace:(BOOL)space; //删除空格,可选



@end
