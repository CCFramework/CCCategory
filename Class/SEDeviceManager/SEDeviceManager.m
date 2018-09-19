//
//  SEDeviceManager.m
//  SEDeviceManager
//
//  Created by iMac Maxt on 2018/8/1.
//  Copyright © 2018年 SanshengTechnologyLLC. All rights reserved.
//

#import "SEDeviceManager.h"


@interface SEDeviceManager () <NSURLConnectionDelegate>

//
@property (nonatomic, strong) NSURLConnection *connection;

@end
@implementation SEDeviceManager

+ (instancetype)sharedInstance
{
    static SEDeviceManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[SEDeviceManager alloc] init];
        
    });
    return instance;
}

- (void)setup
{
//    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0); //创建信号量
//    [SEAccountNetworking aGETWithUrl:@"http://pv.sohu.com/cityjson?ie=utf-8" dictionary:nil success:^(id response) {

//        dispatch_semaphore_signal(semaphore);//不管请求状态是什么，都得发送信号，否则会一直卡着进程
//    }];
//    dispatch_semaphore_wait(semaphore,DISPATCH_TIME_FOREVER);  //等待
}






- (NSString *)UUID
{
    NSString *uuid = [[UIDevice currentDevice].identifierForVendor UUIDString];
    NSLog(@"uuid：%@",uuid);
    return uuid;
}

//获取设备IP地址
- (NSString *)localIPAddress
{
    NSError *error;
    
    NSURL *ipURL = [NSURL URLWithString:@"http://pv.sohu.com/cityjson?ie=utf-8"];
    NSMutableString *ip = [NSMutableString stringWithContentsOfURL:ipURL encoding:NSUTF8StringEncoding error:&error];
    //判断返回字符串是否为所需数据
    if ([ip hasPrefix:@"var returnCitySN = "]) {
        
        //对字符串进行处理，然后进行json解析
        //删除字符串多余字符串
        NSRange range = NSMakeRange(0, 19);
        [ip deleteCharactersInRange:range];
        NSString * nowIp =[ip substringToIndex:ip.length-1];
        
        //将字符串转换成二进制进行Json解析
        NSData * data = [nowIp dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary * dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"cip：%@",dict[@"cip"]);
        return dict[@"cip"] ? dict[@"cip"] : @"";
    }
    return @"";
}


- (NSString *)simpleAddress
{
    NSError *error;
    
    NSURL *ipURL = [NSURL URLWithString:@"http://pv.sohu.com/cityjson?ie=utf-8"];
    NSMutableString *ip = [NSMutableString stringWithContentsOfURL:ipURL encoding:NSUTF8StringEncoding error:&error];
    //判断返回字符串是否为所需数据
    if ([ip hasPrefix:@"var returnCitySN = "]) {
        
        //对字符串进行处理，然后进行json解析
        //删除字符串多余字符串
        NSRange range = NSMakeRange(0, 19);
        [ip deleteCharactersInRange:range];
        NSString * nowIp =[ip substringToIndex:ip.length-1];
        
        //将字符串转换成二进制进行Json解析
        NSData * data = [nowIp dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary * dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"localIPAddress：%@",dict[@"cname"]);
        return dict[@"cname"] ? dict[@"cname"] : @"";
    }
    return @"";
}

- (NSString *)deviceName
{
    NSString* deviceName = [[UIDevice currentDevice] systemName];
    
    NSLog(@"【SEDeviceManager】设备名称: %@",deviceName);
    return deviceName;
}

- (NSString *)systemVersion
{
    NSString *version= [UIDevice currentDevice].systemVersion;
    NSLog(@"【SEDeviceManager】设备名称: %@",version);
    return version;
}

- (NSString *)appVersion
{
    NSString *app_Version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    NSLog(@"【SEDeviceManager】App版本: %@",app_Version);
    return app_Version;
}


@end
