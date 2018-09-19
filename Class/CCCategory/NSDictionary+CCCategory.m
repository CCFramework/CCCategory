//
//  NSDictionary+CCCategory.m
//  CCCategoryDemo
//
//  Created by 李飞恒 on 16/4/9.
//  Copyright © 2016年 李飞恒. All rights reserved.
//

#import "NSDictionary+CCCategory.h"

@implementation NSDictionary (CCCategory)
- (NSString *)descriptionWithLocale:(id)locale {
    NSMutableString *str = [NSMutableString string];
    
    [str appendString:@"{\n"];
    
    // 遍历字典的所有键值对
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [str appendFormat:@"\t%@ = %@,\n", key, obj];
    }];
    
    [str appendString:@"}"];
    
    // 查出最后一个,的范围
    NSRange range = [str rangeOfString:@"," options:NSBackwardsSearch];
    if (range.length) {
        // 删掉最后一个,
        [str deleteCharactersInRange:range];
    }
    
    return str;
}
@end
