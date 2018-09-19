//
//  SECircleNetworking.h
//  AFNetworking
//
//  Created by 李飞恒 on 2018/9/14.
//  Copyright © 2018年 JerryLee. All rights reserved.
//

#import "SEBaseNetworking.h"

@interface SECircleNetworking : SEBaseNetworking

//创建/修改圈子
///action/community/save
- (void)communityAtParameters:(id)parameters
                      success:(NetworkingSuccessBlock)success
                      failure:(NetworkingFailureBlock)failure DEPRECATED_ATTRIBUTE;


//分页获取所有圈子
///action/community/getAllByPage
- (void)getAllByPageAtParameters:(id)parameters
                      success:(NetworkingSuccessBlock)success
                      failure:(NetworkingFailureBlock)failure DEPRECATED_ATTRIBUTE;

//获取某一个圈子下的所有用户
///action/community/getAlluser
- (void)getAlluserAtParameters:(id)parameters
                      success:(NetworkingSuccessBlock)success
                      failure:(NetworkingFailureBlock)failure DEPRECATED_ATTRIBUTE;

//我/Ta加入的圈子(不包含创建的)
///action/community/getAllCommOfMine
- (void)getAllCommOfMineAtParameters:(id)parameters
                      success:(NetworkingSuccessBlock)success
                      failure:(NetworkingFailureBlock)failure DEPRECATED_ATTRIBUTE;

//加入圈子
///action/community/join
- (void)joinAtParameters:(id)parameters
                      success:(NetworkingSuccessBlock)success
                      failure:(NetworkingFailureBlock)failure DEPRECATED_ATTRIBUTE;

//退出圈子
///action/community/quit
- (void)quitAtParameters:(id)parameters
                      success:(NetworkingSuccessBlock)success
                      failure:(NetworkingFailureBlock)failure DEPRECATED_ATTRIBUTE;


//获取某个圈子详情
///action/community/getinfo
- (void)getinfoAtParameters:(id)parameters
                      success:(NetworkingSuccessBlock)success
                      failure:(NetworkingFailureBlock)failure DEPRECATED_ATTRIBUTE;

//我创建的圈子
///action/community/getAll
- (void)getAllAtParameters:(id)parameters
                      success:(NetworkingSuccessBlock)success
                      failure:(NetworkingFailureBlock)failure DEPRECATED_ATTRIBUTE;


//发布内容
///action/communityrelease/save
- (void)communityreleaseAtParameters:(id)parameters
                      success:(NetworkingSuccessBlock)success
                      failure:(NetworkingFailureBlock)failure DEPRECATED_ATTRIBUTE;

//获取内容详情
///action/communityrelease/getInfo
//- (void)getInfoAtParameters:(id)parameters
//                      success:(NetworkingSuccessBlock)success
//                      failure:(NetworkingFailureBlock)failure DEPRECATED_ATTRIBUTE;


//我/Ta加入和创建的圈子
///action/community/getAllForMe
- (void)getAllForMeAtParameters:(id)parameters
                      success:(NetworkingSuccessBlock)success
                      failure:(NetworkingFailureBlock)failure DEPRECATED_ATTRIBUTE;

//分页获取某个圈子中内容列表
///action/communityrelease/getAllByPage
- (void)getAllByPageAtParameters:(id)parameters
                      success:(NetworkingSuccessBlock)success
                      failure:(NetworkingFailureBlock)failure DEPRECATED_ATTRIBUTE;

//根据id查看内容详情
///action/communityrelease/getInfo
//- (void)getQRcodeAtParameters:(id)parameters
//                      success:(NetworkingSuccessBlock)success
//                      failure:(NetworkingFailureBlock)failure DEPRECATED_ATTRIBUTE;

//根据内容ID加减评论、收藏、点赞、分享数量
///action/communityrelease/save
//- (void)saveAtParameters:(id)parameters
//                      success:(NetworkingSuccessBlock)success
//                      failure:(NetworkingFailureBlock)failure DEPRECATED_ATTRIBUTE;

//回复
///action/communityreply/save
//- (void)getQRcodeAtParameters:(id)parameters
//                      success:(NetworkingSuccessBlock)success
//                      failure:(NetworkingFailureBlock)failure DEPRECATED_ATTRIBUTE;


//分页查询某条数据的回复信息
///action/communityreply/getAllByPage
- (void)getAllByPageAtParameters:(id)parameters
                      success:(NetworkingSuccessBlock)success
                      failure:(NetworkingFailureBlock)failure DEPRECATED_ATTRIBUTE;


//获取与某个内容相关的用户
///action/communityrelease/getReUser
- (void)getReUserAtParameters:(id)parameters
                      success:(NetworkingSuccessBlock)success
                      failure:(NetworkingFailureBlock)failure DEPRECATED_ATTRIBUTE;


//solr高亮关键字查询
///action/solr/select
- (void)selectAtParameters:(id)parameters
                      success:(NetworkingSuccessBlock)success
                      failure:(NetworkingFailureBlock)failure DEPRECATED_ATTRIBUTE;


//根据圈子ID生成二维码
///action/community/getQRcode
- (void)getQRcodeAtParameters:(id)parameters
                 success:(NetworkingSuccessBlock)success
                 failure:(NetworkingFailureBlock)failure DEPRECATED_ATTRIBUTE;















@end
