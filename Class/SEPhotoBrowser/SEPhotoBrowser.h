//
//  SEPhotoBrowser.h
//  bname
//
//  Created by 李飞恒 on 2018/9/15.
//  Copyright © 2018年 SanshengTechnologyLLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZLPhotoActionSheet.h"


@interface SEPhotoBrowser : NSObject

+ (instancetype)manager;

- (void)showPhotoBrowserAtSelectCount:(NSInteger)selectCount index:(NSInteger)index selectImageBlock:(SelectPhotoImageBlock)selectImageBlock;

- (void)showPhotoBrowserAtSelectImageBlock:(SelectPhotoImageBlock)selectImageBlock;

- (void)removeSelectImages;
@end
