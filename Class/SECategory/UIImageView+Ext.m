//
//  UIImageView+Ext.m
//  bname
//
//  Created by iMac Maxt on 2018/7/21.
//  Copyright © 2018年 JerryLee. All rights reserved.
//

#import "UIImageView+Ext.h"

@implementation UIImageView (Ext)

- (instancetype)initWithImageName:(NSString *)imageName
{
    return [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
}

- (void)setUrl:(NSString *)url
{
    [self setUrl:url placeholderImage:nil];
}

- (void)setUrl:(NSString *)url placeholderImage:(UIImage *)placeholderImage
{
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:placeholderImage];
}

// 获取视频第一帧
- (void)getVideoPreViewImage:(NSString *)path
{
    AVURLAsset *asset = [[AVURLAsset alloc] initWithURL:[NSURL URLWithString:path] options:nil];
    AVAssetImageGenerator *assetGen = [[AVAssetImageGenerator alloc] initWithAsset:asset];
    
    assetGen.appliesPreferredTrackTransform = YES;
    CMTime time = CMTimeMakeWithSeconds(0.0, 600);
    NSError *error = nil;
    CMTime actualTime;
    CGImageRef image = [assetGen copyCGImageAtTime:time actualTime:&actualTime error:&error];
    UIImage *videoImage = [[UIImage alloc] initWithCGImage:image];
    CGImageRelease(image);
    [self setImage:videoImage];
}


@end
