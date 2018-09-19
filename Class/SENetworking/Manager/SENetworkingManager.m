//
//  SENetworkingManager.m
//  bname
//
//  Created by 李飞恒 on 2018/9/14.
//  Copyright © 2018年 SanshengTechnologyLLC. All rights reserved.
//

#import "SENetworkingManager.h"
#import "AFNetworking.h"


@implementation SENetworkingManager

+ (void)reachability
{
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:
                NSLog(@"");
                break;
            case AFNetworkReachabilityStatusNotReachable:
                NSLog(@"无网络");
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
                NSLog(@"WiFi");
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
                NSLog(@"蜂窝网");
                break;
            default:
                break;
        }
        
    }];
    [manager startMonitoring];
}

+ (BOOL)disposeCode:(NSInteger)code msg:(NSString *)msg
{
    NSLog(@"%ld , %@",code, msg);
    switch (code) {
        case 200:
            return YES;
            break;
        case 400:
            [SEToastHUD showMessage:msg type:(FFToastTypeError) complete:nil];
            return NO;
            break;
        case 401:
            [SEToastHUD showMessage:msg type:(FFToastTypeWarning) complete:nil];
            return NO;
            break;
        case 500:
            [SEToastHUD showMessage:msg type:(FFToastTypeError) complete:nil];
            return NO;
            break;
        default:
            break;
    }
    return NO;
}

@end
