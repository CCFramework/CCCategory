//
//  EnvironmentConfiguration.h
//  bname
//
//  Created by iMac Maxt on 2018/9/10.
//  Copyright © 2018年 SanshengTechnologyLLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EnvironmentConfiguration : NSObject

+ (instancetype)sharedInstance;

// 环境
@property (nonatomic, copy) NSString  *HOST;
//QQ
@property (nonatomic, copy) NSString  *QQ_APP_KEY;
@property (nonatomic, copy) NSString  *QQ_SECRET;
//微信
@property (nonatomic, copy) NSString  *WX_APP_KEY;
@property (nonatomic, copy) NSString  *WX_SECRET;
//微信支付
@property (nonatomic, copy) NSString  *WX_PAY;
//微博
@property (nonatomic, copy) NSString  *WB_APP_KEY;
@property (nonatomic, copy) NSString  *WB_SECRET;
//友盟
@property (nonatomic, copy) NSString  *UM_APP_KEY;
//友盟推送
@property (nonatomic, copy) NSString  *U_PUSH_APP_KEY;
@property (nonatomic, copy) NSString  *U_PUSH_SECRET;
//脸谱
@property (nonatomic, copy) NSString  *FB_APP_KEY;
@property (nonatomic, copy) NSString  *FB_SECRET;
//推特v
@property (nonatomic, copy) NSString  *TW_APP_KEY;
@property (nonatomic, copy) NSString  *TW_SECRET;





- (void)restoreConfiguration;

@end
