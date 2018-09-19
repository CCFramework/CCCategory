//
//  SEAnimateEQView.h
//  chizhaonline
//
//  Created by 李飞恒 on 2017/9/20.
//  Copyright © 2017年 SanshengIT. All rights reserved.
//

#import <UIKit/UIKit.h>


static NSInteger BAR_WIDTH = 2;
static NSInteger BAR_HEIGHT = 10;
static NSInteger BAR_PADDING = 1;

static NSString *NOTIFICATION_ANIMATE_EQ_STOP_TIMER = @"STOP_TIMER";

@interface SEAnimateEQView : UIView

@property (nonatomic, strong) UIColor *barColor;

@property (nonatomic, readonly) NSInteger numberOfBars;

- (instancetype)initWithNumberOfBars:(NSInteger)numberOfBars;

- (instancetype)initWithNumberOfBars:(NSInteger)numberOfBars barHeight:(CGFloat)height;

//开始NSTimer,开始动画
- (void)start;

//停止NSTimer无效和停止动画
- (void)stop;

@end
