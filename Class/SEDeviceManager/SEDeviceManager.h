//
//  SEDeviceManager.h
//  SEDeviceManager
//
//  Created by iMac Maxt on 2018/8/1.
//  Copyright © 2018年 SanshengTechnologyLLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <AdSupport/ASIdentifierManager.h>

@interface SEDeviceManager : NSObject

/**
 UUID
 */
- (NSString *)UUID;

/**
 IP地址
 */
- (NSString *)localIPAddress;

/**
 设备名称
 */
- (NSString *)deviceName;

/**
 系统版本
 */
- (NSString *)systemVersion;

/**
 广东省深圳市福田区(简单的地址信息)
 */
- (NSString *)simpleAddress;

/**
 APP版本
 */
- (NSString *)appVersion;


+ (instancetype)sharedInstance;

@end
