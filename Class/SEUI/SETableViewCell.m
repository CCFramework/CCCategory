//
//  SETableViewCell.m
//  SEUI
//
//  Created by iMac Maxt on 2018/7/31.
//  Copyright © 2018年 SanshengTechnologyLLC. All rights reserved.
//

#import "SETableViewCell.h"

@implementation SETableViewCell

- (UIImageView *)imgView
{
    if (!_imgView) {
        _imgView = [UIImageView new];
        [self addSubview:_imgView];
    }
    return _imgView;
}

- (UILabel *)titleLab
{
    if (!_titleLab) {
        _titleLab = [UILabel new];
        [self addSubview:_titleLab];
    }
    return _titleLab;
}

- (UILabel *)detailsLab
{
    if (!_detailsLab) {
        _detailsLab = [UILabel new];
        [self addSubview:_detailsLab];
    }
    return _detailsLab;
}

- (UIImageView *)accessoryImageView
{
    if (!_accessoryImageView) {
        _accessoryImageView = [UIImageView new];
    }
    return _accessoryImageView;
}




- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
