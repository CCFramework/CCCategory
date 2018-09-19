//
//  SEPlayerManager.h
//  bname
//
//  Created by iMac Maxt on 2018/8/15.
//  Copyright © 2018年 SanshengTechnologyLLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <KSYMediaPlayer/KSYMediaPlayer.h>

typedef void(^PlayerManagerPlaybackStateBlock)(MPMoviePlaybackState state);
typedef void(^PlayerManagerLoadStateBlock)(MPMovieLoadState state);

typedef void(^PlayerProgressBlock)(CGFloat progress, NSTimeInterval  duration, CGFloat readSize);
@interface SEPlayerManager : NSObject

@property (nonatomic, assign) BOOL  isPlaying;

// 总时长
@property (nonatomic, assign) NSTimeInterval  duration;

+ (instancetype)sharedInstance;

// 播放状态
@property (nonatomic, copy) PlayerManagerPlaybackStateBlock managerPlayerbackState;

@property (nonatomic, copy) PlayerManagerLoadStateBlock managerLoadStateBlock;

- (void)setupPlayerUrl:(NSString *)url;

- (void)pause;

- (void)player;

- (void)stop;

- (UIView *)showView;
- (void)setShowViewFrame:(CGRect)frame;



/**
  progress当前播放进度  duration总时长  readSize加载进度
 */
@property (nonatomic, copy) PlayerProgressBlock  playerProgressBlock;

@end
