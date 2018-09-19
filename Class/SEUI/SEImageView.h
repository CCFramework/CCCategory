//
//  SEImageView.h
//  Bname
//
//  Created by iMac Maxt on 2018/8/3.
//  Copyright © 2018年 SanshengTechnologyLLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UIImageView+WebCache.h>

typedef void(^SEExternalCompletionBlock)(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL);

@interface SEImageView : UIImageView

- (void)blurryImageBlur:(UIBlurEffectStyle)effectStyle;

- (void)setImageWithUrl:(NSString *)url;

- (void)setImageWithURL:(NSString *)url placeholderImage:(nullable UIImage *)placeholder;

- (void)setImageWithURL:(NSString *)url completed:(SEExternalCompletionBlock)completedBlock;

- (void)setImageWithURL:(NSString *)url placeholderImage:(UIImage *)placeholder completed:(SEExternalCompletionBlock)completedBlock;

- (void)setCornerRadius:(CGFloat)radius;

@end
