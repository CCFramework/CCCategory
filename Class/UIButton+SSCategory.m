//
//  UIButton+SSCategory.m
//  YYCK
//
//  Created by 李飞恒 on 2017/7/8.
//  Copyright © 2017年 李飞恒. All rights reserved.
//

#import "UIButton+SSCategory.h"
#import <UIButton+WebCache.h>

#if __IPHONE_OS_VERSION_MIN_REQUIRED >= 70000
#define SS_SINGLELINE_TEXTSIZE(text, font) [text length] > 0 ? [text \
sizeWithAttributes:@{NSFontAttributeName:font}] : CGSizeZero;
#else
#define SS_SINGLELINE_TEXTSIZE(text, font) [text length] > 0 ? [text sizeWithFont:font] : CGSizeZero;
#endif


@implementation UIButton (SSCategory)

- (void)countDownFromTime:(NSInteger)startTime unitTitle:(NSString *)unitTitle completion:(Completion)completion {
    __weak typeof(self) weakSelf = self;
    // 剩余的时间（必须用__block修饰，以便在block中使用）
    __block NSInteger remainTime = startTime;
    // 获取全局队列
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    // 每隔1s钟执行一次
    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 1.0 * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
    // 在queue中执行event_handler事件
    dispatch_source_set_event_handler(timer, ^{
        if (remainTime <= 0) { // 倒计时结束
            dispatch_source_cancel(timer);
            // 回到主线程
            dispatch_async(dispatch_get_main_queue(), ^{
                weakSelf.enabled = YES;
                if (completion) {
                    
                    completion(weakSelf);
                }
            });
        } else {
            NSString *timeStr = [NSString stringWithFormat:@"%ld", remainTime];
            // 回到主线程更新UI
            dispatch_async(dispatch_get_main_queue(), ^{
                 weakSelf.titleLabel.text = [NSString stringWithFormat:@"%@%@",timeStr,unitTitle];//则不会产生频闪问题。
                [weakSelf setTitle:[NSString stringWithFormat:@"%@%@",timeStr,unitTitle] forState:UIControlStateDisabled];
               
                //倒时计的背景
//                [weakSelf setBackgroundImage:[UIImage createImageWithColor:[UIColor lightGrayColor]] forState:UIControlStateDisabled];
                weakSelf.enabled = NO;
            });
            remainTime--;
        }
    });
    dispatch_resume(timer);
}

- (void)setImageUpTitleDownWithSpacing:(CGFloat)spacing {
    // lower the text and push it left so it appears centered
    //  below the image
    CGSize imageSize = [self imageForState:UIControlStateNormal].size;
    self.titleEdgeInsets = UIEdgeInsetsMake(0.0, - imageSize.width, - (imageSize.height + spacing), 0.0);
    
    // raise the image and push it right so it appears centered
    //  above the text
    CGSize titleSize = SS_SINGLELINE_TEXTSIZE([self titleForState:UIControlStateNormal], self.titleLabel.font);
    self.imageEdgeInsets = UIEdgeInsetsMake(- (titleSize.height + spacing), 0.0, 0.0, - titleSize.width);
}

- (void)setImageRightTitleLeftWithSpacing:(CGFloat)spacing {
    CGSize imageSize = [self imageForState:UIControlStateNormal].size;
    self.titleEdgeInsets = UIEdgeInsetsMake(0, - (imageSize.width + spacing), 0, imageSize.width);
    
    CGSize titleSize = SS_SINGLELINE_TEXTSIZE([self titleForState:UIControlStateNormal], self.titleLabel.font);
    self.imageEdgeInsets = UIEdgeInsetsMake(0, titleSize.width, 0, - (titleSize.width + spacing));
}

- (void)setDefaultImageTitleStyleWithSpacing:(CGFloat)spacing {
    CGFloat delta = spacing/2.f;
    self.imageEdgeInsets = UIEdgeInsetsMake(0, -delta, 0, delta);
    self.titleEdgeInsets = UIEdgeInsetsMake(0, delta, 0, -delta);
}

- (void)setEdgeInsetsWithType:(SSEdgeInsetsType)edgeInsetsType marginType:(SSMarginType)marginType margin:(CGFloat)margin {
    CGSize itemSize = CGSizeZero;
    if (edgeInsetsType == SSEdgeInsetsTypeTitle) {
        itemSize = SS_SINGLELINE_TEXTSIZE([self titleForState:UIControlStateNormal], self.titleLabel.font);
    }
    else {
        itemSize = [self imageForState:UIControlStateNormal].size;
    }
    
    CGFloat horizontalDelta = (CGRectGetWidth(self.frame) - itemSize.width)/2.f - margin;
    CGFloat vertivalDelta = (CGRectGetHeight(self.frame) - itemSize.height)/2.f - margin;
    
    NSInteger horizontalSignFlag = 1;
    NSInteger verticalSignFlag = 1;
    
    switch (marginType) {
        case SSMarginTypeTop:
        {
            horizontalSignFlag = 0;
            verticalSignFlag = -1;
        }
            break;
        case SSMarginTypeBottom:
        {
            horizontalSignFlag = 0;
            verticalSignFlag = 1;
        }
            break;
        case SSMarginTypeLeft:
        {
            horizontalSignFlag = -1;
            verticalSignFlag = 0;
        }
            break;
        case SSMarginTypeRight:
        {
            horizontalSignFlag = 1;
            verticalSignFlag = 0;
        }
            break;
        case SSMarginTypeTopLeft:
        {
            horizontalSignFlag = -1;
            verticalSignFlag = -1;
        }
            break;
        case SSMarginTypeTopRight:
        {
            horizontalSignFlag = 1;
            verticalSignFlag = -1;
        }
            break;
        case SSMarginTypeBottomLeft:
        {
            horizontalSignFlag = -1;
            verticalSignFlag = 1;
        }
            break;
            
        case SSMarginTypeBottomRight:
        {
            horizontalSignFlag = 1;
            verticalSignFlag = 1;
        }
            break;
            
        default:
            break;
    }
    UIEdgeInsets edgeInsets = UIEdgeInsetsMake(vertivalDelta * verticalSignFlag, horizontalDelta * horizontalSignFlag, -vertivalDelta * verticalSignFlag, -horizontalDelta * horizontalSignFlag);
    if (edgeInsetsType == SSEdgeInsetsTypeTitle) {
        self.titleEdgeInsets = edgeInsets;
    }
    else {
        self.imageEdgeInsets = edgeInsets;
    }
}


+ (instancetype)buttonWithFrame:(CGRect)frame title:( NSString *)title setImage:( UIImage *)image clickBlock:(void (^)(id))block {
    return [self buttonWithFrame:frame title:title setImage:image setBackgroundImage:nil clickBlock:block];
}

+ (instancetype)buttonWithFrame:(CGRect)frame title:( NSString *)title setImage:( UIImage *)image setBackgroundImage:( UIImage *)bgimage clickBlock:(void (^)(id))block {
    UIButton *button = nil;
    if (button == nil) {
        button = [[UIButton alloc] initWithFrame:frame];
        [button setBackgroundColor:[UIColor clearColor]];
        [button setImage:image forState:(UIControlStateNormal)];
        [button setBackgroundImage:bgimage forState:(UIControlStateNormal)];
        [button addTarget:self action:@selector(clickButtonAction:) forControlEvents:(UIControlEventTouchUpInside)];
        button.clickButtonBlock = block;
    }
    return button;
}
- (void)clickButtonAction:(id)button {
    self.clickButtonBlock(button);
}

- (void)centerImageAndTitle:(CGFloat)spacing {
    CGSize imageSize = self.imageView.frame.size;
    CGSize titleSize = self.titleLabel.frame.size;
    CGFloat totalHeight = (imageSize.height + titleSize.height + spacing);
    self.imageEdgeInsets = UIEdgeInsetsMake(0,imageSize.width+10, 0.0, - titleSize.width);
    self.titleEdgeInsets = UIEdgeInsetsMake(0.0, - imageSize.width, - (totalHeight - titleSize.height),0.0);
}

- (void)centerImageAndTitle {
    const int DEFAULT_SPACING = 10.0f;//默认间距
    [self centerImageAndTitle:DEFAULT_SPACING];
}


- (void)setImageWithURL:(NSString *)url
{
    [self sd_setImageWithURL:[NSURL URLWithString:url] forState:(UIControlStateNormal)];
}

- (void)setImageWithURL:(NSString *)url placeholderImage:(UIImage *)placeholderImage
{
    [self sd_setImageWithURL:[NSURL URLWithString:url] forState:(UIControlStateNormal) placeholderImage:placeholderImage];
}


@end
