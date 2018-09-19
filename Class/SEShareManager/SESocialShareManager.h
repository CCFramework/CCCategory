//
//  SESocialShareManager.h
//  SESocialManager
//
//  Created by iMac Maxt on 2018/7/31.
//  Copyright © 2018年 SanshengTechnologyLLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SESocialManager.h"

typedef void(^SESocialSharePlatformSelectionBlock)(SEPlatformType platformType, NSDictionary *userInfo);

@interface SESocialShareManager : NSObject

+ (instancetype)sharedInstance;


/**
 分享到第三方平台(分享LinkCard(网页链接))
 
 表情（GIF图片，即Emotion类型，只有微信支持）
 图文（包含一张图片和一段文本）
 视频（只支持视频URL、缩略图及描述）
 音乐（只支持音乐URL、缩略图及描述）

 @param platformType 平台类型
 @param title 标题
 @param descr 内容描述
 @param imageUrl 图片
 @param webUrl 内页
 @param cvc 当前控制器
 @param completion 回调
 */
- (void)shareWebPageToPlatformType:(SEPlatformType)platformType
                             title:(NSString *)title
                             descr:(NSString *)descr
                          imageUrl:(NSString *)imageUrl
                            webUrl:(NSString *)webUrl
                               cvc:(UIViewController *)cvc
                        completion:(SESocialRequestCompletionHandler)completion;


/**
 显示系统分享面板
 
 @param completion 根据获取的platformType确定所选平台进行下一步操作
 */
- (void)showShareMenuView:(SESocialSharePlatformSelectionBlock)completion;


/**
 定制分享面板显示的分享平台

 @param completion 显示分享面板
 *  @param platforms platforms 预定于平台数组@see SEPlatformType
 *  开发者需要自己预定义自己需要的平台。
 *  此函数需要在UMSocialSharePlatformSelectionBlock之前调用，
 *  传入的平台必须是合法并且是core模块已经检测到的已经存在的平台，不然会被过滤掉(此条款是上线appStore审核的条件，开发者必须注意)
 */
- (void)showCustomShareMenuView:(SESocialSharePlatformSelectionBlock)completion platforms:(NSArray *)platforms;

@end
