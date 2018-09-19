//
//  SECardViewCell.m
//  CardSlide
//
//  Created by iMac Maxt on 2018/8/10.
//  Copyright © 2018年 SanshengTechnologyLLC. All rights reserved.
//
#import "UICardViewCell.h"



@interface UICardViewCell ()


@end
@implementation UICardViewCell

- (void)setupCardViewDefaults
{
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(beingDragged:)];
    [self addGestureRecognizer:panGesture];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupCardViewDefaults];
    }
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupCardViewDefaults];
    }
    return self;
}

- (void)setSize:(CGSize)aSize center:(CGPoint)aCenter
{
    self.frame = CGRectMake(0, 0, aSize.width, aSize.height);
    self.center = aCenter;
    self.originalCenter = aCenter;
    [self setupCardViewDefaults];
}


#pragma mark ------------- 拖动手势
static CGFloat centerY;
static CGFloat centerX;

- (IBAction)beingDragged:(UIPanGestureRecognizer *)gesture {
    
    centerX = [gesture translationInView:self].x;
    centerY = [gesture translationInView:self].y;
    
    switch (gesture.state) {
        case UIGestureRecognizerStatePossible:
//            NSLog(@"0");
            // the recognizer has not yet recognized its gesture, but may be evaluating touch events. this is the default state
            break;
        case UIGestureRecognizerStateBegan: {
//            NSLog(@"1");
            // the recognizer has received touches recognized as the gesture. the action method will be called at the next turn of the run loop
            if (self.cardViewCellSlideStatusBlock) {
                self.cardViewCellSlideStatusBlock(self, UICardViewCellStatusWill);
            }
        }
            break;
        case UIGestureRecognizerStateChanged: {
//            NSLog(@"2");
            // the recognizer has received touches recognized as a change to the gesture. the action method will be called at the next turn of the run loop
            {
                CGFloat rotationStrength = MIN(centerX / 414, 0.93);
                CGFloat rotationAngel = (CGFloat) (M_PI/8 * rotationStrength);
                CGFloat scale = MAX(1 - fabs(rotationStrength) / 4, 0.93);
                
                self.center = CGPointMake(self.originalCenter.x + centerX, self.originalCenter.y + centerY);
                
                CGAffineTransform transform      = CGAffineTransformMakeRotation(rotationAngel);
                CGAffineTransform scaleTransform = CGAffineTransformScale(transform, scale, scale);
                
                kWeakSelf(self)
                [UIView animateWithDuration:0.15 animations:^{
                    kStrongSelf(self)
                    self.transform = scaleTransform;
                }];
                if (self.cardViewCellSlideStatusBlock) {
                    self.cardViewCellSlideStatusBlock(self, UICardViewCellStatusBeing);
                }
            }
        }
            break;
        case UIGestureRecognizerStateEnded: {
//            NSLog(@"3");
            // the recognizer has received touches recognized as the end of the gesture. the action method will be called at the next turn of the run loop and the recognizer will be reset to UIGestureRecognizerStatePossible
            [self followUpActionWithDistance:centerX andVelocity:[gesture velocityInView:self.superview]];
        }
            break;
        case UIGestureRecognizerStateCancelled: {
//            NSLog(@"4");
            // the recognizer has received touches resulting in the cancellation of the gesture. the action method will be called at the next turn of the run loop. the recognizer will be reset to UIGestureRecognizerStatePossible
        }
            break;
        case UIGestureRecognizerStateFailed: {
//            NSLog(@"5");
            
        }
            break;
            
        default:
            break;
    }
}

#pragma mark - 滑动完成处理
- (void)followUpActionWithDistance:(CGFloat)distance andVelocity:(CGPoint)velocity
{
    if (centerX < 0 && (distance < -ACTION_MARGIN_LEFT || velocity.x < -ACTION_VELOCITY)) {
        [self actionMarginLeft:velocity];
    } else if (centerX > 0 && (distance > ACTION_MARGIN_RIGHT || velocity.x > ACTION_VELOCITY)) {
        [self actionMarginRight:velocity];
    } else {
        kWeakSelf(self)
        [UIView animateWithDuration:0.3 animations:^{
            kStrongSelf(self)
            self.center = self.originalCenter;
            self.transform = CGAffineTransformMakeRotation(0);
        }];
        if (self.cardViewCellSlideActionBlock) {
            self.cardViewCellSlideActionBlock(self, UICardViewCellActionCenter);
        }
    }
}

- (IBAction)actionMarginRight:(CGPoint)velocity
{
    //横向移动距离
    CGFloat distanceX = [[UIScreen mainScreen]bounds].size.width + CARD_WIDTH + self.originalPoint.x;
    //纵向移动距离
    CGFloat distanceY = distanceX * centerY / centerX;
    //目标center点
    CGPoint finishPoint = CGPointMake(self.originalCenter.x + distanceX, self.originalCenter.y + distanceY);
    //滑动手势横纵合速度
    CGFloat vel = sqrtf(pow(velocity.x, 2)+pow(velocity.y, 2));
    //需要动画完成的剩下距离
    CGFloat displace = sqrt(pow(distanceX - centerX, 2) + pow(distanceY - centerY, 2));
    //动画时间
    CGFloat duration = fabs(displace/vel);
    if (duration > 0.6) {
        duration = 0.6;
    } else if(duration < 0.3) {
        duration = 0.3;
    }
    
    kWeakSelf(self)
    [UIView animateWithDuration:duration animations:^{
        kStrongSelf(self)
        self.center    = finishPoint;
        self.transform = CGAffineTransformMakeRotation(ROTATION_ANGLE);
    } completion:^(BOOL complete){
        if (self.cardViewCellSlideActionBlock) {
            self.cardViewCellSlideActionBlock(self, UICardViewCellActionRight);
        }
    }];
    if (self.cardViewCellSlideStatusBlock) {
        self.cardViewCellSlideStatusBlock(self, UICardViewCellStatusComplete);
    }
}

- (IBAction)actionMarginLeft:(CGPoint)velocity
{
    if (!velocity.y) {
        velocity = CGPointMake(velocity.x, 384);
    }
    //横向移动距离
    CGFloat distanceX = -CARD_WIDTH - self.originalPoint.x;
    //纵向移动距离
    CGFloat distanceY = distanceX * centerY / centerX;
    //目标center点
    CGPoint finishPoint = CGPointMake(self.originalPoint.x + distanceX, self.originalPoint.x + distanceY);
    //滑动手势横纵合速度
    CGFloat vel = sqrtf(pow(velocity.x, 2) + pow(velocity.y, 2));
    //需要动画完成的剩下距离
    CGFloat displace = sqrtf(pow(distanceX - centerX, 2) + pow(distanceY - centerY, 2));
    //动画时间
    CGFloat duration = fabs(displace/vel);
    if (duration > 0.6) {
        duration = 0.6;
    } else if(duration < 0.3) {
        duration = 0.3;
    }
    
    kWeakSelf(self)
    [UIView animateWithDuration:duration animations:^{
        kStrongSelf(self)
        self.center = finishPoint;
        self.transform = CGAffineTransformMakeRotation(-ROTATION_ANGLE);
    } completion:^(BOOL finished) {
        if (self.cardViewCellSlideActionBlock) {
            self.cardViewCellSlideActionBlock(self, UICardViewCellActionLeft);
        }
    }];
    if (self.cardViewCellSlideStatusBlock) {
        self.cardViewCellSlideStatusBlock(self, UICardViewCellStatusComplete);
    }
}



- (void)dealloc
{
    NSLog(@"%s",__FUNCTION__);
}


@end


