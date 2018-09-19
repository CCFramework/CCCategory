//
//  SETaskNetworking.h
//  AFNetworking
//
//  Created by 李飞恒 on 2018/9/14.
//  Copyright © 2018年 JerryLee. All rights reserved.
//

#import "SEBaseNetworking.h"

@interface SETaskNetworking : SEBaseNetworking

//任务
///user/usertask/getTask
- (void)taskAtParameters:(id)parameters
                    success:(NetworkingSuccessBlock)success
                    failure:(NetworkingFailureBlock)failure;

@end
