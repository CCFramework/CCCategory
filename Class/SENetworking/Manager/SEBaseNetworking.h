//
//  SEBaseNetworking.h
//  AFNetworking
//
//  Created by 李飞恒 on 2018/9/13.
//  Copyright © 2018年 JerryLee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SEResponseObject.h"

typedef void(^NetworkingSuccessBlock)(NSURLSessionDataTask *task, SEResponseObject *responseObject);
typedef void(^NetworkingFailureBlock)(NSURLSessionDataTask * task, NSError *error);

@class AFHTTPSessionManager;
@interface SEBaseNetworking : NSObject

@property (nonatomic) NSString *host;

+ (instancetype)sharedInstance;


- (void)POST:(NSString *)url
  parameters:(id)parameters
     success:(NetworkingSuccessBlock)success
     failure:(NetworkingFailureBlock)failure;



@end


static NSString *kSENetworkReachabilityStatusReachableViaWWAN;
static NSString *kSENetworkReachabilityStatusReachableViaWiFi;
static NSString *kSENetworkReachabilityStatusUnknown;
