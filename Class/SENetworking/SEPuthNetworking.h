//
//  SEPuthNetworking.h
//  AFNetworking
//
//  Created by 李飞恒 on 2018/9/14.
//  Copyright © 2018年 JerryLee. All rights reserved.
//

#import "SEBaseNetworking.h"

@interface SEPuthNetworking : SEBaseNetworking


//推送消息给个人/多人/圈子中的所有人
///action/push/to/someone
- (void)pushAtParameters:(id)parameters
                   success:(NetworkingSuccessBlock)success
                   failure:(NetworkingFailureBlock)failure DEPRECATED_ATTRIBUTE;

@end
