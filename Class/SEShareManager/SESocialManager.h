//
//  SESocialManager.h
//  SESocialManager
//
//  Created by iMac Maxt on 2018/7/31.
//  Copyright © 2018年 SanshengTechnologyLLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "EnvironmentConfiguration.h"

typedef NS_ENUM(NSInteger,SEPlatformType)
{
    SEPlatformType_UnKnown            = -2,
    //预定义的平台
    SEPlatformType_Predefine_Begin    = -1,
    SEPlatformType_Sina               = 0, //新浪
    SEPlatformType_WechatSession      = 1, //微信聊天
    SEPlatformType_WechatTimeLine     = 2,//微信朋友圈
    SEPlatformType_WechatFavorite     = 3,//微信收藏
    SEPlatformType_QQ                 = 4,//QQ聊天页面
    SEPlatformType_Qzone              = 5,//qq空间
    SEPlatformType_TencentWb          = 6,//腾讯微博
    SEPlatformType_AlipaySession      = 7,//支付宝聊天页面
    SEPlatformType_YixinSession       = 8,//易信聊天页面
    SEPlatformType_YixinTimeLine      = 9,//易信朋友圈
    SEPlatformType_YixinFavorite      = 10,//易信收藏
    SEPlatformType_LaiWangSession     = 11,//点点虫（原来往）聊天页面
    SEPlatformType_LaiWangTimeLine    = 12,//点点虫动态
    SEPlatformType_Sms                = 13,//短信
    SEPlatformType_Email              = 14,//邮件
    SEPlatformType_Renren             = 15,//人人
    SEPlatformType_Facebook           = 16,//Facebook
    SEPlatformType_Twitter            = 17,//Twitter
    SEPlatformType_Douban             = 18,//豆瓣
    SEPlatformType_KakaoTalk          = 19,//KakaoTalk
    SEPlatformType_Pinterest          = 20,//Pinteres
    SEPlatformType_Line               = 21,//Line
    
    SEPlatformType_Linkedin           = 22,//领英
    
    SEPlatformType_Flickr             = 23,//Flickr
    
    SEPlatformType_Tumblr             = 24,//Tumblr
    SEPlatformType_Instagram          = 25,//Instagram
    SEPlatformType_Whatsapp           = 26,//Whatsapp
    SEPlatformType_DingDing           = 27,//钉钉
    
    SEPlatformType_YouDaoNote         = 28,//有道云笔记
    SEPlatformType_EverNote           = 29,//印象笔记
    SEPlatformType_GooglePlus         = 30,//Google+
    SEPlatformType_Pocket             = 31,//Pocket
    SEPlatformType_DropBox            = 32,//dropbox
    SEPlatformType_VKontakte          = 33,//vkontakte
    SEPlatformType_FaceBookMessenger  = 34,//FaceBookMessenger
    SEPlatformType_Tim                = 35,// Tencent TIM
    
    SEPlatformType_Predefine_end      = 999,
    
    //用户自定义的平台
    SEPlatformType_UserDefine_Begin = 1000,
    SEPlatformType_UserDefine_End = 2000,
};


/**
 *  授权，分享，UserProfile等操作的回调
 *
 *  @param result 表示回调的结果
 *  @param error  表示回调的错误码
 */
typedef void (^SESocialRequestCompletionHandler)(id result,NSError *error);

@interface SESocialManager : NSObject

+ (instancetype)sharedInstance;


/**
 获取第三方授权用户信息

 @param loginType 登录类型
 @param cvc 当前的控制器
 @param completion 回调
 */
- (void)getUserInfoWithLoginType:(SEPlatformType)loginType
                             cvc:(UIViewController *)cvc
                      completion:(SESocialRequestCompletionHandler)completion;


/**
 *  动态的删除PlatformProvider，不管是预定义还是用户自定义的
 *
 *  @param platformType 平台类型 @see UMSocialPlatformType
 */
- (void)removePlatformProviderWithPlatformType:(SEPlatformType)platformType;


/**
 *  平台是否安装
 *
 *  @param platformType 平台类型 @see UMSocialPla
 *
 *  @return YES 代表安装，NO 代表未安装
 *  @note 调用前请检查是否配置好平台相关白名单: http:/
 *  在判断QQ空间的App的时候，QQApi判断会出问题
 */
- (BOOL)isInstall:(SEPlatformType)platformType;
/**
 *  当前平台是否支持分享
 *
 *  @param platformType 平台类型 @see UMSocialPlatformType
 *
 *  @return YES代表支持，NO代表不支持
 */
- (BOOL)isSupport:(SEPlatformType)platformType;

/**
 *  打开日志
 *
 *  @param isOpen YES代表打开，No代表关闭
 */
- (void)openLog:(BOOL)isOpen;


@end



