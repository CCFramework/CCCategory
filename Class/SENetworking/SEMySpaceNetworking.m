//
//  SEMySpaceNetworking.m
//  AFNetworking
//
//  Created by 李飞恒 on 2018/9/14.
//  Copyright © 2018年 JerryLee. All rights reserved.
//

#import "SEMySpaceNetworking.h"

@implementation SEMySpaceNetworking

//查询是否点赞
///action/backgardenupvote/isUpvote
- (void)isUpvoteAtParameters:(id)parameters
                     success:(NetworkingSuccessBlock)success
                     failure:(NetworkingFailureBlock)failure
{
    [self POST:@"/action/backgardenupvote/isUpvote" parameters:parameters success:^(NSURLSessionDataTask *task, SEResponseObject *responseObject) {
        success(task, responseObject);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        failure(task, error);
    }];
}
//后花园按照位置查询
///action/backgarden/getAllByGeo
- (void)getAllByGeoAtParameters:(id)parameters
                        success:(NetworkingSuccessBlock)success
                        failure:(NetworkingFailureBlock)failure
{
    [self POST:@"/action/backgarden/getAllByGeo" parameters:parameters success:^(NSURLSessionDataTask *task, SEResponseObject *responseObject) {
        success(task, responseObject);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        failure(task, error);
    }];
}
//发布
///action/backgarden/save
- (void)backgardenAtParameters:(id)parameters
                       success:(NetworkingSuccessBlock)success
                       failure:(NetworkingFailureBlock)failure
{
    [self POST:@"/action/backgarden/save" parameters:parameters success:^(NSURLSessionDataTask *task, SEResponseObject *responseObject) {
        success(task, responseObject);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        failure(task, error);
    }];
}
//删除单条后花园
///action/backgarden/deleteById
- (void)deleteByIdAtParameters:(id)parameters
                       success:(NetworkingSuccessBlock)success
                       failure:(NetworkingFailureBlock)failure
{
    [self POST:@"/action/backgarden/deleteById" parameters:parameters success:^(NSURLSessionDataTask *task, SEResponseObject *responseObject) {
        success(task, responseObject);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        failure(task, error);
    }];
}

//后花园列表
///action/backgarden/getAllByPage
- (void)getAllByPageAtParameters:(id)parameters
                         success:(NetworkingSuccessBlock)success
                         failure:(NetworkingFailureBlock)failure
{
    [self POST:@"/action/backgarden/getAllByPage" parameters:parameters success:^(NSURLSessionDataTask *task, SEResponseObject *responseObject) {
        success(task, responseObject);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        failure(task, error);
    }];
}

//根据id查看详情
///action/backgarden/selectOne
- (void)backgardenIdAtParameters:(id)parameters
                         success:(NetworkingSuccessBlock)success
                         failure:(NetworkingFailureBlock)failure
{
    [self POST:@"/action/backgarden/selectOne" parameters:parameters success:^(NSURLSessionDataTask *task, SEResponseObject *responseObject) {
        success(task, responseObject);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        failure(task, error);
    }];
}

//点赞或取消点赞
///action/backgardenupvote/saveOrDelete
- (void)backgardenupvoteAtParameters:(id)parameters
                             success:(NetworkingSuccessBlock)success
                             failure:(NetworkingFailureBlock)failure
{
    [self POST:@"/action/backgardenupvote/saveOrDelete" parameters:parameters success:^(NSURLSessionDataTask *task, SEResponseObject *responseObject) {
        success(task, responseObject);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        failure(task, error);
    }];
}

//评论
///action/backgardenreply/save
- (void)backgardenreplyAtParameters:(id)parameters
                             success:(NetworkingSuccessBlock)success
                             failure:(NetworkingFailureBlock)failure
{
    [self POST:@"/action/backgardenreply/save" parameters:parameters success:^(NSURLSessionDataTask *task, SEResponseObject *responseObject) {
        success(task, responseObject);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        failure(task, error);
    }];
}


//删除评论
///action/backgardenreply/deleteById
- (void)backgardenreplyByDeleteAtParameters:(id)parameters
                         parameters:(NetworkingSuccessBlock)success
                            failure:(NetworkingFailureBlock)failure
{
    [self POST:@"/action/backgardenreply/deleteById" parameters:parameters success:^(NSURLSessionDataTask *task, SEResponseObject *responseObject) {
        success(task, responseObject);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        failure(task, error);
    }];
}


@end
