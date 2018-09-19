//
//  SEDeviceStatusView.m
//  bname
//
//  Created by iMac Maxt on 2018/8/21.
//  Copyright © 2018年 SanshengTechnologyLLC. All rights reserved.
//

#import "SEDeviceStatusView.h"

@implementation SEDeviceStatusView


+ (instancetype)deviceStatusView
{
    SEDeviceStatusView *statusVoew = [[[UINib nibWithNibName:@"SEDeviceStatusView" bundle:[NSBundle mainBundle]] instantiateWithOwner:self options:nil] firstObject];
    statusVoew.transform = CGAffineTransformMakeTranslation(0, [UIScreen mainScreen].bounds.size.height);
    return statusVoew;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)showAnimation
{
    [UIView animateKeyframesWithDuration:1.5 delay:0 options:(UIViewKeyframeAnimationOptionLayoutSubviews) animations:^{
        
        self.transform = CGAffineTransformMakeTranslation(0, 0);

    } completion:nil];
}


- (void)hideAnimation
{
    [UIView animateKeyframesWithDuration:1.5 delay:0 options:(UIViewKeyframeAnimationOptionLayoutSubviews) animations:^{
        
        self.transform = CGAffineTransformMakeTranslation(0, [UIScreen mainScreen].bounds.size.height);
        
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}


- (IBAction)statusViewAction:(UIButton *)sender {
    
    
    NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
    if([[UIApplication sharedApplication] canOpenURL:url]) {
        NSURL*url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
        //此处可以做一下版本适配，至于为何要做版本适配，大家应该很清楚
        [[UIApplication sharedApplication] openURL:url];
    }
    
    
}

@end
