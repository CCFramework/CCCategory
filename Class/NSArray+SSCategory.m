//
//  NSArray+SSCategory.m
//  YYCK
//
//  Created by 李飞恒 on 2017/7/8.
//  Copyright © 2017年 李飞恒. All rights reserved.
//

#import "NSArray+SSCategory.h"

@implementation NSArray (SSCategory)

//- (NSString *)descriptionWithLocale:(id)locale {
//    NSMutableString *str = [NSMutableString string];
//
//    [str appendString:@"[\n"];
//    // 遍历数组的所有元素
//    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
//        [str appendFormat:@"%@,\n", obj];
//    }];
//    [str appendString:@"]"];
//    // 查出最后一个,的范围
//    NSRange range = [str rangeOfString:@"," options:NSBackwardsSearch];
//    if (range.length) {
//        // 删掉最后一个,
//        [str deleteCharactersInRange:range];
//    }
//
//    return str;
//}

- (NSString *)descriptionWithLocale:(id)locale
{
    NSMutableString *string = [NSMutableString string];
    
    // 开头有个[
    [string appendString:@"[\n"];
    
    // 遍历所有的元素
    [self enumerateObjectsUsingBlock:^(id  obj, NSUInteger idx, BOOL *stop) {
        [string appendFormat:@"\t%@,\n", obj];
    }];
    
    // 结尾有个]
    [string appendString:@"]"];
    
    // 查找最后一个逗号
    NSRange range = [string rangeOfString:@"," options:NSBackwardsSearch];
    if (range.location != NSNotFound)
        [string deleteCharactersInRange:range];
    
    return string;
}


- (BOOL)isHaveContainsObject:(id)anObject {
    BOOL isHave = [self containsObject:anObject];
    if (isHave) {
        NSLog(@"%@:存在于当前数组中",anObject);
        if (self.count > 1) {
            NSLog(@"该数组还有其他对象：%@",__P(self));
        } else {
            NSLog(@"%@",__P(self));
        }
    } else {
        NSLog(@"不存在");
    }
    
    return isHave;
}

- (void)NSLogArrayAllCount {
    NSLog(@"数据中有：%d个对象，分别为：%@",(int)self.count,__P(self));
}

- (NSString *)anLastObject {
    NSLog(@"数组中最后一个元素：%@",[self lastObject]);
    return [self lastObject];
}

- (NSString *)anFirstObject {
    NSLog(@"数组中第一个元素：%@",[self firstObject]);
    return [self firstObject];
}

+ (NSArray *)arrayWithString:(NSString *)string
{
    string = [string stringByReplacingOccurrencesOfString:@"[" withString:@""];
    string = [string stringByReplacingOccurrencesOfString:@"]" withString:@""];
    string = [string stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    string = [string stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSArray *array = [NSArray arrayWithArray:[string componentsSeparatedByString:@","]];
    //    // 如果前后都存在双引号,就祛除前后的双引号
    //    [array enumerateObjectsUsingBlock:^(NSString * _Nonnull str, NSUInteger idx, BOOL * _Nonnull stop) {
    //        NSMutableString *tempStr = [[NSMutableString alloc] initWithString:str];
    //        if ([str hasPrefix:@"\""] && [str hasSuffix:@"\""]) {
    //            [tempStr deleteCharactersInRange:NSMakeRange(0, 1)];
    //            [tempStr deleteCharactersInRange:NSMakeRange(tempStr.length - 1, 1)];
    //        }
    //        str = tempStr;
    //    }];
    
    return array;
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


@end
