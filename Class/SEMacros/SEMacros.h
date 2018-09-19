//
//  SEMacros.h
//  SEMacros
//
//  Created by 李飞恒 on 2018/9/14.
//  Copyright © 2018年 JerryLee. All rights reserved.
//

#import <UIKit/UIKit.h>


#define kBounds ([UIScreen mainScreen].bounds)

#define kWidth  ([UIScreen mainScreen].bounds.size.width)
#define kHeight ([UIScreen mainScreen].bounds.size.height)

#define SCREEN_MAX_LENGTH   (MAX(kWidth, kHeight))
#define SCREEN_MIN_LENGTH   (MIN(kWidth, kHeight))

#define kBnameDefineY (kStatusHeight+64)


#define kDivision(v) (v/2)
#define kRandom(v) (arc4random_uniform(v))


/**
 状态栏高度
 */
#define kStatusHeight ([UIApplication sharedApplication].statusBarFrame.size.height)
#define kNavigationHeight (kStatusHeight+44)
#define KIphoneX (CGSizeEqualToSize(CGSizeMake(375.f, 812.f), [UIScreen mainScreen].bounds.size) || CGSizeEqualToSize(CGSizeMake(812.f, 375.f), [UIScreen mainScreen].bounds.size))



#define kTTitleColor (kColorHex(@"#19ABEF"))

#define kTColor      (kColorHex(@"#161824"))
// 非表情的特殊文字 Non-expressive special text
#define kTNON_EXPRESSIVE_ST_Color  ([UIColor colorWithHex:0x046363])
// 非特殊文字 Non-special words
#define kTNON_SPECIAL_WORDS_Color  ([UIColor colorWithHex:0x292929])
#define kTBORDERToWidth_4_Color [UIColor colorWithHex:0xcccccc]
#define kTBORDERToWidth_8_Color [UIColor colorWithHex:0xf0f0f0]
#define kTBORDERToWidth_Line_Color [UIColor colorWithHex:0xE5E5E5]
#define kTBORDER_TextBlack_Color [UIColor colorWithHex:0x444444]
#define kTBORDER_TextGrey1_Color [UIColor colorWithHex:0x8c8c8c]

#define random(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
#define kRandomColor random(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256), 1.0)

/**十六进制颜色 + 透明度*/
#define kColorHexAlpha(colorV,a) [UIColor colorWithHexColorString:@#colorV alpha:a]
/**十六进制颜色*/
#define kColorHex(str) ([UIColor colorWithString:str])
#define kColorClHex(str) ([[UIColor colorWithString:str] colorWithAlphaComponent:0.8])
/** 女 */
#define kGrilColor (kColorHex(@"#FF7994"))
/** 男 */
#define kManColor  (kColorHex(@"#1890FF"))

//#define kRedColor  (kColorHex(@"#FF4081"))
//#define kCyanColor (kColorHex(@"#50E3C2"))
//#define kGrayColor (kColorHex(@"#D8D8D8"))
#define kGainsboroColor (kColorHex(@"#A0A0A0"))

#define kDefineColor (kColorHex(@"#000000"))
#define kTitleColor  (kColorHex(@"#4A4A4A"))
#define kTitleColor1 (kColorHex(@"#9B9B9B"))
#define kLineColor   [UIColor lightGrayColor]/*(kColorHex(@"#E5E5E5"))*/
#define kIconColor   (kColorHex(@"#B9BCC2"))
#define kColorWhite  ([UIColor whiteColor])
#define kColorClear  ([UIColor clearColor])




#define kURL(v)      ([NSURL URLWithString:v])

/**Int 转 NSString*/
#define kITS(i) [NSString stringWithFormat:@"%@",@(i)]
/**国际化调用@param key 文字*/
#define kLocalized(key) (NSLocalizedString(key, key))

#define kWeakSelf(type)     __weak typeof(type) weak##type = type;

#define kStrongSelf(type)   __strong typeof(type) type = weak##type;





//重写NSLog,Debug模式下打印日志和当前行数
#if DEBUG

#define SELog(format, ...) do {                                             \
fprintf(stderr, "------->\n");                                               \
fprintf(stderr, "<%s : %d> %s\n",                                           \
[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String],  \
__LINE__, __func__);                                                        \
(NSLog)((format), ##__VA_ARGS__);                                           \
fprintf(stderr, "<-------\n");                                               \
} while (0)
#define NSLogRect(rect) NSLog(@"%s x:%.4f, y:%.4f, w:%.4f, h:%.4f", #rect, rect.origin.x, rect.origin.y, rect.size.width, rect.size.height)
#define NSLogSize(size) NSLog(@"%s w:%.4f, h:%.4f", #size, size.width, size.height)
#define NSLogPoint(point) NSLog(@"%s x:%.4f, y:%.4f", #point, point.x, point.y)
#else
#define NSLog(FORMAT, ...) nil
#define NSLogRect(rect) nil
#define NSLogSize(size) nil
#define NSLogPoint(point) nil
#endif

