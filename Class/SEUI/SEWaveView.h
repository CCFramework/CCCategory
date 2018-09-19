//
//  SEWaveView.h
//  bname
//
//  Created by iMac Maxt on 2018/8/17.
//  Copyright © 2018年 SanshengTechnologyLLC. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^SEWaveViewBlock)(CGFloat currentY);

@interface SEWaveView : UIView

/**
 *  浪弯曲度
 */
@property (nonatomic, assign) CGFloat waveCurvature;
/**
 *  浪速
 */
@property (nonatomic, assign) CGFloat waveSpeed;
/**
 *  浪高
 */
@property (nonatomic, assign) CGFloat waveHeight;
/**
 *  浪色
 */
@property (nonatomic, strong) UIColor *wavecolor1;
@property (nonatomic, strong) UIColor *wavecolor2;
@property (nonatomic, strong) UIColor *wavecolor3;

@property (nonatomic, copy) SEWaveViewBlock waveBlock;


- (void)stopWaveAnimation;

- (void)startWaveAnimation;

@end
