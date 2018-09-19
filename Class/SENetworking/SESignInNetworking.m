//
//  SESignInNetworking.m
//  AFNetworking
//
//  Created by 李飞恒 on 2018/9/14.
//  Copyright © 2018年 JerryLee. All rights reserved.
//

#import "SESignInNetworking.h"

@implementation SESignInNetworking

//查看本周签到情况
///user/aliascoming/getAliasComing
- (void)getSignInAtParameters:(id)parameters
                      success:(NetworkingSuccessBlock)success
                      failure:(NetworkingFailureBlock)failure DEPRECATED_ATTRIBUTE
{
    [self POST:@"/user/aliascoming/getAliasComing" parameters:parameters success:success failure:failure];
}

//签到
///user/aliascoming/coming
- (void)signInAtParameters:(id)parameters
                   success:(NetworkingSuccessBlock)success
                   failure:(NetworkingFailureBlock)failure DEPRECATED_ATTRIBUTE
{
    [self POST:@"/user/aliascoming/coming" parameters:parameters success:success failure:failure];
}

@end
