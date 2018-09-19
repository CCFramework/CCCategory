//
//  UINavigationController+Ext.h
//  bname
//
//  Created by iMac Maxt on 2018/7/22.
//  Copyright © 2018年 JerryLee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (Ext)



@end


@interface UIViewController (Ext)

//这三个方法需要在viewWillAppear调用 否则字体颜色无效 
- (void)setupWhiteNavagationBar;
- (void)setupBlackNavagationBar;
- (void)setupTransparentNavagationBarWhiteTitle;
- (void)setupTransparentNavagationBarBlackTitle;
- (void)setupTransparentNavagationBarFull;

//- (void)showChildViewController:(UIViewController *)vc animated:(BOOL)flag completion:(void (^)(BOOL finished))completion;
//- (void)setupAddChildViewControllerToNavanagation:(UINavigationController *)nav completion:(void (^)(void))completion;
//
//- (void)dismissChildViewControllerAnimated:(BOOL)flag completion:(void (^)(BOOL finished))completion;


@end
