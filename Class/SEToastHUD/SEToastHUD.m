//
//  SEToastHUD.m
//  bname
//
//  Created by iMac Maxt on 2018/8/19.
//  Copyright © 2018年 SanshengTechnologyLLC. All rights reserved.
//

#import "SEToastHUD.h"
#import "FFToast.h"
#import <UIColor+CCCategory.h>

@implementation SEToastHUD

+ (void)showMessage:(NSString *)message type:(FFToastType)type complete:(void(^)(void))complete
{
    FFToast *toast = [[FFToast alloc] initToastWithTitle:kTOAST_TITLE message:message iconImage:nil];
    toast.toastType             = type;
    toast.titleTextColor        = [UIColor colorWithString:@"#4A4A4A"];
    if (type == FFToastTypeWarning) {
        toast.messageTextColor      = [UIColor orangeColor];
    } else {
        toast.messageTextColor      = kColorWhite;
    }
    toast.titleFont             = [UIFont boldSystemFontOfSize:17];
    toast.messageFont           = [UIFont systemFontOfSize:15];
    toast.duration              = 5;
    toast.toastCornerRadius     = 10;
    toast.autoDismiss           = YES;
    toast.dismissToastAnimated  = YES;
    toast.enableDismissBtn      = YES;
    [toast show:complete];
}

+ (void)showPositionMessage:(NSString *)message type:(FFToastType)type complete:(void(^)(void))complete
{
    FFToast *toast = [[FFToast alloc] initToastWithTitle:kTOAST_TITLE message:message iconImage:nil];
    toast.toastType             = type;
    toast.titleTextColor        = [UIColor colorWithString:@"#4A4A4A"];
    if (type == FFToastTypeWarning) {
        toast.messageTextColor      = [UIColor orangeColor];
    } else {
        toast.messageTextColor      = kColorWhite;
    }
    toast.titleFont             = [UIFont boldSystemFontOfSize:17];
    toast.messageFont           = [UIFont systemFontOfSize:15];
    toast.duration              = 5;
    toast.toastPosition         = FFToastPositionCentreWithFillet;
    toast.autoDismiss           = YES;
    toast.dismissToastAnimated  = YES;
    toast.enableDismissBtn      = YES;
    [toast show:complete];
}

@end
