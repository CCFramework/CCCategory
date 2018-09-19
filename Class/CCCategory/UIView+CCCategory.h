//
//  UIView+CCCategory.h
//  CCCategoryDemo
//
//  Created by 李飞恒 on 16/4/5.
//  Copyright © 2016年 MuZiLee. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, CCUIViewBadgeStyle) {
    CCUIViewBadgeStyleRedDot = 0,
    CCUIViewBadgeStyleNumber = 1 << 0,
    CCUIViewBadgeStyleNew    = 1 << 1,
};

typedef NS_ENUM(NSUInteger, CCUIViewBadgeAnimType) {
    CCUIViewBadgeAnimTypeNone    = 0,       /** 无标记动画 */
    CCUIViewBadgeAnimTypeScale   = 1 << 0,  /** 标记动画比例扩大 */
    CCUIViewBadgeAnimTypeShake   = 1 << 1,  /** 无标记动画摇摆 */
    CCUIViewBadgeAnimTypeBreathe = 1 << 2   /** 无标记动画心跳 */
};

typedef NS_ENUM(NSInteger, CCUIViewBorderOptions) {
    CCUIViewBorderOptionNone   = 0,
    CCUIViewBorderOptionTop    = 1 << 0,/** 边框添加在顶部 */
    CCUIViewBorderOptionRight  = 1 << 1,/** 边框添加在右边 */
    CCUIViewBorderOptionBottom = 1 << 2,/** 边框添加在底部 */
    CCUIViewBorderOptionLeft   = 1 << 3 /** 边框添加在左边 */
};

#define kPx(s) (s*0.5)

typedef void (^GestureActionBlock)(UIGestureRecognizer *gestureRecoginzer);


@interface UIView (CCCategory)

@property (nonatomic) CGFloat x; /* self.origin.x */
@property (nonatomic) CGFloat y; /* self.origin.y */

@property (nonatomic) CGFloat maxX; /* CGRectGetMaxX(self.frame) */
@property (nonatomic) CGFloat minX; /* CGRectGetMinX(self.frame) */
@property (nonatomic) CGFloat maxY; /* CGRectGetMaxY(self.frame) */
@property (nonatomic) CGFloat minY; /* CGRectGetMinY(self.frame) */

@property (nonatomic) CGFloat width;    /* self.frame.size.width */
@property (nonatomic) CGFloat height;   /* self.frame.size.height */

@property (nonatomic) CGSize  size;     /* self.frame.size */
@property (nonatomic) CGPoint origin;   /* self.frame.origin */

@property (nonatomic, assign) CGFloat top;      /* self.origin.y */
@property (nonatomic, assign) CGFloat bottom;   /* self.top + self.height */
@property (nonatomic, assign) CGFloat left;     /* self.origin.x */
@property (nonatomic, assign) CGFloat right;    /* self.left + self.width */

@property (nonatomic, assign) CGFloat centerX; /* self.center.x */
@property (nonatomic, assign) CGFloat centerY; /* self.center.y */

@property (nonatomic, assign, readonly) CGFloat orientationIsPortraitWidth;/** 返回竖屏\横屏时的宽度. */
@property (nonatomic, assign, readonly) CGFloat orientationIsPortraitHeight;/** 返回竖屏\横屏时的宽度. */
#pragma mark - init
- (instancetype)cc_createLayerView:(CGRect)frame;

#pragma mark -


/**
 *  添加一组子视图
 *
 *  @param views 子视图数组
 */
- (void)addSubviews:(NSArray *)views;
/**
 *  移除指定一组子视图
 *
 *  @param views 需要移除的子视图数组
 */
- (void)removeSubviews:(NSArray *)views;
/**
 *  移除所有子视图
 */
- (void)removeAllSubviews;

#pragma mark - cuttTool(切圆/切割)
@property (nonatomic, assign, readonly) CGFloat cornerRadius; /** 获取弧度 */
- (void)setCornerRadius:(CGFloat)cornerRadius;/** 设置弧度 */
/*!
 *  添加边框
 *
 *  @param borderDirect 方向
 *  @param color        框架颜色
 *  @param width        边框宽度
 *
 */
- (void)cc_setBorderDirect:(CCUIViewBorderOptions)borderDirect
                      color:(UIColor *)color
                      width:(CGFloat)width;


/*!
 *  添加阴影 (注意,切勿添加clipsToBounds,否则阴影无效)
 *
 *  @param color  阴影颜色
 *  @param size   阴影偏移量
 *  @param radius 阴影厚度 (默认值为3)
 *  @param alpha  阴影透明度0->1
 *
 */
- (void)cc_setShadowColor:(UIColor *)color
              shadowOffset:(CGSize )size
              shadowRadius:(CGFloat)radius
                     alpha:(CGFloat)alpha;

#pragma mark - ----------- Badge -----------

- (void)cc_shakeView;

@property (nonatomic, strong) UILabel *badge;
@property (nonatomic, assign) CCUIViewBadgeAnimType aniType;

- (void)cc_showUIBadge;
- (void)cc_showBadgeWithStyle:(CCUIViewBadgeStyle)style value:(NSInteger)value animationType:(CCUIViewBadgeAnimType)aniType;
- (void)cc_clearBadge;

#pragma mark - ----------- animate -----------
/** 移动到指定位置 */
- (void)cc_moveTo:(CGPoint)destination duration:(float)secs option:(UIViewAnimationOptions)option;
/** 移动到指定位置 代理 移动完成后执行SEL */
- (void)cc_moveTo:(CGPoint)destination duration:(float)secs option:(UIViewAnimationOptions)option delegate:(id)delegate callback:(SEL)method;

- (void)cc_raceTo:(CGPoint)destination withSnapBack:(BOOL)withSnapBack;
- (void)cc_raceTo:(CGPoint)destination withSnapBack:(BOOL)withSnapBack delegate:(id)delegate callback:(SEL)method;

/**
 *  旋转动画
 *
 *  @param degrees  旋转角度
 *  @param duration 旋转一周时间
 *  @param delegate 代理者
 *  @param method   旋转动画完成后,代理需要执行的SEL
 */
- (void)cc_rotate:(int)degrees duration:(NSTimeInterval)duration delegate:(id)delegate callback:(SEL)method;
/**
 *  按指定比例扩大或缩小
 *
 *  @param duration 执行时间
 *  @param scaleX   扩大 x轴
 *  @param scaleY   扩大 y轴
 *  @param delegate 代理
 *  @param method   动画完成后,代理需要执行的SEL
 */
- (void)cc_scaleDuration:(NSTimeInterval)duration x:(float)scaleX y:(float)scaleY delegate:(id)delegate callback:(SEL)method;

/**
 *  顺时针方向旋转 (无循环)
 *
 *  @param secs 旋转一周时间
 */
- (void)cc_spinClockwise:(NSTimeInterval)secs;
/**
 *  逆时针旋转 (无循环)
 *
 *  @param secs 旋转一周时间
 */
- (void)cc_spinCounterClockwise:(NSTimeInterval)secs;


- (void)cc_AnimationCurlDownFromDuration:(NSTimeInterval)duration;
- (void)cc_AnimationCurlUpFromDuration:(NSTimeInterval)duration;

/** 指定谈入/谈出时间 并设置谈入谈出最终透明值 */
- (void)cc_AlphaFormDuration:(NSTimeInterval)duration alpha:(CGFloat)alpha;
/** 谈出0.3 -> 谈入1.0 */
- (void)cc_SparklDuration:(float)duration isLoop:(BOOL)isLoop;


#pragma mark - ----------- add subview -----------
/** 添加子视图 有动画的 */
- (void)cc_addSubview:(UIView *)view alphaAnimationDuration:(NSTimeInterval)duration;

#pragma mark - ----------- UITapGestureRecognizer -----------
/**
 *  为UIView添加点击手势
 *
 *  @param isOpen 是否开启
 *  @param action 点击响应回调
 */
- (void)cc_addTargetForOpenRecognizer:(BOOL)isOpen ActionrRespond:(GestureActionBlock)action;
/**
 *  为UIView添加长按手势
 *
 *  @param isOpen 是否开启
 *  @param action 手势响应回调
 */
- (void)cc_addTongForOpenRecognizer:(BOOL)isOpen ActionrRespond:(GestureActionBlock)action;

/**
 *  返回第一响应者的ViewController
 */
- (UIViewController *)cc_firstResponderViewController;

@end

@interface UIView (CCCategory_UINib)

+ (instancetype)nibWithFrame:(CGRect)frame;

@end


@interface UIView (EffectView)

/** 设置Effect效果 */
- (void)cc_setEffectWithStyle:(UIBlurEffectStyle)effectStyle;
- (void)cc_setEffectWithStyle:(UIBlurEffectStyle)effectStyle backgroundImage:(UIImage *)backgroundImage;

@end

