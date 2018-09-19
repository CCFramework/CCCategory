//
//  SEAccountManager.h
//  bname
//
//  Created by 李飞恒 on 2018/9/13.
//  Copyright © 2018年 JerryLee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SEAccountFileManager.h"
#import "SEAccount.h"

/**
 文件目录
 account
 files/
 media/
 */

typedef void(^SetupSuccessBlock)(SEAccount *account);
typedef void(^RemoveAccountSuccessBlock)(void);
@interface SEAccountManager : NSObject

@property (nonatomic) BOOL isLaunch;
/**
 账号 == 用户ID
 */
@property (nonatomic, readonly) SEAccount *account;
@property (nonatomic, readwrite) SESystemsetup *system;
@property (nonatomic, readonly) NSString *path;

@property (nonatomic, readonly) NSArray *media;
@property (nonatomic, readonly) NSArray *files;
@property (nonatomic, readonly) NSString *token;

+ (instancetype)sharedManager;


/**
 创建账号

 @param account 账号
 */
- (BOOL)createAccountWithAccount:(SEAccount *)account;

/**
 删除账号

 @param userID <#userID description#>
 @return <#return value description#>
 */
- (BOOL)removeAccountWithUserId:(NSString *)userID success:(RemoveAccountSuccessBlock)success;
- (void)setupUserInfoWithUser:(SEUser *)user success:(SetupSuccessBlock)success;
- (void)updateAccountWithUserId:(NSString *)uid success:(SetupSuccessBlock)success;

@end
