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
+ (BOOL)validationPhone:(NSString *)phone
{
    if (phone == nil || phone.length<11) {
//        [FFToast showToastWithTitle:kLocalized(@"手机号验证提示") message:kLocalized(@"手机号不能为空 或 手机号码长度为11位！") iconImage:nil duration:6 toastType:FFToastTypeError];
        return NO;
    }
    
    NSString *regex = @"^(13[0-9]|14[579]|15[0-3,5-9]|17[0135678]|18[0-9]|19[89])\\d{8}$";
    
    NSPredicate *checktest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    if (![checktest evaluateWithObject:phone]) {
        [FFToast showToastWithTitle:kLocalized(@"手机号验证提示") message:kLocalized(@"无法识别此号码") iconImage:nil duration:6 toastType:FFToastTypeError];
        return NO;
    }
    return YES;
}

#pragma 正则匹配用户密码6-32位数字和字母组合
+ (BOOL)validationPassword:(NSString *)password
{
    return YES;
    /** 不判断密码 */
    NSString *pattern = @"^(?![0-9]+$)(?![a-zA-Z]+$)[a-zA-Z0-9]{6,32}";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:password];
    if (!isMatch) {
         [FFToast showToastWithTitle:kLocalized(@"密码验证提示") message:kLocalized(@"密码至少6位数字和字母组合") iconImage:nil duration:3 toastType:FFToastTypeError];
    }
    return isMatch;
}

#pragma 匹配验证码
+ (BOOL)validationCode:(NSString *)code str:(NSString*)str
{
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
+ (BOOL)validationPassword:(NSString *)password password1:(NSString *)password1 {
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
    return [pred evaluateWithObject:Number];
}

#pragma 验证是否为数字、字母
+ (BOOL)validationNumberLetter:(NSString *)password
{
    NSString *pattern = @"^[A-Za-z0-9]{0,1}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    if ([pred evaluateWithObject:password]) {
        return YES;
    }
    [FFToast showToastWithTitle:kLocalized(@"输入内容验证提示") message:kLocalized(@"输入内容格式无法识别") iconImage:nil duration:3 toastType:FFToastTypeError];
    return NO;
}

//邮箱
#pragma 验证邮箱格式是否正确
+ (BOOL)validateEmail:(NSString *)email
{
    NSString *emailRegex =@"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    
    if ([emailTest evaluateWithObject:email]) {
        return YES;
    }
    [FFToast showToastWithTitle:kLocalized(@"Email验证提示") message:kLocalized(@"Email验证失败") iconImage:nil duration:3 toastType:FFToastTypeError];
    return NO;
}

#pragma mark - 验证中国真实姓名
+ (BOOL)validateName:(NSString *)name
{
    if (!name.length) {
        [FFToast showToastWithTitle:kLocalized(@"真实姓名验证提示") message:kLocalized(@"请输入您的名字") iconImage:nil duration:3 toastType:FFToastTypeError];
        return NO;
    }
    //'真实姓名'正则表达式筛选
    NSString *realNamePattern = @"^[\u4e00-\u9fa5]{0,}";
    NSPredicate *realNamePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",realNamePattern];
    
    if ([realNamePredicate evaluateWithObject:name]) {
        return YES;
    }

    [FFToast showToastWithTitle:kLocalized(@"姓名验证提示") message:kLocalized(@"姓名格式不正确") iconImage:nil duration:3 toastType:FFToastTypeError];
    return NO;
}

@end
