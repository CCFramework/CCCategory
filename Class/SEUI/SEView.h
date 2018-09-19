//
//  SEView.h
//  SEUI
//
//  Created by iMac Maxt on 2018/7/31.
//  Copyright © 2018年 SanshengTechnologyLLC. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface SEView : UIView

@property (nonatomic, assign) IBInspectable BOOL radian;

//弧度
@property (nonatomic, assign) IBInspectable CGFloat  valueRadius;
//是否允许原子泄出
@property (nonatomic, assign) IBInspectable BOOL  masksToBound;

- (void)viewDidLoad;

@end
