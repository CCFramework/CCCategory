//
//  SEPlayerManager.m
//  bname
//
//  Created by iMac Maxt on 2018/8/15.
//  Copyright © 2018年 SanshengTechnologyLLC. All rights reserved.
//

#import "SEPlayerManager.h"
#import <AVFoundation/AVFoundation.h>


@interface SEPlayerManager ()

@property (nonatomic, strong) KSYMoviePlayerController *playerController;


@end

@implementation SEPlayerManager

+ (instancetype)sharedInstance
{
    static dispatch_once_t onceToken;
    static SEPlayerManager *account;
    dispatch_once(&onceToken, ^{
        account = [[SEPlayerManager alloc] init];
    });
    return account;
}

- (void)setupPlayerUrl:(NSString *)url
{
    url = [url isEmptyString];
    if (_playerController) {
        [_playerController removeObserver:self forKeyPath:@"playbackState"];
        [_playerController removeObserver:self forKeyPath:@"loadState"];
        [_playerController stop];
    }
    
    
    _playerController = [[KSYMoviePlayerController alloc] init];
    [_playerController reset:YES];
    [_playerController setUrl:[NSURL URLWithString:url]];
    [_playerController prepareToPlay];
    _playerController.controlStyle = 0;
    _playerController.shouldAutoplay = YES;
    _playerController.bInterruptOtherAudio = YES;
    _playerController.audioPan = 0.0;
    
    [_playerController prepareToPlay];
    [_playerController addObserver:self forKeyPath:@"playbackState" options:(NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew) context:nil];
    [_playerController addObserver:self forKeyPath:@"loadState" options:(NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew) context:nil];
    [_playerController addObserver:self forKeyPath:@"currentPlaybackTime" options:(NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew) context:nil];
    [_playerController addObserver:self forKeyPath:@"readSize" options:(NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew) context:nil];
}

- (UIView *)showView
{
    return _playerController.view;
}
- (void)setShowViewFrame:(CGRect)frame
{
    _playerController.view.frame = frame;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(KSYMoviePlayerController *)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"playbackState"]) {
        if (self.managerPlayerbackState) {
            self.managerPlayerbackState(object.playbackState);
        }
    }
    
    /*
     MPMovieLoadStateUnknown        = 0,        // 加载情况未知
     MPMovieLoadStatePlayable       = 1 << 0,   // 加载完成，可以播放
     MPMovieLoadStatePlaythroughOK  = 1 << 1,   // 加载完成，如果shouldAutoplay为YES，将自动开始播放
     MPMovieLoadStateStalled        = 1 << 2,   // 如果视频正在加载中
     */
    if ([keyPath isEqualToString:@"loadState"]) {
        if (self.managerLoadStateBlock) {
            self.managerLoadStateBlock(object.loadState);
        }
        if (object.loadState == MPMovieLoadStatePlayable) {
            self.duration = object.duration;
        }
    }
    
    if ([keyPath isEqualToString:@"currentPlaybackTime"]) {
        self.duration = object.duration;
        
        if (self.playerProgressBlock) {
            self.playerProgressBlock(object.currentPlaybackTime, object.duration, object.readSize);
        }
        
    }
    
    if ([keyPath isEqualToString:@"readSize"]) {
        
        if (self.playerProgressBlock) {
            self.playerProgressBlock(object.currentPlaybackTime, object.duration, object.readSize);
        }
        
        
    }
}

- (BOOL)isPlaying
{
    return _playerController.isPlaying;
}

- (void)pause
{
    [_playerController pause];
}

- (void)player
{
    [_playerController play];
}

- (void)stop
{
    [_playerController stop];
}

@end
