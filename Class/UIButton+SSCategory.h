//
//  UIButton+SSCategory.h
//  YYCK
//
//  Created by 李飞恒 on 2017/7/8.
//  Copyright © 2017年 李飞恒. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^Completion)(UIButton *countDownButton);

typedef void(^Completion)(UIButton *countDownButton);
typedef void(^ButtonClickBlock)(id clickBlock);


typedef NS_ENUM(NSInteger, SSEdgeInsetsType) {
    SSEdgeInsetsTypeTitle,//标题
    SSEdgeInsetsTypeImage//图片
};

typedef NS_ENUM(NSInteger, SSMarginType) {
    SSMarginTypeTop         ,
    SSMarginTypeBottom      ,
    SSMarginTypeLeft        ,
    SSMarginTypeRight       ,
    SSMarginTypeTopLeft     ,
    SSMarginTypeTopRight    ,
    SSMarginTypeBottomLeft  ,
    SSMarginTypeBottomRight
};

@interface UIButton (SSCategory)

@property (nonatomic, copy) ButtonClickBlock clickButtonBlock;

+ (instancetype)buttonWithFrame:(CGRect)frame
                          title:(NSString *)title
                       setImage:(UIImage *)image
                     clickBlock:(void(^)(id clickBlock))block;

+ (instancetype)buttonWithFrame:(CGRect)frame
                          title:(NSString *)title
                       setImage:(UIImage *)image
             setBackgroundImage:(UIImage *)bgimage
                     clickBlock:(void(^)(id clickBlock))block;

- (void)centerImageAndTitle:(CGFloat)spacing;

- (void)centerImageAndTitle;

/**
 *  @author 王梦杰, 16-06-22 14:06:00
 *
 *  开始倒计时
 *
 *  @param startTime  倒计时时间
 *  @param unitTitle  倒计时时间单位（如：s）
 *  @param completion 倒计时结束执行的Block
 */
- (void)countDownFromTime:(NSInteger)startTime unitTitle:(NSString *)unitTitle completion:(Completion)completion;

/**
 默认情况下，imageEdgeInsets和titleEdgeInsets都是0。先不考虑height,
 
 if (button.width小于imageView上image的width){图像会被压缩，文字不显示}
 
 if (button.width < imageView.width + label.width){图像正常显示，文字显示不全}
 
 if (button.width >＝ imageView.width + label.width){图像和文字都居中显示，imageView在左，label在右，中间没有空隙}
 */


/**
 *  图片在上，标题在下，居中显示
 *
 *  @param spacing image 和 title 之间的间隙
 */
- (void)setImageUpTitleDownWithSpacing:(CGFloat)spacing;

/**
 *  图片在右，标题在左
 *
 *  @param spacing image 和 title 之间的间隙
 */
- (void)setImageRightTitleLeftWithSpacing:(CGFloat)spacing;

/**
 *  按钮默认风格：图片在标题左边
 *
 *  @param spacing image 和 title 之间的间隙
 */
- (void)setDefaultImageTitleStyleWithSpacing:(CGFloat)spacing;


/**
 *  按钮只设置了title or image，该方法可以改变它们的位置
 *
 *  @param edgeInsetsType <#edgeInsetsType description#>
 *  @param marginType     <#marginType description#>
 *  @param margin         <#margin description#>
 */
- (void)setEdgeInsetsWithType:(SSEdgeInsetsType)edgeInsetsType marginType:(SSMarginType)marginType margin:(CGFloat)margin;

//绘制UIButton对象titleLabel的渐变色特效
- (void)setTitleGradientColors:(NSArray<UIColor *> *)colors;

- (void)setImageWithURL:(NSString *)url;
- (void)setImageWithURL:(NSString *)url placeholderImage:(UIImage *)placeholderImage;


@end
