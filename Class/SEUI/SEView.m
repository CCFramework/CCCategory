//
//  SEView.m
//  SEUI
//
//  Created by iMac Maxt on 2018/7/31.
//  Copyright © 2018年 SanshengTechnologyLLC. All rights reserved.
//

#import "SEView.h"
#import <UIView+CCCategory.h>

@interface SEView ()
{
    
    CGFloat centerX;
    CGFloat centerY;
}

@end
@implementation SEView

- (void)setRadian:(BOOL)radian
{
    _radian = radian;
    if (radian) {
        [self setCornerRadius:self.height/2];
    }
}

- (void)setValueRadius:(CGFloat)radius
{
    self.layer.cornerRadius = radius;
}

- (void)setMasksToBounds:(BOOL)bounds
{
    self.layer.masksToBounds = bounds;
}

- (void)setupViewDefaults
{
    self.backgroundColor = [UIColor clearColor];
    
}

//- (UIView *)contentView
//{
//    if (!_contentView) {
//        _contentView = [[UIView alloc] initWithFrame:self.bounds];
//        _contentView.backgroundColor = kColorClear;
//        _contentView.userInteractionEnabled = YES;
//        _contentView.contentMode = UIViewContentModeScaleAspectFill;
//        _contentView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
//        [self addSubview:_contentView];
//    }
//    return _contentView;
//}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViewDefaults];
        NSLog(@"%s", __func__);
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setupViewDefaults];
        NSLog(@"%s", __func__);
    }
    return self;
}


- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)setNeedsLayout
{
    [super setNeedsLayout];
//    [self sendSubviewToBack:self.contentView];
}
- (void)layoutIfNeeded
{
    [super layoutIfNeeded];
//    [self sendSubviewToBack:self.contentView];
}

- (void)setNeedsDisplay
{
    [super setNeedsDisplay];
//    [self sendSubviewToBack:self.contentView];
}
- (void)layoutSubviews
{
    [super layoutSubviews];
//    [self sendSubviewToBack:self.contentView];
}


- (NSString*)description {
    NSLog(@"%s", __func__);
    NSString* description = [super description];
    description = [description substringToIndex:description.length - 1];
    description = [description stringByAppendingFormat:@"; %@>", NSStringFromCGRect(self.frame)];
    return description;
}

- (void)dealloc
{
    NSLog(@"%s",__FUNCTION__);
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    [self viewDidLoad];
}


- (void)viewDidLoad
{
//    [self sendSubviewToBack:self.contentView];
}


@end
