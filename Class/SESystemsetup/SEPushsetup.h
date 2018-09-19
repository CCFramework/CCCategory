//
//  SEPushsetup.h
//  SESystemsetup
//
//  Created by 李飞恒 on 2018/9/13.
//  Copyright © 2018年 JerryLee. All rights reserved.
//

//推送设置
#import <Foundation/Foundation.h>

@interface SEPushsetup : NSObject

/**
 是否接收通知
 */
@property (nonatomic) BOOL receiptNotification;

//--------- 互动通知
@property (nonatomic) BOOL atNotification;
@property (nonatomic) BOOL replyNotification;
@property (nonatomic) BOOL favourNotification;

//--------- 话题通知
@property (nonatomic) BOOL subjectNotfication;

//--------- 通知黑名单
@property (nonatomic) NSArray *blacklistNotfication;
//--------- 通知白名单
@property (nonatomic) NSArray *whitelistsNotfication;


//--------- 好友黑名单
@property (nonatomic) NSArray *blacklistFriends;
//--------- 好友白名单
@property (nonatomic) NSArray *whitelistsFriends;

@end
