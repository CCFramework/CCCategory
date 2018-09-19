//
//  EnvironmentConfiguration.m
//  bname
//
//  Created by iMac Maxt on 2018/9/10.
//  Copyright © 2018年 SanshengTechnologyLLC. All rights reserved.
//








#import "EnvironmentConfiguration.h"

@implementation EnvironmentConfiguration



+ (instancetype)sharedInstance
{
    static dispatch_once_t onceToken;
    static EnvironmentConfiguration *configuration;
    dispatch_once(&onceToken, ^{
        configuration = [[EnvironmentConfiguration alloc] init];
        [configuration setupDefineConfiguration];
    });
    return configuration;
}

- (void)restoreConfiguration
{
    
    //开发环境
        self.HOST   = @"http://developer.bname.vip";
//    self.HOST = @"http://192.168.0.8:8002/bname";
    
    //QQ
    [self setQQ_APP_KEY:@"1106956777"];
    [self setQQ_SECRET:@"vylnQeHRGdGjFDBu"];
    //微信
    [self setWX_APP_KEY:@"wx9a60f273716f1d72"];
    [self setWX_SECRET:@"13da3c6fdda546db0fe2c535b2a68456"];
    [self setWX_PAY:@"36fd8b3d39a0b5958003cd97c2b19b76"];
    //微博
    [self setWB_APP_KEY:@"1482561865"];
    [self setWB_SECRET:@"fd1020a37aa059658d0874bfc7cbdc5d"];
    //友盟登录
    [self setUM_APP_KEY:@"598983072ae85b4f3e000d27"];
    //友盟推送
    [self setU_PUSH_APP_KEY:@"598983072ae85b4f3e000d27"];
    [self setU_PUSH_SECRET:@"aoxbciujfwagljfupg9wyiezmi7pvwnn"];
    //脸谱
    self.FB_APP_KEY = @"";
    self.FB_SECRET  = @"";
    //推特v
    self.TW_APP_KEY = @"";
    self.TW_SECRET  = @"";
    //支付宝
}

// 环境
- (NSString *)HOST
{
    
    return [[NSUserDefaults standardUserDefaults] objectForKey:@"HOST"];
}
- (void)setHOST:(NSString *)HOST
{
    [[NSUserDefaults standardUserDefaults] setObject:HOST forKey:@"HOST"];
}
//QQ
- (NSString *)QQ_APP_KEY
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:@"QQ_APP_KEY"];
}
- (void)setQQ_APP_KEY:(NSString *)QQ_APP_KEY
{
    [[NSUserDefaults standardUserDefaults] setObject:QQ_APP_KEY forKey:@"QQ_APP_KEY"];
}
- (NSString *)QQ_SECRET
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:@"QQ_SECRET"];
}
- (void)setQQ_SECRET:(NSString *)QQ_SECRET
{
    [[NSUserDefaults standardUserDefaults] setObject:QQ_SECRET forKey:@"QQ_SECRET"];
}
//微信
- (NSString *)WX_APP_KEY
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:@"WX_APP_KEY"];
}
- (void)setWX_APP_KEY:(NSString *)WX_APP_KEY
{
    [[NSUserDefaults standardUserDefaults] setObject:WX_APP_KEY forKey:@"WX_APP_KEY"];
}
- (NSString *)WX_SECRET
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:@"WX_SECRET"];
}
- (void)setWX_SECRET:(NSString *)WX_SECRET
{
    [[NSUserDefaults standardUserDefaults] setObject:WX_SECRET forKey:@"WX_SECRET"];
}
//微信支付
- (NSString *)WX_PAY
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:@"WX_PAY"];
}
- (void)setWX_PAY:(NSString *)WX_PAY
{
    [[NSUserDefaults standardUserDefaults] setObject:WX_PAY forKey:@"WX_PAY"];
}
//微博
- (NSString *)WB_APP_KEY
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:@"WB_APP_KEY"];
}
- (void)setWB_APP_KEY:(NSString *)WB_APP_KEY
{
    [[NSUserDefaults standardUserDefaults] setObject:WB_APP_KEY forKey:@"WB_APP_KEY"];
}
- (NSString *)WB_SECRET
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:@"WB_SECRET"];
}
- (void)setWB_SECRET:(NSString *)WB_SECRET
{
    [[NSUserDefaults standardUserDefaults] setObject:WB_SECRET forKey:@"WB_SECRET"];
}
//友盟
- (NSString *)UM_APP_KEY
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:@"UM_APP_KEY"];
}
- (void)setUM_APP_KEY:(NSString *)UM_APP_KEY
{
    [[NSUserDefaults standardUserDefaults] setObject:UM_APP_KEY forKey:@"UM_APP_KEY"];
}
//友盟推送
- (NSString *)U_PUSH_APP_KEY
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:@"U_PUSH_APP_KEY"];
}
- (void)setU_PUSH_APP_KEY:(NSString *)U_PUSH_APP_KEY
{
    [[NSUserDefaults standardUserDefaults] setObject:U_PUSH_APP_KEY forKey:@"U_PUSH_APP_KEY"];
}
- (NSString *)U_PUSH_SECRET
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:@"U_PUSH_SECRET"];
}
- (void)setU_PUSH_SECRET:(NSString *)U_PUSH_SECRET
{
    [[NSUserDefaults standardUserDefaults] setObject:U_PUSH_SECRET forKey:@"U_PUSH_SECRET"];
}
//脸谱
- (NSString *)FB_APP_KEY
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:@"FB_APP_KEY"];
}
- (void)setFB_APP_KEY:(NSString *)FB_APP_KEY
{
    [[NSUserDefaults standardUserDefaults] setObject:FB_APP_KEY forKey:@"FB_APP_KEY"];
}
- (NSString *)FB_SECRET
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:@"FB_SECRET"];
}
- (void)setFB_SECRET:(NSString *)FB_SECRET
{
    [[NSUserDefaults standardUserDefaults] setObject:FB_SECRET forKey:@"FB_SECRET"];
}
//推特v
- (NSString *)TW_APP_KEY
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:@"TW_APP_KEY"];
}
- (void)setTW_APP_KEY:(NSString *)TW_APP_KEY
{
    [[NSUserDefaults standardUserDefaults] setObject:TW_APP_KEY forKey:@"TW_APP_KEY"];
}
- (NSString *)TW_SECRET
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:@"TW_SECRET"];
}
- (void)setTW_SECRET:(NSString *)TW_SECRET
{
    [[NSUserDefaults standardUserDefaults] setObject:TW_SECRET forKey:@"TW_SECRET"];
}

- (void)setupDefineConfiguration
{
    if (!self.HOST) {
        [self restoreConfiguration];
    }
}



@end
