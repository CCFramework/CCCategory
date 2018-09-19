//
//  UINavigationController+Ext.m
//  bname
//
//  Created by iMac Maxt on 2018/7/22.
//  Copyright © 2018年 JerryLee. All rights reserved.
//

#import "UINavigationController+Ext.h"
#import <CFYNavigationBarTransition.h>
#import <CFYNavigationBar.h>
#import <UIImage+CFYNavigationBarTransition.h>
#import <UIViewController+CFYNavigationBarTransition.h>

@implementation UINavigationController (Ext)








@end
@implementation UIViewController (Ext)

- (void)setupWhiteNavagationBar
{
    [self cfy_setNavigationBarBackgroundColor:kColorWhite];
    [self cfy_setNavigationBarBackgroundImage:[UIImage cfy_imageWithColor:kColorWhite]];
    [self cfy_setNavigationBarAlpha:1];
    [self cfy_setNavigationBarShadowImageBackgroundColor:kColorWhite];
    [self cfy_setNavigationBarShadowImage:[UIImage cfy_imageWithColor:kColorWhite]];
    
    if (@available(iOS 11.0, *)) {
        //  self.navigationController.navigationBar.prefersLargeTitles = YES;
        NSDictionary *titleTextAttributes = @{NSForegroundColorAttributeName : kTColor, NSFontAttributeName:[UIFont boldSystemFontOfSize:28]};
        self.navigationController.navigationBar.largeTitleTextAttributes = titleTextAttributes;
    }
    NSDictionary *titleTextAttributes = @{NSForegroundColorAttributeName : kTColor, NSFontAttributeName:[UIFont boldSystemFontOfSize:17]};
    self.navigationController.navigationBar.titleTextAttributes = titleTextAttributes;
}

- (void)setupBlackNavagationBar
{
    [self cfy_setNavigationBarBackgroundColor:kTColor];
    [self cfy_setNavigationBarBackgroundImage:[UIImage cfy_imageWithColor:kTColor]];
    [self cfy_setNavigationBarAlpha:1];
    [self cfy_setNavigationBarShadowImageBackgroundColor:kTColor];
    [self cfy_setNavigationBarShadowImage:[UIImage cfy_imageWithColor:kTColor]];
    
    if (@available(iOS 11.0, *)) {
        // self.navigationController.navigationBar.prefersLargeTitles = YES;
        NSDictionary *titleTextAttributes = @{NSForegroundColorAttributeName : kColorWhite, NSFontAttributeName:[UIFont boldSystemFontOfSize:28]};
        self.navigationController.navigationBar.largeTitleTextAttributes = titleTextAttributes;
    }
    NSDictionary *titleTextAttributes = @{NSForegroundColorAttributeName : kColorWhite, NSFontAttributeName:[UIFont boldSystemFontOfSize:17]};
    self.navigationController.navigationBar.titleTextAttributes = titleTextAttributes;
}

- (void)setupTransparentNavagationBarWhiteTitle
{
    [self cfy_setNavigationBarBackgroundColor:kColorClear];
    [self cfy_setNavigationBarBackgroundImage:[UIImage cfy_imageWithColor:kColorClear]];
    [self cfy_setNavigationBarAlpha:0];
    [self cfy_setNavigationBarShadowImageBackgroundColor:kColorClear];
    [self cfy_setNavigationBarShadowImage:[UIImage cfy_imageWithColor:kColorClear]];
    
    
    if (@available(iOS 11.0, *)) {
        // self.navigationController.navigationBar.prefersLargeTitles = YES;
        NSDictionary *titleTextAttributes = @{NSForegroundColorAttributeName : kColorWhite, NSFontAttributeName:[UIFont boldSystemFontOfSize:28]};
        self.navigationController.navigationBar.largeTitleTextAttributes = titleTextAttributes;
    }
    NSDictionary *titleTextAttributes = @{NSForegroundColorAttributeName : kColorWhite, NSFontAttributeName:[UIFont boldSystemFontOfSize:17]};
    self.navigationController.navigationBar.titleTextAttributes = titleTextAttributes;
}

- (void)setupTransparentNavagationBarFull
{
    [self cfy_setNavigationBarBackgroundColor:kColorClear];
    [self cfy_setNavigationBarBackgroundImage:[UIImage cfy_imageWithColor:kColorClear]];
    [self cfy_setNavigationBarAlpha:0];
    [self cfy_setNavigationBarShadowImageBackgroundColor:kColorClear];
    [self cfy_setNavigationBarShadowImage:[UIImage cfy_imageWithColor:kColorClear]];
}

- (void)setupTransparentNavagationBarBlackTitle
{
    [self cfy_setNavigationBarBackgroundColor:kColorClear];
    [self cfy_setNavigationBarBackgroundImage:[UIImage cfy_imageWithColor:kColorClear]];
    [self cfy_setNavigationBarAlpha:0];
    [self cfy_setNavigationBarShadowImageBackgroundColor:kColorClear];
    [self cfy_setNavigationBarShadowImage:[UIImage cfy_imageWithColor:kColorClear]];
    
    
    if (@available(iOS 11.0, *)) {
//        self.navigationController.navigationBar.prefersLargeTitles = YES;
        NSDictionary *titleTextAttributes = @{NSForegroundColorAttributeName : kTColor, NSFontAttributeName:[UIFont boldSystemFontOfSize:28]};
        self.navigationController.navigationBar.largeTitleTextAttributes = titleTextAttributes;
    }
    NSDictionary *titleTextAttributes = @{NSForegroundColorAttributeName : kTColor, NSFontAttributeName:[UIFont boldSystemFontOfSize:17]};
    self.navigationController.navigationBar.titleTextAttributes = titleTextAttributes;
    [[UIApplication sharedApplication] statusBarStyle];
}





- (void)showChildViewController:(UIViewController *)vc animated:(BOOL)flag completion:(void (^)(BOOL finished))completion
{
    [self.navigationController addChildViewController:vc];
    [self.navigationController.view addSubview:vc.view];

    
    
    if (flag) {
        vc.view.transform = CGAffineTransformMakeTranslation(0, kHeight);
        [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:5 initialSpringVelocity:0.15 options:UIViewAnimationOptionTransitionCurlDown animations:^{
            vc.view.transform = CGAffineTransformMakeTranslation(0, 0);
        } completion:completion];
    }
}

- (void)setupAddChildViewControllerToNavanagation:(UINavigationController *)nav completion:(void (^)(void))completion
{
    
    self.view.transform = CGAffineTransformMakeTranslation(0, kHeight);
    [nav addChildViewController:self];
    [nav.view addSubview:self.view];
    
    
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:5 initialSpringVelocity:0.15 options:UIViewAnimationOptionTransitionCurlDown animations:^{
        self.view.transform = CGAffineTransformMakeTranslation(0, 0);
    } completion:^(BOOL finished) {
        
    }];
}


- (void)dismissChildViewControllerAnimated:(BOOL)flag completion:(void (^)(BOOL finished))completion
{
    
    if (flag) {
        kWeakSelf(self)
        [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:5 initialSpringVelocity:0.15 options:UIViewAnimationOptionTransitionCurlDown animations:^{
            kStrongSelf(self)
            self.view.transform = CGAffineTransformMakeTranslation(0, kHeight);
        } completion:^(BOOL finished) {
            kStrongSelf(self)
            [self.navigationController willMoveToParentViewController:self];
            [self.view removeFromSuperview];
            [self removeFromParentViewController];
            if (completion) {
                completion(finished);
            }
        }];
    } else {
        [self.navigationController willMoveToParentViewController:self];
        [self.view removeFromSuperview];
        [self removeFromParentViewController];
        if (completion) {
            completion(YES);
        }
    }
}




@end
