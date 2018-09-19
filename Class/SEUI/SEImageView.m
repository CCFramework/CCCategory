//
//  SEImageView.m
//  Bname
//
//  Created by iMac Maxt on 2018/8/3.
//  Copyright © 2018年 SanshengTechnologyLLC. All rights reserved.
//

#import "SEImageView.h"
#import <UIImageView+WebCache.h>
#import <UIImageView+CCCategory.h>

@implementation SEImageView

static UIVisualEffectView *blurEffectView;
- (void)blurryImageBlur:(UIBlurEffectStyle)effectStyle
{
    blurEffectView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:effectStyle]];
    blurEffectView.frame = self.bounds;
    [self addSubview:blurEffectView];
}

- (void)setImageWithUrl:(NSString *)url
{
    [self sd_setImageWithURL:[NSURL URLWithString:url]];
}

- (void)setImageWithURL:(NSString *)url placeholderImage:(nullable UIImage *)placeholder
{
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:placeholder];
}

- (void)setImageWithURL:(NSString *)url completed:(SEExternalCompletionBlock)completedBlock
{
    [self sd_setImageWithURL:[NSURL URLWithString:url] completed:completedBlock];
}

- (void)setImageWithURL:(NSString *)url placeholderImage:(UIImage *)placeholder completed:(SEExternalCompletionBlock)completedBlock
{
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:placeholder completed:completedBlock];
}

- (void)setCornerRadius:(CGFloat)radius
{
    //设置圆角边框
    self.layer.cornerRadius = radius;
    self.layer.masksToBounds = YES;
    //设置边框及边框颜色
    self.layer.borderWidth = 1;
    self.layer.borderColor =[[UIColor lightGrayColor] CGColor];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
