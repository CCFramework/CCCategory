//
//  SEViewController.m
//  SEUI
//
//  Created by iMac Maxt on 2018/7/31.
//  Copyright © 2018年 SanshengTechnologyLLC. All rights reserved.
//

#import "SEViewController.h"


@interface SEViewController ()


@property (strong, nonatomic) UIImageView *blurryImage;

@end

@implementation SEViewController



- (void)loadView
{
    [super loadView];
//    [self setupView];
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = kTColor;
    
}

- (void)setupbackgroundView
{
    self.blurryImage.sd_layout
    .topSpaceToView(self.view, 0)
    .leftSpaceToView(self.view, 0)
    .rightSpaceToView(self.view, 0)
    .bottomSpaceToView(self.view, 0);
}

- (UIImageView *)blurryImage
{
    if (!_blurryImage) {
        _blurryImage = UIImageView.new;
        [_blurryImage setImage:[UIImage imageNamed:@"backgroundImage"]];
        _blurryImage.userInteractionEnabled = NO;
        [_blurryImage cc_setEffectWithStyle:UIBlurEffectStyleDark];
        [self.view addSubview:_blurryImage];
        [self.view insertSubview:_blurryImage atIndex:0];
    }
    return _blurryImage;
}


@end
