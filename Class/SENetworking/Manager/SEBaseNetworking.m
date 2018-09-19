//
//  SEBaseNetworking.m
//  AFNetworking
//
//  Created by 李飞恒 on 2018/9/13.
//  Copyright © 2018年 JerryLee. All rights reserved.
//

#import "SEBaseNetworking.h"
#import "AFNetworking.h"
#import "EnvironmentConfiguration.h"

@implementation SEBaseNetworking

+ (instancetype)sharedInstance
{
    return [[[self class] alloc] init];
}

- (NSString *)host
{
    return [EnvironmentConfiguration sharedInstance].HOST;
}


//配置公共参数
+ (NSDictionary *)configurationCommonParametersAtApiName:(NSString *)apiName
{
    NSString *deviceName = [[SEDeviceManager sharedInstance] deviceName];
    NSString *systemVersion = [[SEDeviceManager sharedInstance] systemVersion];
    NSString *name = [[UIDevice currentDevice] name];
    NSString *model = [[UIDevice currentDevice] model];
    NSString *appVersion = [[SEDeviceManager sharedInstance] appVersion];
    
    NSString *country = [SELocationManager sharedInstance].country;
    NSString *state = [SELocationManager sharedInstance].state;
    NSString *city = [SELocationManager sharedInstance].city;
    NSString *subLocality = [SELocationManager sharedInstance].subLocality;
    NSString *simpleAddress = [[SEDeviceManager sharedInstance] simpleAddress];
    NSString *localIPAddress = [[SEDeviceManager sharedInstance] localIPAddress];
    NSString *UUID = [[SEDeviceManager sharedInstance] UUID];
    
    NSDictionary *info = @{@"deviceName":deviceName,//设置名称
                           @"systemVersion":systemVersion,//系统版本
                           @"systemType":@"iOS",//系统类型
                           @"deviceName":name,//设备名称
                           @"deviceModel":model,//设备型号
                           @"appVersion:":appVersion,//程序版本
                           @"apiName":apiName,//接口名称
                           @"openid":@"",
                           @"country":country.length?country:@"",
                           @"province":state.length?state:@"",
                           @"city":city.length?city:@"",
                           @"area":subLocality.length?subLocality:@"",
                           @"simpleAddress":simpleAddress.length?simpleAddress:@"",//简单的地址
                           @"ip":simpleAddress.length?localIPAddress:@"",//IP
                           @"uuid":UUID};//UUID
    //    NSLog(@"%@",info);
    return info;
}

#pragma mark - 处理网络状态
- (void)disposeNetworkStatus
{
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {

        switch (status) {
            case AFNetworkReachabilityStatusUnknown:
            {
                //WiFi
                [[NSNotificationCenter defaultCenter] postNotificationName:kSENetworkReachabilityStatusUnknown object:@"NetworkReachabilityStatusUnknown"];
            }
                break;
            case AFNetworkReachabilityStatusNotReachable:
            {
                //WiFi
                [[NSNotificationCenter defaultCenter] postNotificationName:kSENetworkReachabilityStatusUnknown object:@"NetworkReachabilityStatusUnknown"];
            }
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
            {
                //蜂窝网
                [[NSNotificationCenter defaultCenter] postNotificationName:kSENetworkReachabilityStatusReachableViaWWAN object:@"NetworkReachabilityStatusReachableViaWWAN"];
            }
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
            {
                //WiFi
                [[NSNotificationCenter defaultCenter] postNotificationName:kSENetworkReachabilityStatusReachableViaWiFi object:@"NetworkReachabilityStatusReachableViaWiFi"];
            }
                break;

            default:
                break;
        }
    }];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)POST:(NSString *)url
  parameters:(id)parameters
     success:(NetworkingSuccessBlock)success
     failure:(NetworkingFailureBlock)failure
{
    //每次请求都监听下网络状态
//    [self disposeNetworkStatus];
    
    
    NSString *urls = [self.host stringByAppendingString:url];
    
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    //设置请求头
    NSString *token = [SEAccountManager sharedManager].token;
    if (token) {
        [manager.requestSerializer setValue:token forHTTPHeaderField:@"Authorization"];
    }
    NSString *deviceInfo = [[[SEBaseNetworking configurationCommonParametersAtApiName:url] modelToJSONString] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [manager.requestSerializer setValue:deviceInfo forHTTPHeaderField:@"DeviceInfo"];
//    NSLog(@"Authorization:%@",token);
//    NSLog(@"DeviceInfo:%@",deviceInfo);
    //请求
    [manager POST:urls parameters:parameters progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {

        SEResponseObject *response = [SEResponseObject modelWithJSON:responseObject];
        if (parameters[@"curPage"]) {
            response.index = [parameters[@"curPage"] intValue];
        }
        
        [SENetworkingManager disposeCode:response.httpCode msg:response.msg];
        success(task, response);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"请求失败 或 超时 ：查看一下是否网络环境不正确");
        if (failure) {
            failure(task, error);
        }
    }];
}

@end
