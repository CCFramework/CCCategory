//
//  SESignInNetworking.h
//  AFNetworking
//
//  Created by 李飞恒 on 2018/9/14.
//  Copyright © 2018年 JerryLee. All rights reserved.
//

#import "SEBaseNetworking.h"

@interface SESignInNetworking : SEBaseNetworking

//查看本周签到情况
///user/aliascoming/getAliasComing
- (void)getSignInAtParameters:(id)parameters
                  success:(NetworkingSuccessBlock)success
                  failure:(NetworkingFailureBlock)failure DEPRECATED_ATTRIBUTE;

//签到
///user/aliascoming/coming
- (void)signInAtParameters:(id)parameters
                  success:(NetworkingSuccessBlock)success
                  failure:(NetworkingFailureBlock)failure DEPRECATED_ATTRIBUTE;

@end
