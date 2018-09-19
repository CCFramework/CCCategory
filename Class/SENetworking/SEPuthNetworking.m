//
//  SEPuthNetworking.m
//  AFNetworking
//
//  Created by 李飞恒 on 2018/9/14.
//  Copyright © 2018年 JerryLee. All rights reserved.
//

#import "SEPuthNetworking.h"

@implementation SEPuthNetworking

//推送消息给个人/多人/圈子中的所有人
///action/push/to/someone
- (void)pushAtParameters:(id)parameters
                 success:(NetworkingSuccessBlock)success
                 failure:(NetworkingFailureBlock)failure DEPRECATED_ATTRIBUTE
{
    [self POST:@"/action/push/to/someone" parameters:parameters success:success failure:failure];
}

@end
