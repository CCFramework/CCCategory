//
//  SEReadNetworking.h
//  AFNetworking
//
//  Created by 李飞恒 on 2018/9/13.
//  Copyright © 2018年 JerryLee. All rights reserved.
//

#import "SEBaseNetworking.h"

@interface SEReadNetworking : SEBaseNetworking

//获取微小宝类型
///action/xinwen/liebiao
- (void)liebiaoAtParameters:(id)parameters
                    success:(NetworkingSuccessBlock)success
                    failure:(NetworkingFailureBlock)failure;

//通过类型ID获取文章列表
///action/xinwen/data
- (void)dataAtParameters:(id)parameters
                    success:(NetworkingSuccessBlock)success
                    failure:(NetworkingFailureBlock)failure;

@end
