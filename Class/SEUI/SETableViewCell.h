//
//  SETableViewCell.h
//  SEUI
//
//  Created by iMac Maxt on 2018/7/31.
//  Copyright © 2018年 SanshengTechnologyLLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SETableViewCell : UITableViewCell

// 图片
@property (nonatomic, strong) UIImageView  *imgView;
// 标题
@property (nonatomic, strong) UILabel  *titleLab;
// 详情
@property (nonatomic, strong) UILabel  *detailsLab;

//
@property (nonatomic, strong) UIImageView  *accessoryImageView;



@end
