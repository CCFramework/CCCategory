//
//  SEAccountNetworking.h
//  AFNetworking
//
//  Created by 李飞恒 on 2018/9/13.
//  Copyright © 2018年 JerryLee. All rights reserved.
//


#import "SEBaseNetworking.h"

@interface SEAccountNetworking : SEBaseNetworking

/**
 重新获取token
 
 @param success 成员返回数据
 @param failure 服务响应失败
 */
- (void)regainTokenAtAccountUid:(NSString *)uid
                        success:(NetworkingSuccessBlock)success
                        failure:(NetworkingFailureBlock)failure;

/**
 获取文件上传token
 
 @param success 成员返回数据
 @param failure 服务响应失败
 */
- (void)getQiniuTokenAtParameters:(id)parameters
                          success:(NetworkingSuccessBlock)success
                          failure:(NetworkingFailureBlock)failure;

/**
 短信验证
 
 @param success 成员返回数据
 @param failure 服务响应失败
 */
- (void)sendCodeAtParameters:(id)parameters
                     success:(NetworkingSuccessBlock)success
                     failure:(NetworkingFailureBlock)failure;

/**
 邮箱验证
 
 @param success 成员返回数据
 @param failure 服务响应失败
 */
- (void)sendEmailAtParameters:(id)parameters
                      success:(NetworkingSuccessBlock)success
                      failure:(NetworkingFailureBlock)failure;
/**
 用户注册
 
 @param success 成员返回数据
 @param failure 服务响应失败
 */
- (void)registAtParameters:(id)parameters
                   success:(NetworkingSuccessBlock)success
                   failure:(NetworkingFailureBlock)failure;
/**
 用户登录
 
 @param success 成员返回数据
 @param failure 服务响应失败
 */
- (void)loginAtParameters:(id)parameters
                  success:(NetworkingSuccessBlock)success
                  failure:(NetworkingFailureBlock)failure;

/**
 第三方登录
 
 @param success 成员返回数据
 @param failure 服务响应失败
 */
- (void)sanFangLoginAtParameters:(id)parameters
                         success:(NetworkingSuccessBlock)success
                         failure:(NetworkingFailureBlock)failure;

/**
 获取用户信息
 
 @param success 成员返回数据
 @param failure 服务响应失败
 */
- (void)getUserAtParameters:(id)parameters
                    success:(NetworkingSuccessBlock)success
                    failure:(NetworkingFailureBlock)failure;
/**
 获取多个用户信息
 
 @param success 成员返回数据
 @param failure 服务响应失败
 */
- (void)getUsersAtParameters:(id)parameters
                     success:(NetworkingSuccessBlock)success
                     failure:(NetworkingFailureBlock)failure;

/**
 更新用户信息
 
 @param success 成员返回数据
 @param failure 服务响应失败
 */
- (void)updateAtParameters:(id)parameters
                   success:(NetworkingSuccessBlock)success
                   failure:(NetworkingFailureBlock)failure;

/**
 修改登录密码
 
 @param success 成员返回数据
 @param failure 服务响应失败
 */
- (void)resetPasswordAtParameters:(id)parameters
                          success:(NetworkingSuccessBlock)success
                          failure:(NetworkingFailureBlock)failure;
/**
 添加关注
 
 @param success 成员返回数据
 @param failure 服务响应失败
 */
- (void)likeAtParameters:(id)parameters
                 success:(NetworkingSuccessBlock)success
                 failure:(NetworkingFailureBlock)failure;

/**
 取消关注
 
 @param success 成员返回数据
 @param failure 服务响应失败
 */
- (void)nolikeAtParameters:(id)parameters
                 success:(NetworkingSuccessBlock)success
                 failure:(NetworkingFailureBlock)failure;

/**
 我的关注
 
 @param success 成员返回数据
 @param failure 服务响应失败
 */
- (void)selectMyLikeAtParameters:(id)parameters
                         success:(NetworkingSuccessBlock)success
                         failure:(NetworkingFailureBlock)failure;

/**
 我的粉丝
 
 @param success 成员返回数据
 @param failure 服务响应失败
 */
- (void)selectLikeMeAtParameters:(id)parameters
                         success:(NetworkingSuccessBlock)success
                         failure:(NetworkingFailureBlock)failure;

/**
 是否关注
 
 @param success 成员返回数据
 @param failure 服务响应失败
 */
- (void)getlikeAtParameters:(id)parameters
                    success:(NetworkingSuccessBlock)success
                    failure:(NetworkingFailureBlock)failure;

///user/address/save
- (void)addressAtParameters:(id)parameters
                    success:(NetworkingSuccessBlock)success
                    failure:(NetworkingFailureBlock)failure;

///user/address/delete
- (void)deleteAtParameters:(id)parameters
                   success:(NetworkingSuccessBlock)success
                   failure:(NetworkingFailureBlock)failure;
///user/address/getList
- (void)getAddressListAtParameters:(id)parameters
                           success:(NetworkingSuccessBlock)success
                           failure:(NetworkingFailureBlock)failure;




@end
