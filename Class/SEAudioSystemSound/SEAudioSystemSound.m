//
//  SEAudioSystemSound.m
//  播放系统声音
//
//  Created by iMac Maxt on 2018/8/26.
//  Copyright © 2018年 SanshengTechnologyLLC. All rights reserved.
//

#import "SEAudioSystemSound.h"
#import <AVFoundation/AVFoundation.h>

@implementation SEAudioSystemSound

+ (instancetype)sharedInstance
{
    static dispatch_once_t onceToken;
    static SEAudioSystemSound *account;
    dispatch_once(&onceToken, ^{
        account = [[SEAudioSystemSound alloc] init];
    });
    return account;
}


/**
 播放系统音效--电话音效
 */
+ (void)playerPhoneSound:(SEPhoneSound)phonesound
{
    [[SEAudioSystemSound sharedInstance] setupType:phonesound];
}

/**
 播放系统音效--消息音效
 */
+ (void)playerMessageSound:(SEMessageSound)messagesound
{
    [[SEAudioSystemSound sharedInstance] setupType:messagesound];
}

/**
 播放系统音效--震动音效
 */
+ (void)playerVibrationSound:(SEVibrationSound)vibrationsound
{
    [[SEAudioSystemSound sharedInstance] setupType:vibrationsound];
}

/**
 播放系统音效--音乐音效
 */
+ (void)playerMelodySound:(SEMelodySound)melodysound
{
    [[SEAudioSystemSound sharedInstance] setupType:melodysound];
}

/**
 播放系统音效--动效
 */
+ (void)playerFxSound:(SEFxSound)fxsound
{
    [[SEAudioSystemSound sharedInstance] setupType:fxsound];
}

/**
 播放系统音效--其他音效
 */
+ (void)playerOtherSound:(SEOtherSound)othersound
{
    [[SEAudioSystemSound sharedInstance] setupType:othersound];
}


- (void)setupType:(SystemSoundID)type
{
    AudioServicesPlaySystemSound(type);
}

@end
