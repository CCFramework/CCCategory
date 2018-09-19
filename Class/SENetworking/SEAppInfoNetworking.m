//
//  SEAppInfoNetworking.m
//  AFNetworking
//
//  Created by 李飞恒 on 2018/9/14.
//  Copyright © 2018年 JerryLee. All rights reserved.
//

#import "SEAppInfoNetworking.h"

@implementation SEAppInfoNetworking


//增加app信息
///action/appinfo/save
- (void)addAppAtParameters:(id)parameters
                   success:(NetworkingSuccessBlock)success
                   failure:(NetworkingFailureBlock)failure DEPRECATED_ATTRIBUTE
{
    [self POST:@"/action/appinfo/save" parameters:parameters success:success failure:failure];
}

//获取当前用户绑定的app信息
///action/appinfo/getList
- (void)getAppInfoAtParameters:(id)parameters
                       success:(NetworkingSuccessBlock)success
                       failure:(NetworkingFailureBlock)failure DEPRECATED_ATTRIBUTE
{
    [self POST:@"/action/appinfo/getList" parameters:parameters success:success failure:failure];
}

//删除绑定的App
///action/appinfo/delete
- (void)deleteAppAtParameters:(id)parameters
                      success:(NetworkingSuccessBlock)success
                      failure:(NetworkingFailureBlock)failure DEPRECATED_ATTRIBUTE
{
    [self POST:@"/action/appinfo/delete" parameters:parameters success:success failure:failure];
}


@end
