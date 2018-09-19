//
//  SESocialManager.m
//  SESocialManager
//
//  Created by iMac Maxt on 2018/7/31.
//  Copyright © 2018年 SanshengTechnologyLLC. All rights reserved.
//

#define WXRedirectURL @"http://www.umeng.com/social"
#define QQRedirectURL @"http://mobile.umeng.com/social"
#define WBRedirectURL @"https://www.bname.vip/weibo/social"

#import "SESocialManager.h"
#import <UMShare/UMShare.h>
#import <UMCommon/UMCommon.h>


@implementation SESocialManager
static SESocialManager *manager;

+ (instancetype)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[SESocialManager alloc] init];
        [manager createSocial];
    });
    return manager;
}

- (void)createSocial
{
    EnvironmentConfiguration *environment = [EnvironmentConfiguration sharedInstance];
    
    [UMConfigure setLogEnabled:YES];
    [UMConfigure initWithAppkey:environment.UM_APP_KEY channel:@"App Store"];
    
    
    if (environment.WX_APP_KEY && environment.WX_SECRET) {
        //微信
        [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_WechatSession appKey:environment.WX_APP_KEY appSecret:environment.WX_SECRET redirectURL:WXRedirectURL];
        //微信朋友圈
        [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_WechatTimeLine appKey:environment.WX_APP_KEY appSecret:environment.WX_SECRET redirectURL:WXRedirectURL];
        //微信收藏
        [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_WechatFavorite appKey:environment.WX_APP_KEY appSecret:environment.WX_SECRET redirectURL:WXRedirectURL];
    } else {
        NSLog(@"微信 WX_APP_KEY:%@   WX_SECRET:%@",environment.WX_APP_KEY, environment.WX_SECRET);
    }
    
    
    if (environment.QQ_APP_KEY && environment.QQ_SECRET) {
        //QQ
        [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_QQ appKey:environment.QQ_APP_KEY appSecret:environment.QQ_SECRET redirectURL:QQRedirectURL];
        //qq空间
        [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_Qzone appKey:environment.QQ_APP_KEY appSecret:environment.QQ_SECRET redirectURL:QQRedirectURL];
    } else {
        NSLog(@"QQ QQAppKey:%@   QQ_Secret:%@",environment.QQ_APP_KEY, environment.QQ_SECRET);
    }
    
    
    //微博
    if (environment.WB_APP_KEY && environment.WB_SECRET) {
        [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_Sina appKey:environment.WB_APP_KEY appSecret:environment.WB_SECRET redirectURL:WBRedirectURL];
    } else {
        NSLog(@"微博 WBAppKey:%@   WB_Secret:%@",environment.WB_APP_KEY, environment.WB_SECRET);
    }
    
}

- (void)openLog:(BOOL)isOpen
{
    [[UMSocialManager defaultManager] openLog:isOpen];
}


- (void)getUserInfoWithLoginType:(SEPlatformType)loginType cvc:(UIViewController *)cvc completion:(SESocialRequestCompletionHandler)completion
{
    [[UMSocialManager defaultManager] getUserInfoWithPlatform:(NSInteger)loginType currentViewController:cvc completion:completion];
}

/**
 *  动态的删除PlatformProvider，不管是预定义还是用户自定义的
 *
 *  @param platformType 平台类型 @see UMSocialPlatformType
 */
- (void)removePlatformProviderWithPlatformType:(SEPlatformType)platformType
{
    [[UMSocialManager defaultManager] removePlatformProviderWithPlatformType:(NSInteger)platformType];
}


/**
 *  平台是否安装
 *
 *  @param platformType 平台类型 @see UMSocialPlatformType
 *
 *  @return YES 代表安装，NO 代表未安装
 *  @note 调用前请检查是否配置好平台相关白名单: http://dev.umeng.com/social/ios/quick-integration#1_3
 *  在判断QQ空间的App的时候，QQApi判断会出问题
 */
- (BOOL)isInstall:(SEPlatformType)platformType
{
    return [[UMSocialManager defaultManager] isInstall:(NSInteger)platformType];
}

/**
 *  当前平台是否支持分享
 *
 *  @param platformType 平台类型 @see UMSocialPlatformType
 *
 *  @return YES代表支持，NO代表不支持
 */
- (BOOL)isSupport:(SEPlatformType)platformType
{
    return [[UMSocialManager defaultManager] isSupport:(NSInteger)platformType];
}

@end
