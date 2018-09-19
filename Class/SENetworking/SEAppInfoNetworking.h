//
//  SEAppInfoNetworking.h
//  AFNetworking
//
//  Created by 李飞恒 on 2018/9/14.
//  Copyright © 2018年 JerryLee. All rights reserved.
//

#import "SEBaseNetworking.h"

@interface SEAppInfoNetworking : SEBaseNetworking


//增加app信息
///action/appinfo/save
- (void)addAppAtParameters:(id)parameters
                   success:(NetworkingSuccessBlock)success
                   failure:(NetworkingFailureBlock)failure DEPRECATED_ATTRIBUTE;

//获取当前用户绑定的app信息
///action/appinfo/getList
- (void)getAppInfoAtParameters:(id)parameters
                       success:(NetworkingSuccessBlock)success
                       failure:(NetworkingFailureBlock)failure DEPRECATED_ATTRIBUTE;

//删除绑定的App
///action/appinfo/delete
- (void)deleteAppAtParameters:(id)parameters
                      success:(NetworkingSuccessBlock)success
                      failure:(NetworkingFailureBlock)failure DEPRECATED_ATTRIBUTE;

@end
