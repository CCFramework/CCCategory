//
//  SELocationManager.h
//  bname
//
//  Created by iMac Maxt on 2018/7/24.
//  Copyright © 2018年 JerryLee. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString *kLocationTitle   = @"登录操作提示";
static NSString *kLocationMessage = @"Bname 上的部分功能需要用到你的位置信息，例如发布通过位置搜索附近好友等。";
static NSString *kLocationOKTitle = @"好的,去设置";
static NSString *kLocationCancelTitle = @"不设置";

static NSString *kLOCATIONCACHEKEY;

typedef void(^LocationPerformBlock)(void);
typedef void(^LocationStartStatusBlock)(BOOL status);
@interface SELocationManager : NSObject

/**
 国家
 */
@property (nonatomic, copy) NSString *country;

/**
 省
 */
@property (nonatomic, copy) NSString *state;

/**
 市
 */
@property (nonatomic, copy) NSString *city;

/**
 区
 */
@property (nonatomic, copy) NSString *subLocality;

/**
 道路
 */
@property (nonatomic, copy) NSString *thoroughfare;

/**
 门牌号
 */
@property (nonatomic, copy) NSString *subThoroughfare;

/**
 道路 + 门牌号
 */
@property (nonatomic, copy) NSString *street;

/**
 国家 + 省 + 市 + 区 + 道路 + 门牌号
 */
@property (nonatomic, copy) NSString *addr;

/**
 经度
 */
@property (nonatomic, strong) NSNumber *latitude;

/**
 纬度
 */
@property (nonatomic, strong) NSNumber *longitude;


+ (instancetype)sharedInstance;


//开始定位
- (void)startLocation:(LocationStartStatusBlock)startStatusBlock;



/**
 更新定位
 */
- (void)updateLocation;



@end
