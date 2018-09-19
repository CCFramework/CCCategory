//
//  NSArray+CCCategory.m
//  CCCategoryDemo
//
//  Created by 李飞恒 on 16/4/9.
//  Copyright © 2016年 李飞恒. All rights reserved.
//

#import "NSArray+CCCategory.h"
#import <sys/cdefs.h>

@implementation NSArray (CCCategory)

- (BOOL)existInObj:(id)anObj {
    BOOL isHave = [self containsObject:anObj];
    if (self.count > 1) {
        NSLog(@"该数组还有其他成员对象:%@",__P(self));
        
    }
    return isHave;
}

- (NSInteger)indextFormObj:(id)anObj {
    BOOL heave = [self containsObject:anObj];
    NSInteger indext;
    if (heave) {
        indext = [self indexOfObject:anObj];
    } else {
        return 0;
    }
    return indext;
}

+ (instancetype)arrayFormString:(NSString *)arrayString {
    return [NSArray arrayFormString:arrayString deleteSpace:NO];
}

+ (instancetype)arrayFormString:(NSString *)arrayString deleteSpace:(BOOL)space {
    arrayString = [arrayString stringByReplacingOccurrencesOfString:@"[" withString:@""];
    arrayString = [arrayString stringByReplacingOccurrencesOfString:@"]" withString:@""];
    arrayString = [arrayString stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    if (space) {
        arrayString = [arrayString stringByReplacingOccurrencesOfString:@" " withString:@""];
    }
    return [NSArray arrayWithArray:[arrayString componentsSeparatedByString:@","]];
}

@end
