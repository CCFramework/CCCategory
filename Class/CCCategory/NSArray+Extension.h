//
//  NSArray+Extension.h
//  CZMaster
//
//  Created by 李飞恒 on 2017/12/28.
//  Copyright © 2017年 SANSHENG TECHONLOGY LLC admin@sansehngit.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Extension)

+ (NSArray *)arrayWithBundlePlistByPlistName:(NSString *)plistName;

- (NSString *)toString;

+ (NSArray *)arrayWithString:(NSString *)string deleteSpace:(BOOL)deleteSpace;


/**
 编历数组中的对象

 @param idObj 需要编历的Model 对旬
 @return 返回编历装载好的数组
 */
- (NSArray *)enumerateObjsAtClass:(Class)idObj;

@end
