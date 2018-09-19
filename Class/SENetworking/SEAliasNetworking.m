//
//  SEAliasNetworking.m
//  AFNetworking
//
//  Created by 李飞恒 on 2018/9/14.
//  Copyright © 2018年 JerryLee. All rights reserved.
//

#import "SEAliasNetworking.h"

@implementation SEAliasNetworking

//增加或修改别名
///action/aliasinfo/save
- (void)aliasAtParameters:(id)parameters
                  success:(NetworkingSuccessBlock)success
                  failure:(NetworkingFailureBlock)failure
{
    [self POST:@"/action/aliasinfo/save" parameters:parameters success:success failure:failure];
}

//随机取出5个别名（免费）
///user/aliasinfo/getAliasMF
- (void)getAliasMFAtSuccess:(NetworkingSuccessBlock)success
                    failure:(NetworkingFailureBlock)failure
{
    [self POST:@"/user/aliasinfo/getAliasMF" parameters:nil success:success failure:failure];
}

//别名的更换使用（每天首次免费）
///user/aliasinfo/useMF
- (void)useMFAtParameters:(id)parameters
                  success:(NetworkingSuccessBlock)success
                  failure:(NetworkingFailureBlock)failure
{
    [self POST:@"/user/aliasinfo/useMF" parameters:parameters success:success failure:failure];
}
//查询花名册信息
///user/aliascao/getAliasCao
- (void)getAliasCaoAtParameters:(id)parameters
                        success:(NetworkingSuccessBlock)success
                        failure:(NetworkingFailureBlock)failure
{
    [self POST:@"/user/aliascao/getAliasCao" parameters:parameters success:success failure:failure];
}
//使用花名选择
///user/aliascao/updateMoRenAlias
- (void)updateMoRenAliasAtParameters:(id)parameters
                             success:(NetworkingSuccessBlock)success
                             failure:(NetworkingFailureBlock)failure
{
    [self POST:@"/user/aliascao/updateMoRenAlias" parameters:parameters success:success failure:failure];
}

//增加别名经验
///user/aliasinfo/addAliasScore
- (void)addAliasScoreAtParameters:(id)parameters
                          success:(NetworkingSuccessBlock)success
                          failure:(NetworkingFailureBlock)failure
{
    [self POST:@"/user/aliasinfo/addAliasScore" parameters:parameters success:success failure:failure];
}

//增加别名槽（收费）
///user/aliascao/save
- (void)addAliascaoAtParameters:(id)parameters
                        success:(NetworkingSuccessBlock)success
                        failure:(NetworkingFailureBlock)failure
{
    [self POST:@"/user/aliascao/save" parameters:parameters success:success failure:failure];
}
//修改花名头像和性别
///user/aliasinfo/upAliasUrlTu
- (void)upAliasUrlTuAtParameters:(id)parameters
                         success:(NetworkingSuccessBlock)success
                         failure:(NetworkingFailureBlock)failure
{
    [self POST:@"/user/aliasinfo/upAliasUrlTu" parameters:parameters success:success failure:failure];
}

@end
