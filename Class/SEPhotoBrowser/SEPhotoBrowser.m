//
//  SEPhotoBrowser.m
//  bname
//
//  Created by 李飞恒 on 2018/9/15.
//  Copyright © 2018年 SanshengTechnologyLLC. All rights reserved.
//

#import "SEPhotoBrowser.h"
#import <GKPhotoBrowserConfigure.h>
#import <GKPhotoBrowser.h>

@interface SEPhotoBrowser ()

@property (nonatomic) NSArray <UIImage *>*images;

@property (nonatomic) NSArray <PHAsset *>*asets;

@end
@implementation SEPhotoBrowser

+ (instancetype)manager
{
    static dispatch_once_t onceToken;
    static SEPhotoBrowser *browser;
    dispatch_once(&onceToken, ^{
        browser = [[SEPhotoBrowser alloc] init];
    });
    return browser;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.images = [NSArray array];
        self.asets  = [NSArray array];
    }
    return self;
}



- (void)showPhotoBrowserAtSelectCount:(NSInteger)selectCount index:(NSInteger)index selectImageBlock:(SelectPhotoImageBlock)selectImageBlock
{
    
    ZLPhotoActionSheet *ac = [[ZLPhotoActionSheet alloc] init];
    //如调用的方法无sender参数，则该参数必传
    ac.sender = [UIApplication sharedApplication].keyWindow.rootViewController;
    //相册参数配置，configuration有默认值，可直接使用并对其属性进行修改
    ac.configuration.maxSelectCount  = selectCount;
    ac.configuration.maxPreviewCount = 9;
    ac.configuration.cellCornerRadio = 2;
    ac.configuration.allowSelectVideo = NO;
    ac.configuration.allowSelectGif   = NO;
    ac.configuration.allowSelectLivePhoto = YES;
    ac.configuration.allowTakePhotoInLibrary = YES;
    ac.configuration.allowDragSelect = YES;
    ac.configuration.selectedMaskColor = [UIColor blackColor];
    ac.configuration.navBarColor = kTColor;
    ac.configuration.navTitleColor = kColorWhite;
    ac.configuration.bottomViewBgColor = kTColor;
    ac.configuration.bottomBtnsNormalTitleColor = kColorWhite;
    ac.configuration.bottomBtnsDisableBgColor = kTBORDERToWidth_8_Color;
    ac.configuration.showSelectedMask = YES;
    ac.configuration.selectedMaskColor = [kColorWhite colorAlpha:0.5];
    
    ac.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    [ac showPreviewAnimated:YES];
    if (self.images.count) {
        [ac previewSelectedPhotos:self.images assets:self.asets index:index isOriginal:YES];
    }
    
    kWeakSelf(self);
    [ac setSelectPhotoImageBlock:^(NSArray<UIImage *> *images, NSArray<PHAsset *> * assets, BOOL isOriginal) {
        kStrongSelf(self);
        self.images = images.mutableCopy;
        self.asets = assets.mutableCopy;
        if (selectImageBlock) {
            selectImageBlock(images, assets, isOriginal);
        }
    }];
}

+ (void)showPhotoLibraryWithSelectCount:(NSInteger)selectCount
{
    ZLPhotoActionSheet *ac = [[ZLPhotoActionSheet alloc] init];
    //如调用的方法无sender参数，则该参数必传
    ac.sender = [UIApplication sharedApplication].keyWindow.rootViewController;
    //相册参数配置，configuration有默认值，可直接使用并对其属性进行修改
    ac.configuration.maxSelectCount  = selectCount;
    ac.configuration.maxPreviewCount = 9;
    ac.configuration.cellCornerRadio = 2;
    ac.configuration.allowSelectVideo = NO;
    ac.configuration.allowSelectGif   = NO;
    ac.configuration.allowSelectLivePhoto = YES;
    ac.configuration.allowTakePhotoInLibrary = YES;
    ac.configuration.allowDragSelect = YES;
    ac.configuration.selectedMaskColor = [UIColor blackColor];
    ac.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    [ac showPhotoLibraryWithSender:[UIApplication sharedApplication].keyWindow.rootViewController];
    
}


- (void)showPhotoBrowserAtSelectImageBlock:(SelectPhotoImageBlock)selectImageBlock
{
    
    ZLPhotoActionSheet *ac = [[ZLPhotoActionSheet alloc] init];
    //如调用的方法无sender参数，则该参数必传
    ac.sender = [UIApplication sharedApplication].keyWindow.rootViewController;
    //相册参数配置，configuration有默认值，可直接使用并对其属性进行修改
    ac.configuration.maxSelectCount  = 1;
    ac.configuration.maxPreviewCount = 0;
    ac.configuration.cellCornerRadio = 10;
    ac.configuration.allowSelectVideo = NO;
    ac.configuration.allowSelectGif   = NO;
    ac.configuration.allowSelectLivePhoto = NO;
    ac.configuration.allowTakePhotoInLibrary = NO;
    ac.configuration.allowDragSelect = YES;
    ac.configuration.selectedMaskColor = [kColorWhite colorAlpha:0.5];
    ac.configuration.navBarColor = kColorWhite;
    ac.configuration.navTitleColor = kTColor;
    ac.configuration.bottomViewBgColor = kColorWhite;
    ac.configuration.bottomBtnsNormalTitleColor = kTColor;
    ac.configuration.bottomBtnsDisableBgColor = kTitleColor1;
    ac.configuration.showSelectedMask = YES;
    
    ac.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    [ac showPreviewAnimated:YES];
    if (self.images.count) {
        [ac previewSelectedPhotos:self.images assets:self.asets index:0 isOriginal:YES];
    }
    
    kWeakSelf(self);
    [ac setSelectPhotoImageBlock:^(NSArray<UIImage *> *images, NSArray<PHAsset *> * assets, BOOL isOriginal) {
        kStrongSelf(self);
        self.images = images.mutableCopy;
        self.asets = assets.mutableCopy;
        if (selectImageBlock) {
            selectImageBlock(images, assets, isOriginal);
        }
    }];
}

- (void)removeSelectImages
{
    self.images = [NSArray array];
    self.asets = [NSArray array];
}

@end
