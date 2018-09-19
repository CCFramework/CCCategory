//
//  UIScrollView+Ext.h
//  bname
//
//  Created by iMac Maxt on 2018/9/9.
//  Copyright © 2018年 SanshengTechnologyLLC. All rights reserved.
//

#import <UIKit/UIKit.h>


#define kDefineImg      @"icon_noting_face"
#define kTextUnSources  @"没有任何内容"

@interface UIScrollView (Ext)

- (void)showUnSourcesView:(NSString *)title placeImage:(UIImage *)placeImage certer:(CGPoint)center;


- (void)dismissUnSourcesView;


@property(nonatomic, assign, readonly, getter = isShowNoView) BOOL showNoView;

@end
