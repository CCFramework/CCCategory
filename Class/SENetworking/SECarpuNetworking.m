//
//  SECarpuNetworking.m
//  AFNetworking
//
//  Created by 李飞恒 on 2018/9/14.
//  Copyright © 2018年 JerryLee. All rights reserved.
//

#import "SECarpuNetworking.h"

@implementation SECarpuNetworking

//千里传音列表
///action/release/select
- (void)carpuListAtParameters:(id)parameters
                      success:(NetworkingSuccessBlock)success
                      failure:(NetworkingFailureBlock)failure DEPRECATED_ATTRIBUTE
{
    [self POST:@"/action/release/select" parameters:parameters success:success failure:failure];
}



//根据id查看内容详情
///action/release/selectOne
- (void)queryAtParameters:(id)parameters
                  success:(NetworkingSuccessBlock)success
                  failure:(NetworkingFailureBlock)failure DEPRECATED_ATTRIBUTE
{
    [self POST:@"/action/release/selectOne" parameters:parameters success:success failure:failure];
}


//千里传音发布
///action/release/save
- (void)pushAtParameters:(id)parameters
                 success:(NetworkingSuccessBlock)success
                 failure:(NetworkingFailureBlock)failure DEPRECATED_ATTRIBUTE
{
    [self POST:@"/action/release/save" parameters:parameters success:success failure:failure];
}



//千里传音点赞
///action/upvote/addUpvote
- (void)upvoteAtParameters:(id)parameters
                   success:(NetworkingSuccessBlock)success
                   failure:(NetworkingFailureBlock)failure DEPRECATED_ATTRIBUTE
{
    [self POST:@"/action/upvote/addUpvote" parameters:parameters success:success failure:failure];
}


//千里传音点赞
///action/reply/select
- (void)replyAtParameters:(id)parameters
                  success:(NetworkingSuccessBlock)success
                  failure:(NetworkingFailureBlock)failure DEPRECATED_ATTRIBUTE
{
    [self POST:@"/action/reply/select" parameters:parameters success:success failure:failure];
}


//查询是否点过赞
///action/upvote/isUpvote
- (void)isUpvoteAtParameters:(id)parameters
                     success:(NetworkingSuccessBlock)success
                     failure:(NetworkingFailureBlock)failure DEPRECATED_ATTRIBUTE
{
    [self POST:@"/action/upvote/isUpvote" parameters:parameters success:success failure:failure];
}


//根据id删除内容
///action/release/delete
- (void)deleteAtParameters:(id)parameters
                   success:(NetworkingSuccessBlock)success
                   failure:(NetworkingFailureBlock)failure DEPRECATED_ATTRIBUTE
{
    [self POST:@"/action/release/delete" parameters:parameters success:success failure:failure];
}


//千里传音回复
///action/reply/save
- (void)carpuReplyAtParameters:(id)parameters
                       success:(NetworkingSuccessBlock)success
                       failure:(NetworkingFailureBlock)failure DEPRECATED_ATTRIBUTE
{
    [self POST:@"/action/reply/save" parameters:parameters success:success failure:failure];
}


@end
