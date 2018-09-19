//
//  SEAccountManager.m
//  bname
//
//  Created by 李飞恒 on 2018/9/13.
//  Copyright © 2018年 JerryLee. All rights reserved.
//

#import "SEAccountManager.h"
#import "SEAccountFileManager.h"
#import "SEAccountNetworking.h"

#define kSkipLaunch   @"SkipLaunch"
#define kAccount @"account"
#define kAppJson @"userprogram"
#define kSystem @"SystemSetup"
#define kMedia @"media"
#define kFiles @"files"
#define kToken @"token"

@interface SEAccountManager ()

@property (nonatomic, readonly) NSString *uid;

@end
@implementation SEAccountManager

+ (instancetype)sharedManager
{
    static SEAccountManager *_sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedManager = [[[self class] alloc] init];
    });
    return _sharedManager;
}

- (instancetype)init {
    self = [super init];
    if (!self) {
        return nil;
    }
    return self;
}

- (BOOL)isLaunch
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:kSkipLaunch];
}
- (void)setIsLaunch:(BOOL)isLaunch
{
    [[NSUserDefaults standardUserDefaults] setBool:isLaunch forKey:kSkipLaunch];
}

- (SEAccount *)account
{
    NSString *sources = [NSString stringWithContentsOfFile:[self.path stringByAppendingPathComponent:kAccount] encoding:NSUTF8StringEncoding error:nil];
    // to do uncode
    if (sources.length) {
        return [SEAccount modelWithJSON:sources];
    }
    return nil;
}

- (SESystemsetup *)system
{
    NSString *sys = [NSString stringWithContentsOfFile:[self.path stringByAppendingPathComponent:kSystem] encoding:NSUTF8StringEncoding error:nil];
    // to do uncode
    if (sys.length) {
        return [SESystemsetup modelWithJSON:sys];
    }
    return nil;
}
- (void)setSystem:(SESystemsetup *)system
{
    if (system == nil) {
        return;
    }
    NSString *path = [self.path stringByAppendingPathComponent:kSystem];
    NSString *sysJson = [system modelToJSONString];
    NSError *error;
    [sysJson writeToFile:path atomically:YES encoding:(NSUTF8StringEncoding) error:&error];
    if (error) {
        NSLog(@"update account error :%@",error.userInfo);
        return;
    }
    NSLog(@"用户更新完成");
}

- (NSString *)uid
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:kAccount];
}

- (NSString *)path
{
    if (!self.uid) {
        return @"";
    }
    return [[[SEAccountFileManager sharedManager] uPath] stringByAppendingPathComponent:self.uid];
}

- (NSArray *)media
{
    return [self directoryWithDirectoryName:kMedia];
}
- (NSArray *)files
{
    return [self directoryWithDirectoryName:kFiles];
}
- (NSString *)token
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:kToken];
}

- (BOOL)createAccountWithAccount:(SEAccount *)account
{

    if ([[SEAccountFileManager sharedManager] createAccountDirectoryAtAccountUid:account.uid]) {
        [[NSUserDefaults standardUserDefaults] setObject:account.uid forKey:kAccount];
        [[NSUserDefaults standardUserDefaults] setObject:account.token forKey:kToken];
        
        [[SEAccountFileManager sharedManager] createAccountDirectoryAtAccountUid:[account.uid stringByAppendingPathComponent:kMedia]];
        [[SEAccountFileManager sharedManager] createAccountDirectoryAtAccountUid:[account.uid stringByAppendingPathComponent:kFiles]];
        
        NSString *accountJson = [account modelToJSONString];
        
        // to do decode
        NSError *error;
        [accountJson writeToFile:[self.path stringByAppendingPathComponent:kAccount] atomically:YES encoding:(NSUTF8StringEncoding) error:&error];
        if (error) {
            NSLog(@"create account error :%@",error.userInfo);
            return NO;
        }
        NSLog(@"用户创建完成");
        return YES;
    } else {
        return NO;
    }
}

- (BOOL)updateAccountWithAccount:(SEAccount *)account
{
    NSString *path = [self.path stringByAppendingPathComponent:kAccount];
    NSString *accountJson = [account modelToJSONString];
    NSError *error;
    [accountJson writeToFile:path atomically:YES encoding:(NSUTF8StringEncoding) error:&error];
    if (error) {
        NSLog(@"update account error :%@",error.userInfo);
        return NO;
    }
    NSLog(@"用户更新完成");
    return YES;
}

- (BOOL)removeAccountWithUserId:(NSString *)userID success:(RemoveAccountSuccessBlock)success
{
    BOOL remove = [[SEAccountFileManager sharedManager] removeAccountDirectoryAtAccountUid:userID];
    if (remove) {
        
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:kAccount];
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:kToken];
        if (success) {
            success();
        }
        return YES;
    } else {
        return NO;
    }
}



- (NSArray *)directoryWithDirectoryName:(NSString *)directoryName
{
    NSString *mediaPath = [self.uid stringByAppendingPathComponent:directoryName];
    NSArray *mediaes = [[SEAccountFileManager sharedManager] contentsAccountDirectoryAtDirectoryName:mediaPath];
    
    NSMutableArray *temp = [NSMutableArray array];
    for (NSString *fileName in mediaes) {
        [temp addObject:[[self.path stringByAppendingPathComponent:directoryName] stringByAppendingPathComponent:fileName]];
    }
    return [NSArray arrayWithArray:temp];
}

- (void)setupUserInfoWithUser:(SEUser *)user success:(SetupSuccessBlock)success
{
    
    [[SEAccountNetworking sharedInstance] updateAtParameters:[user modelToJSONObject] success:^(NSURLSessionDataTask *task, SEResponseObject *responseObject) {
        if (responseObject.httpCode == SEResponseHTTPCode200) {
            SEUser *user = [SEUser modelWithJSON:responseObject.result];
            [self updateAccountWithUserId:user.id success:success];
        }
    } failure:nil];
}


- (void)updateAccountWithUserId:(NSString *)uid success:(SetupSuccessBlock)success
{
    
    [[SEAccountNetworking sharedInstance] getUserAtParameters:@{@"userId":uid} success:^(NSURLSessionDataTask *task, SEResponseObject *responseObject) {
        if (responseObject.httpCode == SEResponseHTTPCode200) {
            SEUser *user = [SEUser modelWithJSON:responseObject.result];
            SEAccount *account = [SEAccount new];
            account.user  = user;
            account.uid   = user.id;
            account.phone = user.phone;
            account.email = user.email;
            account.alias = user.alias;
            account.token = self.token;
            account.userprogram = self.account.userprogram;
            
            
            //调用内部方法
            [[SEAccountManager sharedManager] updateAccountWithAccount:account];
            if (success) {
                success(account);
            }
        }
    } failure:nil];
}

@end
