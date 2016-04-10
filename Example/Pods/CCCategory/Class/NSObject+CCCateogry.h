//
//  NSObject+CCCateogry.h
//  CCCategoryDemo
//
//  Created by 李飞恒 on 16/4/9.
//  Copyright © 2016年 李飞恒. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (CCCateogry)

/**
 *  交换两个方法的实现
 *
 *  @param originalSel 原来的方法
 *  @param newSel      新的方法
 *
 *  @return 是否交换成功
 */
+ (BOOL)methodReplaceWithOldSEL:(SEL)oldSEL toSEL:(SEL)newsel;

- (void)setAssociateValue:(id)value withKey:(void *)key;/** 设置指定对象 */
- (id)setAssiatedValueForKey:(void *)key;/** 从key中获取指定对象 */

@end
