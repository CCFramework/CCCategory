//
//  SEProgressHUD.m
//  bname
//
//  Created by iMac Maxt on 2018/8/26.
//  Copyright © 2018年 SanshengTechnologyLLC. All rights reserved.
//

#import "SEProgressHUD.h"

@implementation SEProgressHUD

static UIActivityIndicatorView *_activityView;
static UIView *aView;



+ (void)show
{
    if (!aView) {
        aView = [[UIView alloc] initWithFrame:kBounds];
        aView.backgroundColor = [kTColor colorWithAlphaComponent:0.2];
        [[UIApplication sharedApplication].keyWindow addSubview:aView];
    }
    
    if (!_activityView) {
        _activityView = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 48, 48)];
        _activityView.center = CGPointMake(aView.centerX, aView.centerY-64);
        [_activityView startAnimating];
        _activityView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
        [aView addSubview:_activityView];
    }
}

+ (void)hideCompletion:(void (^ __nullable)(BOOL finished))completion
{
    [UIView animateWithDuration:0.15 animations:^{
        _activityView.alpha = 0;
    } completion:^(BOOL finished) {
        [_activityView removeFromSuperview];
        _activityView = nil;
        [aView removeFromSuperview];
        aView = nil;
        if (completion) {
            completion(finished);
        }
    }];
    
    
}


@end
