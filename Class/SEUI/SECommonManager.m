//
//  SECommonManager.m
//  CZOL
//
//  Created by 李飞恒 on 2017/10/31.
//  Copyright © 2017年 SanshengIT. All rights reserved.
//

#import "SECommonManager.h"
#import <AVFoundation/AVFoundation.h>
#import <UIKit/UIKit.h>

@implementation SECommonManager

#pragma mark - 打开本地相册
+ (void)localPhotoWithDelegate:(id)delegate
{
    //本地相册不需要检查，因为UIImagePickerController会自动检查并提醒
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.delegate = delegate;
    //设置选择后的图片可被编辑
    picker.allowsEditing = YES;
    if ([delegate isKindOfClass:[UIViewController class]]) {
        [delegate presentViewController:picker animated:YES completion:nil];
    } else {
        NSLog(@"找不到控制器");
    }
    
}

#pragma mark - 检查相机是否可用
+ (BOOL)checkCamera
{
    NSString *mediaType = AVMediaTypeVideo;
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:mediaType];
    if(AVAuthorizationStatusRestricted == authStatus ||
       AVAuthorizationStatusDenied == authStatus) {
        //相机不可用
        return NO;
    }
    //相机可用
    return YES;
}

@end
