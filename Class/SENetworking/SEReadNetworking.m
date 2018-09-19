//
//  SEReadNetworking.m
//  AFNetworking
//
//  Created by 李飞恒 on 2018/9/13.
//  Copyright © 2018年 JerryLee. All rights reserved.
//

#import "SEReadNetworking.h"

@implementation SEReadNetworking

//获取微小宝类型
///action/xinwen/liebiao
- (void)liebiaoAtParameters:(id)parameters
                    success:(NetworkingSuccessBlock)success
                    failure:(NetworkingFailureBlock)failure
{
    [self POST:@"/action/xinwen/liebiao" parameters:parameters success:^(NSURLSessionDataTask *task, SEResponseObject *responseObject) {
        success(task, responseObject);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        success(task, error);
    }];
}

//通过类型ID获取文章列表
///action/xinwen/data
- (void)dataAtParameters:(id)parameters
                 success:(NetworkingSuccessBlock)success
                 failure:(NetworkingFailureBlock)failure
{
    [self POST:@"/action/xinwen/data" parameters:parameters success:^(NSURLSessionDataTask *task, SEResponseObject *responseObject) {
        success(task, responseObject);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        success(task, error);
    }];
}

@end
