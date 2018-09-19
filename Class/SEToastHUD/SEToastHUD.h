//
//  SEToastHUD.h
//  bname
//
//  Created by iMac Maxt on 2018/8/19.
//  Copyright © 2018年 SanshengTechnologyLLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FFToast.h"
#import "FFConfig.h"

static NSString *kTOAST_TITLE = @"温馨提示";

/**
 需要有导航才能显示
 */
@interface SEToastHUD : NSObject


+ (void)showMessage:(NSString *)message type:(FFToastType)type complete:(void(^)(void))complete;

+ (void)showPositionMessage:(NSString *)message type:(FFToastType)type complete:(void(^)(void))complete;

@end
