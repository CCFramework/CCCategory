//
//  SEUser.m
//  bname
//
//  Created by iMac Maxt on 2018/7/20.
//  Copyright © 2018年 JerryLee. All rights reserved.
//

#import "SEUser.h"

@implementation SEUser

- (NSString *)latitude
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:@"coordinate"][@"latitude"];
}

- (NSString *)longitude
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:@"coordinate"][@"longitude"];
}


@end
