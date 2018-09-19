//
//  SEKeyboardAuthentication.m
//  bname
//
//  Created by administrator on 2018/7/17.
//  Copyright © 2018年 JerryLee. All rights reserved.
//

#import "SEKeyboardAuthentication.h"

@implementation SEKeyboardAuthentication
#pragma 正则匹配手机号
+ (BOOL)checkTelNumber:(NSString *) telNumber
{
    if (telNumber == nil || telNumber.length<11) {
        [FFToast showToastWithTitle:kLocalized(@"手机号验证提示") message:kLocalized(@"手机号不能为空 或 手机号码长度为11位！") iconImage:nil duration:6 toastType:FFToastTypeError];
        return NO;
    }
    
    NSString *regex = @"^(13[0-9]|14[579]|15[0-3,5-9]|17[0135678]|18[0-9]|19[89])\\d{8}$";
    
    NSPredicate *checktest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    if (![checktest evaluateWithObject:telNumber]) {
        [FFToast showToastWithTitle:kLocalized(@"手机号验证提示") message:kLocalized(@"无法识别此号码 您是不是输错了") iconImage:nil duration:6 toastType:FFToastTypeError];
        return NO;
    }
    return YES;
}
#pragma 正则匹配用户密码6-32位数字和字母组合
+ (BOOL)checkPassword:(NSString *) password
{
    if (password == nil || (password.length<=6 && password.length>=32)) {
        [FFToast showToastWithTitle:kLocalized(@"密码验证提示") message:kLocalized(@"密码不能为空 或 密码长度至少6位！") iconImage:nil duration:3 toastType:FFToastTypeError];
        return NO;
    }
    return YES;
    /** 不判断密码 */
//    NSString *pattern = @"^(?![0-9]+$)(?![a-zA-Z]+$)[a-zA-Z0-9]{6,18}";
//    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
//    BOOL isMatch = [pred evaluateWithObject:password];
//    if (!isMatch) {
//         [FFToast showToastWithTitle:kLocalized(@"密码验证提示") message:kLocalized(@"密码必须由数字和字母组合") iconImage:nil duration:3 toastType:FFToastTypeError];
//    }
//    return isMatch;
}
#pragma 匹配验证码
+ (BOOL)checkCode:(NSString *) code str:(NSString*) str{
    if (code == nil || (code.length>4 && code.length<4)){
        [FFToast showToastWithTitle:kLocalized(@"短信验证提示") message:kLocalized(@"验证码不能为空 或 验证码长度不在范围之内！") iconImage:nil duration:6 toastType:FFToastTypeError];
        return NO;
    }
    if (![code isEqualToString:str]) {
        [FFToast showToastWithTitle:kLocalized(@"短信验证提示") message:kLocalized(@"验证码错误") iconImage:nil duration:3 toastType:FFToastTypeError];
        return NO;
    }
        return YES;
}
#pragma 两次密码验证
+ (BOOL)checkPassword:(NSString *)password password1:(NSString *)password1 {
    if (![password isEqualToString:password1]){
        [FFToast showToastWithTitle:kLocalized(@"密码验证提示") message:kLocalized(@"密码不一致，请重新确认密码！") iconImage:nil duration:3 toastType:FFToastTypeError];
        return NO;
    }
    return YES;
}
#pragma 验证是否为数字
+ (BOOL)validationNumber:(NSString *) Number
{
    NSString * regex        = @"^[0-9]$";
    NSPredicate * pred      = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isMatch            = [pred evaluateWithObject:Number];
    if (isMatch) {
        return YES;
    }
    return NO;
}
#pragma 验证是否为数字、字母
+ (BOOL)validationPassword:(NSString *) password {
    NSString *pattern = @"^[A-Za-z0-9]{0,1}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:password];
    if (isMatch) {
        return YES;
    }
    return NO;
}
@end
