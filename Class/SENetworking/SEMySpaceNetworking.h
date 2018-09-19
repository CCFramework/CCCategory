//
//  SEMySpaceNetworking.h
//  AFNetworking
//
//  Created by 李飞恒 on 2018/9/14.
//  Copyright © 2018年 JerryLee. All rights reserved.
//

#import "SEBaseNetworking.h"

@interface SEMySpaceNetworking : SEBaseNetworking


//查询是否点赞
///action/backgardenupvote/isUpvote
- (void)isUpvoteAtParameters:(id)parameters
                     success:(NetworkingSuccessBlock)success
                     failure:(NetworkingFailureBlock)failure;

//后花园按照位置查询
///action/backgarden/getAllByGeo
- (void)getAllByGeoAtParameters:(id)parameters
                        success:(NetworkingSuccessBlock)success
                        failure:(NetworkingFailureBlock)failure;

//发布
///action/backgarden/save
- (void)backgardenAtParameters:(id)parameters
                       success:(NetworkingSuccessBlock)success
                       failure:(NetworkingFailureBlock)failure;

//删除单条后花园
///action/backgarden/deleteById
- (void)deleteByIdAtParameters:(id)parameters
                       success:(NetworkingSuccessBlock)success
                       failure:(NetworkingFailureBlock)failure;

//后花园列表
///action/backgarden/getAllByPage
- (void)getAllByPageAtParameters:(id)parameters
                         success:(NetworkingSuccessBlock)success
                         failure:(NetworkingFailureBlock)failure;

//根据id查看详情
///action/backgarden/selectOne
- (void)backgardenIdAtParameters:(id)parameters
                         success:(NetworkingSuccessBlock)success
                         failure:(NetworkingFailureBlock)failure;

//点赞或取消点赞
///action/backgardenupvote/saveOrDelete
- (void)backgardenupvoteAtParameters:(id)parameters
                             success:(NetworkingSuccessBlock)success
                             failure:(NetworkingFailureBlock)failure;

//评论
///action/backgardenreply/save
- (void)backgardenreplyAtParameters:(id)parameters
                            success:(NetworkingSuccessBlock)success
                            failure:(NetworkingFailureBlock)failure;


//删除评论
///action/backgardenreply/deleteById
- (void)backgardenreplyByDeleteAtParameters:(id)parameters
                                 parameters:(NetworkingSuccessBlock)success
                                    failure:(NetworkingFailureBlock)failure;

@end
