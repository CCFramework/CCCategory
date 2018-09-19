//
//  NSString+SSCategory.m
//  YYCK
//
//  Created by 李飞恒 on 2017/7/5.
//  Copyright © 2017年 李飞恒. All rights reserved.
//

#import "NSString+SSCategory.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (SSCategory)

//GET HASHED STRING
+ (NSString*)digest:(NSString*)input {
    
    const char *cstr = [(NSString*)input cStringUsingEncoding:NSUTF8StringEncoding];
    NSData *data = [NSData dataWithBytes:cstr length:strlen(cstr)];
    
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    
    CC_SHA1(data.bytes, (uint32_t)data.length, digest);
    
    NSMutableString* output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    
    NSString * pw = [output substringToIndex:8];
    
    return pw;
}


- (NSString *)stringFromMD5 {
    
    if(self == nil || [self length] == 0)
        return nil;
    
    const char *value = [self UTF8String];
    
    unsigned char outputBuffer[CC_MD5_DIGEST_LENGTH];
    CC_MD5(value, strlen(value), outputBuffer);
    
    NSMutableString *outputString = [[NSMutableString alloc] initWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(NSInteger count = 0; count < CC_MD5_DIGEST_LENGTH; count++){
        [outputString appendFormat:@"%02x",outputBuffer[count]];
    }
    
    return outputString;
}

- (CGSize)sizeWithSize:(CGSize)size andFont:(UIFont *)font
{
    NSDictionary *attr = @{NSFontAttributeName:font};
    return [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:attr context:nil].size;
}

- (CGSize)sizeWithFont:(UIFont *)font forWidth:(CGFloat)width {
    return [self sizeWithSize:CGSizeMake(width, MAXFLOAT) andFont:font];
}
- (CGSize)sizeWithFont:(UIFont *)font forHeight:(CGFloat)height {
    return [self sizeWithSize:CGSizeMake(MAXFLOAT, height) andFont:font];
}


- (NSString *)getOriginalImageURL
{
    return [self stringByReplacingOccurrencesOfString:@"_thumb" withString:@""];
}

- (NSString *)encodeToPercentEscapeString:(NSString *)input {
    
    // Encode all the reserved characters, per RFC 3986
    NSString *outputStr = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,(CFStringRef)input,NULL,(CFStringRef)@"!*'();:@&=+$,/?%#[]",kCFStringEncodingUTF8));
    return outputStr;
}


//处理字符串空格
- (NSString *)isEmptyString {
    
    NSRange _range = [self rangeOfString:@" "];
    
    if (_range.location != NSNotFound) {
        return [self stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    } else {
        return self;
    }
}



/**
 *  时间戳转成字符串
 *
 *
 *  @return 格式化后的字符串
 */
- (NSString *)timeBeforeInfo
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY-MM-dd hh:mm:ss"]; //(@"YYYY-MM-dd hh:mm:ss") ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    [formatter setTimeZone:timeZone];
    NSDate *date = [formatter dateFromString:self]; //------------将字符串按formatter转成nsdate
    //时间转时间戳的方法:
    NSTimeInterval timeIntrval = [[NSNumber numberWithDouble:[date timeIntervalSince1970]] integerValue];
    
    //获取此时时间戳长度
    NSTimeInterval nowTimeinterval = [[NSDate date] timeIntervalSince1970];
    int timeInt = nowTimeinterval - timeIntrval; //时间差
    
    int year = timeInt / (3600 * 24 * 30 *12);
    int month = timeInt / (3600 * 24 * 30);
    int day = timeInt / (3600 * 24);
    int hour = timeInt / 3600;
    int minute = timeInt / 60;
//    int second = timeInt;
//    NSArray *time = [[[self stringByReplacingOccurrencesOfString:@"-" withString:@" "] stringByReplacingOccurrencesOfString:@":" withString:@" "] componentsSeparatedByString:@" "];
    if (year > 0) {
        return [NSString stringWithFormat:@"%d年以前",year];
    }else if(month > 0){
        return [NSString stringWithFormat:@"%d个月以前",month];
    }else if(day > 0){
        return [NSString stringWithFormat:@"%d天以前",day];
    }else if(hour > 0){
        return [NSString stringWithFormat:@"%d小时以前",hour];
    }else if(minute > 0){
        return [NSString stringWithFormat:@"%d分钟以前",minute];
    }else{
        return [NSString stringWithFormat:@"刚刚   "];
    }
}

- (NSArray *)setupReplacing
{
    NSString *url = [[[self stringByReplacingOccurrencesOfString:@"[" withString:@""] stringByReplacingOccurrencesOfString:@"]" withString:@""] stringByReplacingOccurrencesOfString:@",http" withString:@" http"];
    return url.length ? [url componentsSeparatedByString:@" "] : @[];
}


+ (NSString *)getConstellationWithMonth:(int)month day:(int)day
{
    NSString *astroString = @"摩羯座水瓶座双鱼座白羊座金牛座双子座巨蟹座狮子座处女座天秤座天蝎座射手座摩羯座";
    NSString *astroFormat = @"102123444543";
    NSString *result;

    result = [NSString stringWithFormat:@"%@",[astroString substringWithRange:NSMakeRange(month*3-(day < [[astroFormat substringWithRange:NSMakeRange((month-1), 1)] intValue] - (-19))*3, 3)]];

    return result;
}

@end
