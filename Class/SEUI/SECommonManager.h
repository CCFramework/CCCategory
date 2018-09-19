//
//  SECommonManager.h
//  CZOL
//
//  Created by 李飞恒 on 2017/10/31.
//  Copyright © 2017年 SanshengIT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SECommonManager : NSObject


/**
 打开本地相册

 @param delegate 接收代理 的对象
 */
+ (void)localPhotoWithDelegate:(id)delegate;


/**
 检查相机是否可用

 @return YES/NO
 */
+ (BOOL)checkCamera;

@end
