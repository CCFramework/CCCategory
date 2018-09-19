//
//  SEAccountFileManager.h
//  bname
//
//  Created by 李飞恒 on 2018/9/13.
//  Copyright © 2018年 JerryLee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SEAccountFileManager : NSObject

/**
 应用名称
 */
@property (nonatomic, readonly) NSString *displayName;

/**
 Users路径
 */
@property (nonatomic, readonly) NSString *uPath;

/**
 Users目录下的用户列表
 */
@property (nonatomic, readonly) NSArray  *users;


+ (instancetype)sharedManager;


/**
 直接创建文件夹

 @param path 文件夹绝对路径
 @return 是否创建成功
 */
- (BOOL)createDirectoryAtPath:(NSString *)path;

/**
 在Users目录下创建文件夹

 @param uid 文件夹名称
 @return 是否创建成功
 */
- (BOOL)createAccountDirectoryAtAccountUid:(NSString *)uid;


/**
 通过用户ID删除文件目录

 @param uid 用户ID
 @return 是否删除成功
 */
- (BOOL)removeAccountDirectoryAtAccountUid:(NSString *)uid;


/**
 查找指定路径下的文件列表

 @param path 文件绝对路径
 @return 返回需要
 */
- (NSArray *)contentsDirectoryAtPath:(NSString *)path;


/**
 查询Users/account下文件目录
 
 @param uid 账号ID
 @return 账号下文件列表
 */
- (NSArray *)contentsAccountDirectoryAtDirectoryName:(NSString *)directoryName;

@end
