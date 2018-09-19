//
//  SENetworkingManager.h
//  bname
//
//  Created by 李飞恒 on 2018/9/14.
//  Copyright © 2018年 SanshengTechnologyLLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SEBaseNetworking.h"

@interface SENetworkingManager : NSObject

+ (void)reachability;

+ (BOOL)disposeCode:(NSInteger)code msg:(NSString *)msg;


@end
