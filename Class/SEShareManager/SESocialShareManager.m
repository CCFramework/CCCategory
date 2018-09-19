//
//  SESocialShareManager.m
//  SESocialManager
//
//  Created by iMac Maxt on 2018/7/31.
//  Copyright © 2018年 SanshengTechnologyLLC. All rights reserved.
//

#import "SESocialShareManager.h"
#import <UShareUI/UShareUI.h>

@interface SESocialShareManager ()

@property (nonatomic, copy) SESocialSharePlatformSelectionBlock socialSharePlatformSelectionBlock;

@end
@implementation SESocialShareManager
static SESocialShareManager *manager;

+ (instancetype)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[SESocialShareManager alloc] init];
    });
    return manager;
}



/**
 国内平台微信、QQ、新浪微博、腾讯微博、人人网、豆瓣
 国外平台Facebook、Twitter、linkedIn、Kakao
 
 分享到第三方平台
 分享目前支持的类型有：
 
 网页类型（网页链接）
 
 图片
 
 文本
 
 表情（GIF图片，即Emotion类型，只有微信支持）
 
 图文（包含一张图片和一段文本）
 
 视频（只支持视频URL、缩略图及描述）
 
 音乐（只支持音乐URL、缩略图及描述）
 
 分享LinkCard(网页链接)

 @param platformType <#platformType description#>
 */
- (void)shareWebPageToPlatformType:(UMSocialPlatformType)platformType title:(NSString *)title descr:(NSString *)descr imageUrl:(NSString *)imageUrl webUrl:(NSString *)webUrl cvc:(UIViewController *)cvc completion:(SESocialRequestCompletionHandler)completion
{
    //创建分享消息对象
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    
    //创建网页内容对象
    NSString *thumbURL = imageUrl;
    UMShareWebpageObject *shareObject = [UMShareWebpageObject shareObjectWithTitle:title descr:descr thumImage:thumbURL];
    //设置网页地址
    shareObject.webpageUrl = webUrl;
    
    //分享消息对象设置分享内容对象
    messageObject.shareObject = shareObject;
    
    //调用分享接口
    [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:self completion:completion];
}


/**
 //显示分享面板

 @param completion 根据获取的platformType确定所选平台进行下一步操作
 */
- (void)showShareMenuView:(SESocialSharePlatformSelectionBlock)completion
{
    [UMSocialUIManager showShareMenuViewInWindowWithPlatformSelectionBlock:(UMSocialSharePlatformSelectionBlock)completion];
}



/**
 定制分享面板显示的分享平台
 
 @param completion 显示分享面板
 *  @param platforms platforms 预定于平台数组@see SEPlatformType
 *  开发者需要自己预定义自己需要的平台。
 *  此函数需要在UMSocialSharePlatformSelectionBlock之前调用，
 *  传入的平台必须是合法并且是core模块已经检测到的已经存在的平台，不然会被过滤掉(此条款是上线appStore审核的条件，开发者必须注意)
 */
- (void)showCustomShareMenuView:(SESocialSharePlatformSelectionBlock)completion platforms:(NSArray *)platforms
{
    [UMSocialUIManager setPreDefinePlatforms:platforms];
    if (completion) {
        self.socialSharePlatformSelectionBlock = completion;
        __weak typeof(self) weakSelf = self;
        [UMSocialUIManager showShareMenuViewInWindowWithPlatformSelectionBlock:^(UMSocialPlatformType platformType, NSDictionary *userInfo) {
            weakSelf.socialSharePlatformSelectionBlock((NSInteger)platformType, userInfo);
        }];
    }
    
}


@end
