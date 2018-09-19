//
//  NSArray+Extension.m
//  CZMaster
//
//  Created by 李飞恒 on 2017/12/28.
//  Copyright © 2017年 SANSHENG TECHONLOGY LLC admin@sansehngit.com. All rights reserved.
//

#import "NSArray+Extension.h"

@implementation NSArray (Extension)

+ (NSArray *)arrayWithBundlePlistByPlistName:(NSString *)plistName
{
    return [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:plistName ofType:@"plist"]];
}

- (NSString *)toString
{
    NSMutableString *arrayStr = [NSMutableString stringWithFormat:@"["];
    [self enumerateObjectsUsingBlock:^(id str, NSUInteger idx, BOOL *stop){
        if (idx == self.count - 1) {
            [arrayStr appendFormat:@"%@", str];
        } else {
            [arrayStr appendFormat:@"%@,", str];
        }
    }];
    [arrayStr appendString:@"]"];
    return arrayStr;
}

+ (NSArray *)arrayWithString:(NSString *)string deleteSpace:(BOOL)deleteSpace
{
    string = [string stringByReplacingOccurrencesOfString:@"[" withString:@""];
    string = [string stringByReplacingOccurrencesOfString:@"]" withString:@""];
    string = [string stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    if (deleteSpace) {
        string = [string stringByReplacingOccurrencesOfString:@" " withString:@""];
    }
    NSArray *array = [NSArray arrayWithArray:[string componentsSeparatedByString:@","]];
    return array;
}


- (NSArray *)enumerateObjsAtClass:(Class)idObj
{
    NSMutableArray *temp = @[].mutableCopy;
    for (id obj in self) {
        [temp addObject:[idObj modelWithJSON:obj]];
    }
    return [NSArray arrayWithArray:temp];
}

@end
