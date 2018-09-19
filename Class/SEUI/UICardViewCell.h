//
//  SECardViewCell.h
//  CardSlide
//
//  Created by iMac Maxt on 2018/8/10.
//  Copyright © 2018年 SanshengTechnologyLLC. All rights reserved.
//



#import "SEView.h"

@class UICardViewCell;
typedef NS_ENUM(NSInteger, UICardViewCellStyle) {
    UICardViewCellStyleDefault
    
};

typedef NS_ENUM(NSInteger, UICardViewCellAction) {
    UICardViewCellActionLeft   = 0,
    UICardViewCellActionRight,
    UICardViewCellActionCenter
};

typedef NS_ENUM(NSInteger, UICardViewCellStatus) {
    UICardViewCellStatusWill    = -1,
    UICardViewCellStatusBegin   = 0,
    UICardViewCellStatusBeing   = 1,
    UICardViewCellStatusComplete
};

typedef void(^CardViewCellSlideActionBlock)(UICardViewCell *slideCell, UICardViewCellAction direction);
typedef void(^CardViewCellSlideStatusBlock)(UICardViewCell *slideCell, UICardViewCellStatus status);

@interface UICardViewCell : UIView

/**
 滑动完成操作 左 NO - 右 YES
 */
@property (nonatomic, copy) CardViewCellSlideActionBlock cardViewCellSlideActionBlock;
@property (nonatomic, copy) CardViewCellSlideStatusBlock cardViewCellSlideStatusBlock;

@property (assign, nonatomic) CGPoint originalPoint;
@property (assign, nonatomic) CGPoint originalCenter;
@property (assign, nonatomic) CGAffineTransform originalTransform;


- (void)clickedAction;

- (void)setSize:(CGSize)aSize center:(CGPoint)aCenter;
- (IBAction)actionMarginRight:(CGPoint)velocity;
- (IBAction)actionMarginLeft:(CGPoint)velocity;

@end


#ifndef CardHeader_h
#define CardHeader_h

#define ACTION_MARGIN_RIGHT lengthFit(150)
#define ACTION_MARGIN_LEFT lengthFit(150)
#define ACTION_VELOCITY 400 //行为速度

// 卡片的宽
#define CARD_WIDTH lengthFit(333)
#define CARD_HEIGHT lengthFit(400)

// 旋转角度
#define ROTATION_ANGLE M_PI/8

#define iPhone5AndEarlyDevice (([[UIScreen mainScreen] bounds].size.height*[[UIScreen mainScreen] bounds].size.width <= 320*568)?YES:NO)
#define Iphone6 (([[UIScreen mainScreen] bounds].size.height*[[UIScreen mainScreen] bounds].size.width <= 375*667)?YES:NO)

static inline float lengthFit(float iphone6PlusLength)
{
    if (iPhone5AndEarlyDevice) {
        return iphone6PlusLength *320.0f/414.0f;
    }
    if (Iphone6) {
        return iphone6PlusLength *375.0f/414.0f;
    }
    return iphone6PlusLength;
}
#endif
