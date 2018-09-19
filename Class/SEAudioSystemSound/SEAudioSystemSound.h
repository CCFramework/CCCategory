//
//  SEAudioSystemSound.h
//  播放系统声音
//
//  Created by iMac Maxt on 2018/8/26.
//  Copyright © 2018年 SanshengTechnologyLLC. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef NS_ENUM(NSInteger, SEPhoneSound) {

    SEPhoneSoundTelephoneConnection = 30,//电话连线
    SEPhoneSoundBusyTone = 32,//忙音
};

typedef NS_ENUM(NSInteger, SEMessageSound) {
    
    SEMessageSoundSendMessage = 1000,//刷新接收到的消息
    SEMessageSoundSendMessage1 = 1001,//发送消息
    SEMessageSoundSendMessage2 = 1018,//发送消息
    SEMessageSoundSendMessage3 = 1055,//发送消息
    SEMessageSoundSendMessage4 = 1303,//发送消息 强震
    
    SEMessageSoundNewMessage1 = 1002,//新消息提示
    SEMessageSoundNewMessage2 = 1012,//新消息提示
    SEMessageSoundNewMessage3 = 1015,//新消息提示
    
    SEMessageSoundWithinInAppSend = 1003,//应用内发送
    
    SEMessageSoundBatteryLow = 1006,//电量不足提示音
    
    SEMessageSoundNailing = 1006,//钉钉提示音
    
    SEMessageSoundCloseLock = 1305,//关锁
    SEMessageSoundKeyboardInput = 1306,//键盘输入音效
};

typedef NS_ENUM(NSInteger, SEVibrationSound) {
    
    SEVibrationSoundVibration = 1011,//震动
  
    SEVibrationSoundVibrationStrong = 1311,//震动 强
    
    SEVibrationSoundPositiveVibrationsStrong = 1352,//正向震动 强
    SEVibrationSoundReverseShockStrong = 1353,//反向震动 强
};

typedef NS_ENUM(NSInteger, SEMelodySound) {
    
    SEMelodySound1 = 1020,//
    SEMelodySound2 = 1021,//
    SEMelodySound3 = 1022,
    SEMelodySound4 = 1023,
    SEMelodySound5 = 1024,
    SEMelodySound6 = 1025,
    SEMelodySound7 = 1026,
    SEMelodySound8 = 1027,
    SEMelodySound9 = 1028,
    SEMelodySound10 = 1029,
    SEMelodySound11 = 1034,
    
    SEMelodySound12 = 1030,
    SEMelodySound13 = 1031,
    SEMelodySound14 = 1032,
    
    SEMelodySound15 = 1033,
    
    SEMelodySound16 = 1035,
    SEMelodySound17 = 1036
    
};

typedef NS_ENUM(NSInteger, SEFxSound) {
    
    SEFxSoundGuanBing = 1100,//关屏音效
    SEFxSoundTactileVibration = 1102,//触感震动
    SEFxSoundTactileVibration2 = 1102,//触感震动
    SEFxSoundPhone = 1108,//拍照
    
//    SEFxSound = 1159,//
//    SEFxSound = 1160,//
    
    SEFxSoundSmallJumpLight = 1161,//短跳2下 轻
    SEFxSoundSmallJumpContinuous = 1162,//连续短跳多次 轻
    
    SEFxSoundPositiveJitter = 1519,//正向抖动
    SEFxSoundReverseJitter = 1520,//反向抖动
    SEFxSoundPositiveAndNegativeJitter = 1521//正反抖动两下
};



typedef NS_ENUM(NSInteger, SEOtherSound) {
    
    SEOtherSoundError = 1053,//错误提示
    SEOtherSoundSurprise = 1509,//惊喜
    SEOtherSoundBlisters1 = 1396,//水泡音效
    SEOtherSoundBlisters2 = 1397,//水泡音效
    SEOtherSoundPay1 = 1394,//支付完成
    SEOtherSoundPay2 = 1407,//支付完成
};


@interface SEAudioSystemSound : NSObject


/**
 播放系统音效--电话音效
 */
+ (void)playerPhoneSound:(SEPhoneSound)phonesound;
/**
 播放系统音效--消息音效
 */
+ (void)playerMessageSound:(SEMessageSound)messagesound;
/**
 播放系统音效--震动音效
 */
+ (void)playerVibrationSound:(SEVibrationSound)vibrationsound;
/**
 播放系统音效--音乐音效
 */
+ (void)playerMelodySound:(SEMelodySound)melodysound;
/**
 播放系统音效--动效
 */
+ (void)playerFxSound:(SEFxSound)fxsound;
/**
 播放系统音效--其他音效
 */
+ (void)playerOtherSound:(SEOtherSound)othersound;


@end
