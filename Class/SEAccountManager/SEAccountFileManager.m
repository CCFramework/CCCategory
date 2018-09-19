//
//  SEAccountFileManager.m
//  bname
//
//  Created by 李飞恒 on 2018/9/13.
//  Copyright © 2018年 JerryLee. All rights reserved.
//

#import "SEAccountFileManager.h"

@implementation SEAccountFileManager


+ (instancetype)sharedManager
{
    static SEAccountFileManager *_sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedManager = [[[self class] alloc] init];
    });
    return _sharedManager;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        //获取应用下多用户目录
        [self createDirectoryAtPath:self.uPath];
    }
    return self;
}

- (NSString *)displayName
{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"];
}

- (NSString *)uPath
{
    return [[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSAllDomainsMask, YES) objectAtIndex:0] stringByAppendingPathComponent:self.displayName] stringByAppendingPathComponent:@"Users"];
}


- (NSArray *)users
{
    NSArray *usersPath = [self contentsDirectoryAtPath:self.uPath];
    NSMutableArray *temp = [NSMutableArray array];
    for (NSString *user in usersPath) {
        [temp addObject:[self.uPath stringByAppendingPathComponent:user]];
    }
    return [NSArray arrayWithArray:temp];
}


#pragma mark - 创建文件夹
/**
 直接创建文件夹
 
 @param path 文件夹绝对路径
 @return 是否创建成功
 */
- (BOOL)createDirectoryAtPath:(NSString *)path
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL isDir = NO;
    // fileExistsAtPath 判断一个文件或目录是否有效，isDirectory判断是否一个目录
    BOOL existed = [fileManager fileExistsAtPath:path isDirectory:&isDir];
    if (!existed) {//如果文件夹不存在
        [fileManager createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
        existed = YES;
    }
    return existed;
}


#pragma mark - 在Users目录下创建文件夹
/**
 在Users目录下创建文件夹
 
 @param uid 文件夹名称
 @return 是否创建成功
 */
- (BOOL)createAccountDirectoryAtAccountUid:(NSString *)uid
{
    return [self createDirectoryAtPath:[self.uPath stringByAppendingPathComponent:uid]];
}

#pragma mark - 通过用户ID删除文件目录
/**
 通过用户ID删除文件目录
 
 @param uid 用户ID
 @return 是否删除成功
 */
- (BOOL)removeAccountDirectoryAtAccountUid:(NSString *)uid
{
    NSError *error = nil;
    [[NSFileManager defaultManager] removeItemAtPath:[self.uPath stringByAppendingPathComponent:uid] error:&error];
    if (error == nil) {
        return YES;
    } else {
        return NO;
    }
}

#pragma mark - 查询文件夹下所有目录
/**
 查找指定路径下的文件列表
 
 @param path 文件绝对路径
 @return 返回需要
 */
- (NSArray *)contentsDirectoryAtPath:(NSString *)path
{
    NSError *error  = nil;
    NSArray *pathes = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:path error:&error];
    if (error) {
        NSLog(@"error:%@",error.userInfo);
    }
    return pathes;
}


/**
 查询Users/account下文件目录

 @param uid 账号ID
 @return 账号下文件列表
 */
- (NSArray *)contentsAccountDirectoryAtDirectoryName:(NSString *)directoryName
{
    return [self contentsDirectoryAtPath:[self.uPath stringByAppendingPathComponent:directoryName]];
}


@end
