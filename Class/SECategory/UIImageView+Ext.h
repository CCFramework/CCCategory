//
//  UIImageView+Ext.h
//  bname
//
//  Created by iMac Maxt on 2018/7/21.
//  Copyright © 2018年 JerryLee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UIImageView+WebCache.h>

@interface UIImageView (Ext)

- (instancetype)initWithImageName:(NSString *)imageName;

- (void)setUrl:(NSString *)url;
- (void)setUrl:(NSString *)url placeholderImage:(UIImage *)placeholderImage;

// 获取视频第一帧
- (void)getVideoPreViewImage:(NSString *)path;

@end
