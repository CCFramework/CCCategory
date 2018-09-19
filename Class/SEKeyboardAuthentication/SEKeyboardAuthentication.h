//
//  SEKeyboardAuthentication.h
//  bname
//
//  Created by administrator on 2018/7/17.
//  Copyright © 2018年 JerryLee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SEKeyboardAuthentication : NSObject

#pragma 正则匹配手机号
+ (BOOL)validationPhone:(NSString *)phone;

#pragma 正则匹配用户密码6-32位数字和字母组合
+ (BOOL)validationPassword:(NSString *)password;

#pragma 匹配验证码
+ (BOOL)validationCode:(NSString *)code str:(NSString*)str;

#pragma 两次密码验证
+ (BOOL)validationPassword:(NSString *)password password1:(NSString *)password1;

#pragma 验证是否为数字
+ (BOOL)validationNumber:(NSString *) Number;

#pragma 验证是否为数字、字母
+ (BOOL)validationNumberLetter:(NSString *)password;

#pragma 验证邮箱格式是否正确
+ (BOOL)validateEmail:(NSString *)email;

#pragma mark - 验证中国真实姓名
+ (BOOL)validateName:(NSString *)name;

@end
