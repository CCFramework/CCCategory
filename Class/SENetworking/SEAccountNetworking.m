//
//  SEAccountNetworking.m
//  AFNetworking
//
//  Created by 李飞恒 on 2018/9/13.
//  Copyright © 2018年 JerryLee. All rights reserved.
//

#import "SEAccountNetworking.h"
#import "SEAccountManager.h"

@interface SEAccountNetworking ()



@end
@implementation SEAccountNetworking



//重新获取token
- (void)regainTokenAtAccountUid:(NSString *)uid
                        success:(NetworkingSuccessBlock)success
                        failure:(NetworkingFailureBlock)failure DEPRECATED_ATTRIBUTE
{
    [self POST:@"????" parameters:@{@"id":uid} success:^(NSURLSessionDataTask *task, id responseObject) {
        success(task, responseObject);
    } failure:failure];
}
//获取文件上传token
///user/common/getToken
- (void)getQiniuTokenAtParameters:(id)parameters
                          success:(NetworkingSuccessBlock)success
                          failure:(NetworkingFailureBlock)failure DEPRECATED_ATTRIBUTE
{
    [self POST:@"/user/common/getToken" parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        success(task, responseObject);
    } failure:failure];
}
//短信验证
///user/common/sendCode
- (void)sendCodeAtParameters:(id)parameters
                     success:(NetworkingSuccessBlock)success
                     failure:(NetworkingFailureBlock)failure DEPRECATED_ATTRIBUTE
{
    [self POST:@"/user/common/sendCode" parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        success(task, responseObject);
    } failure:failure];
}
//邮箱验证
///user/common/sendEmail
- (void)sendEmailAtParameters:(id)parameters
                      success:(NetworkingSuccessBlock)success
                      failure:(NetworkingFailureBlock)failure DEPRECATED_ATTRIBUTE
{
    [self POST:@"/user/common/sendEmail" parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        success(task, responseObject);
    } failure:failure];
}
//用户注册
///user/regist
- (void)registAtParameters:(id)parameters
                   success:(NetworkingSuccessBlock)success
                   failure:(NetworkingFailureBlock)failure DEPRECATED_ATTRIBUTE
{
    [self POST:@"/user/regist" parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        success(task, responseObject);
    } failure:failure];
}

//用户登录
- (void)loginAtParameters:(id)parameters
                  success:(NetworkingSuccessBlock)success
                  failure:(NetworkingFailureBlock)failure DEPRECATED_ATTRIBUTE
{
    [self POST:@"/user/login" parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        
        //        NSDictionary *userInfo = responseObject[@"result"][@"user"];
        //        SEAccount *account = [SEAccount new];
        //        account.userInfo = userInfo;
        //        account.token = responseObject[@"result"][@"token"];
        //        account.uid = userInfo[@"id"];
        //        account.phone = userInfo[@"phone"];
        //        account.email = userInfo[@"email"];
        //        account.password = parameters[@"password"];
        //        [[SEAccountManager sharedManager] createAccountWithAccount:account];
        //        NSLog(@"%@", [[SEAccountManager sharedManager] contentsDirectoryAtPathFilesDirectory]);
        success(task, responseObject);
    } failure:failure];
}
//第三方登录
//
- (void)sanFangLoginAtParameters:(id)parameters
                         success:(NetworkingSuccessBlock)success
                         failure:(NetworkingFailureBlock)failure DEPRECATED_ATTRIBUTE
{
    [self POST:@"/user/SanFangLogin" parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        success(task, responseObject);
    } failure:failure];
}


//更新用户信息
//
- (void)updateAtParameters:(id)parameters
                   success:(NetworkingSuccessBlock)success
                   failure:(NetworkingFailureBlock)failure DEPRECATED_ATTRIBUTE
{
    [self POST:@"/user/update" parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        success(task, responseObject);
    } failure:failure];
}
//修改登录密码
///user/resetPassword
- (void)resetPasswordAtParameters:(id)parameters
                          success:(NetworkingSuccessBlock)success
                          failure:(NetworkingFailureBlock)failure DEPRECATED_ATTRIBUTE
{
    [self POST:@"/user/resetPassword" parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        success(task, responseObject);
    } failure:failure];
}
//添加关注
///user/userlike/like
- (void)likeAtParameters:(id)parameters
                 success:(NetworkingSuccessBlock)success
                 failure:(NetworkingFailureBlock)failure DEPRECATED_ATTRIBUTE
{
    [self POST:@"/user/userlike/like" parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        success(task, responseObject);
    } failure:failure];
}
//取消关注
///user/userlike/nolike
- (void)nolikeAtParameters:(id)parameters
                   success:(NetworkingSuccessBlock)success
                   failure:(NetworkingFailureBlock)failure DEPRECATED_ATTRIBUTE
{
    [self POST:@"/user/userlike/nolike" parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        success(task, responseObject);
    } failure:failure];
}
//我的关注
///user/userlike/selectMyLike
- (void)selectMyLikeAtParameters:(id)parameters
                         success:(NetworkingSuccessBlock)success
                         failure:(NetworkingFailureBlock)failure DEPRECATED_ATTRIBUTE
{
    [self POST:@"/user/userlike/selectMyLike" parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        success(task, responseObject);
    } failure:failure];
}
//我的粉丝
///user/userlike/selectLikeMe
- (void)selectLikeMeAtParameters:(id)parameters
                         success:(NetworkingSuccessBlock)success
                         failure:(NetworkingFailureBlock)failure DEPRECATED_ATTRIBUTE
{
    [self POST:@"/user/userlike/selectLikeMe" parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        
        success(task, responseObject);
    } failure:failure];
}
//是否关注
///user/userlike/getlike
- (void)getlikeAtParameters:(id)parameters
                    success:(NetworkingSuccessBlock)success
                    failure:(NetworkingFailureBlock)failure DEPRECATED_ATTRIBUTE
{
    [self POST:@"/user/userlike/getlike" parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        success(task, responseObject);
    } failure:failure];
}

///user/address/save
- (void)addressAtParameters:(id)parameters
                    success:(NetworkingSuccessBlock)success
                    failure:(NetworkingFailureBlock)failure DEPRECATED_ATTRIBUTE
{
    [self POST:@"/user/address/save" parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        success(task, responseObject);
    } failure:failure];
}

///user/address/delete
- (void)deleteAtParameters:(id)parameters
                   success:(NetworkingSuccessBlock)success
                   failure:(NetworkingFailureBlock)failure DEPRECATED_ATTRIBUTE
{
    [self POST:@"/user/address/delete" parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        success(task, responseObject);
    } failure:failure];
}
///user/address/getList
- (void)getAddressListAtParameters:(id)parameters
                           success:(NetworkingSuccessBlock)success
                           failure:(NetworkingFailureBlock)failure DEPRECATED_ATTRIBUTE
{
    [self POST:@"/user/address/getList" parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        success(task, responseObject);
    } failure:failure];
}


/**
 获取用户信息
 
 @param success 成员返回数据
 @param failure 服务响应失败
 */
- (void)getUserAtParameters:(id)parameters
                    success:(NetworkingSuccessBlock)success
                    failure:(NetworkingFailureBlock)failure
{
//    SEAccount *account = [[SEAccountManager sharedManager] account];
    [self POST:@"/user/getUser" parameters:parameters success:success failure:failure];
}

/**
 获取多个用户信息
 
 @param success 成员返回数据
 @param failure 服务响应失败
 */
- (void)getUsersAtParameters:(id)parameters
                     success:(NetworkingSuccessBlock)success
                     failure:(NetworkingFailureBlock)failure
{
    [self POST:@"/user/getUsers" parameters:parameters success:success failure:failure];
}

@end
