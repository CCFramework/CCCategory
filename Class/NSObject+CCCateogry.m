//
//  NSObject+CCCateogry.m
//  CCCategoryDemo
//
//  Created by 李飞恒 on 16/4/9.
//  Copyright © 2016年 李飞恒. All rights reserved.
//

#import "NSObject+CCCateogry.h"
#import <objc/runtime.h>

@implementation NSObject (CCCateogry)

+ (BOOL)methodReplaceWithOldSEL:(SEL)oldSEL toSEL:(SEL)newsel; {
    Class class = object_getClass(self);
    Method originalMethod = class_getInstanceMethod(class, oldSEL);
    Method newMethod = class_getInstanceMethod(class, newsel);
    if (!originalMethod || !newMethod) return NO;
    method_exchangeImplementations(originalMethod, newMethod);
    return YES;
}

- (void)setAssociateValue:(id)value withKey:(void *)key {
    //指定引用对象
    objc_setAssociatedObject(self, key, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (id)setAssiatedValueForKey:(void *)key {
    return objc_getAssociatedObject(self, key);
}

@end
