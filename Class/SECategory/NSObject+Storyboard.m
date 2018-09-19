//
//  NSObject+Storyboard.m
//  bname
//
//  Created by iMac Maxt on 2018/8/21.
//  Copyright © 2018年 SanshengTechnologyLLC. All rights reserved.
//

#import "NSObject+Storyboard.h"

@implementation NSObject (Storyboard)


- (id)creationStoryboardControllerName:(NSString *)classname name:(NSString *)name
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:name bundle:[NSBundle mainBundle]];
    return [storyboard instantiateViewControllerWithIdentifier:classname];
}

- (id)creationNibViewWithName:(NSString *)name
{
    return [[[NSBundle mainBundle] loadNibNamed:name owner:self options:nil] lastObject];
}

@end
