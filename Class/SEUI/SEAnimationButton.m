//
//  SEAnimationButton.m
//  bname
//
//  Created by iMac Maxt on 2018/9/4.
//  Copyright © 2018年 SanshengTechnologyLLC. All rights reserved.
//

#import "SEAnimationButton.h"


@interface SEAnimationButton ()

//
//
@property (nonatomic, strong) UIImageView  *imageView;

@end

@implementation SEAnimationButton

- (instancetype)init {
    if(!(self = [super init])) return nil;
    [self initialize];
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if(!(self = [super initWithFrame:frame])) return nil;
    [self initialize];
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if(!(self = [super initWithCoder:aDecoder])) return nil;
    [self initialize];
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self initialize];
}

- (UIImageView *)imageView
{
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:_imageView];
        [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(self).offset(0);
            make.right.bottom.mas_equalTo(self).offset(-3);
        }];
    }
    return _imageView;
}

- (void)setImage:(UIImage *)image
{
    _image = image;
    self.imageView.image = image;
}

- (void)initialize
{
    [self setBackgroundColor:[UIColor clearColor]];
    
    [self invalidateIntrinsicContentSize];
    [self imageView];
}


@end
