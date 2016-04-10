//
//  NSString+CCCategory.m
//  CCCategoryDemo
//
//  Created by 李飞恒 on 16/4/9.
//  Copyright © 2016年 李飞恒. All rights reserved.
//

#import "NSString+CCCategory.h"
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCryptor.h>


@implementation NSString (CCCategory)

- (NSString *)stringWithJSON {
    int indentLevel = 0;
    BOOL inString    = NO;
    char currentChar = '\0';
    char *tab = "    ";
    
    NSUInteger len = [self lengthOfBytesUsingEncoding:NSUTF8StringEncoding];
    const char *utf8 = [self UTF8String];
    NSMutableData *buf = [NSMutableData dataWithCapacity:(NSUInteger)(len * 1.1f)];
    
    for (int i = 0; i < len; i++) {
        currentChar = utf8[i];
        switch (currentChar) {
            case '{':
            case '[':
                if (!inString) {
                    [buf appendBytes:&currentChar length:1];
                    [buf appendBytes:"\n" length:1];
                    
                    for (int j = 0; j < indentLevel+1; j++) {
                        [buf appendBytes:tab length:strlen(tab)];
                    }
                    
                    indentLevel += 1;
                } else {
                    [buf appendBytes:&currentChar length:1];
                }
                break;
            case '}':
            case ']':
                if (!inString) {
                    indentLevel -= 1;
                    [buf appendBytes:"\n" length:1];
                    for (int j = 0; j < indentLevel; j++) {
                        [buf appendBytes:tab length:strlen(tab)];
                    }
                    [buf appendBytes:&currentChar length:1];
                } else {
                    [buf appendBytes:&currentChar length:1];
                }
                break;
            case ',':
                if (!inString) {
                    [buf appendBytes:",\n" length:2];
                    for (int j = 0; j < indentLevel; j++) {
                        [buf appendBytes:tab length:strlen(tab)];
                    }
                } else {
                    [buf appendBytes:&currentChar length:1];
                }
                break;
            case ':':
                if (!inString) {
                    [buf appendBytes:":" length:1];
                } else {
                    [buf appendBytes:&currentChar length:1];
                }
                break;
            case ' ':
            case '\n':
            case '\t':
            case '\r':
                if (inString) {
                    [buf appendBytes:&currentChar length:1];
                }
                break;
            case '"':
                
                if (i > 0 && utf8[i-1] != '\\')
                {
                    inString = !inString;
                }
                
                [buf appendBytes:&currentChar length:1];
                break;
            default:
                [buf appendBytes:&currentChar length:1];
                break;
        }
    }
    
    return [[NSString alloc] initWithData:buf encoding:NSUTF8StringEncoding];

}

- (NSString *)MD5Hex {
    if (self == nil || self.length == 0 || [self isEqual:NULL]) {
        return nil;
    }
    const char *str = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(str, (CC_LONG)strlen(str), result);
    
    NSMutableString *ret = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH*2];
    for(int i = 0; i<CC_MD5_DIGEST_LENGTH; i++) {
        [ret appendFormat:@"%02x",result[i]];
    }
    return ret;
}

//+ (NSString*)sha256:(NSString *)stringpass {
//    
//    const char *cstr = [stringpass UTF8String];
//    NSData *data = [NSData dataWithBytes:cstr length:stringpass.length];
//    
//    uint8_t digest[CC_SHA256_DIGEST_LENGTH];
//    
//    CC_SHA256(data.bytes,(uint32_t)data.length, digest);
//    
//    NSData *da=[[NSData alloc]initWithBytes:digest length:CC_SHA256_DIGEST_LENGTH];
//    //https://github.com/MxABC/GTMBase64.git
//    NSData *str=[GTMBase64 encodeData:da];
//    NSString *output=[[NSString alloc]initWithData:str  encoding:NSUTF8StringEncoding];
//    return output;
//}

- (NSData *)hexStringToData {
    if (!self.length) {
        return nil;
    }
    
    const char *ch = [[self lowercaseString] cStringUsingEncoding:NSUTF8StringEncoding];
    NSMutableData* data = [[NSMutableData alloc] initWithCapacity:strlen(ch)/2];
    while (*ch) {
        char byte = 0;
        if ('0' <= *ch && *ch <= '9') {
            byte = *ch - '0';
        } else if ('a' <= *ch && *ch <= 'f') {
            byte = *ch - 'a' + 10;
        }
        ch++;
        byte = byte << 4;
        if (*ch) {
            if ('0' <= *ch && *ch <= '9') {
                byte += *ch - '0';
            } else if ('a' <= *ch && *ch <= 'f') {
                byte += *ch - 'a' + 10;
            }
            ch++;
        }
        
        [data appendBytes:&byte length:1];
    }
    
    return data;
}

- (NSString *)deleteRangeLastOne {
    if (self.length > 0) {
        NSMutableString *mString = [NSMutableString stringWithString:self];
        NSRange rang = NSMakeRange([mString length]-1, 1);
        [mString deleteCharactersInRange:rang];
        return [NSString stringWithString:mString];
    } else {
        return nil;
    }
    
}

- (NSString *)deleteLastCharacterFirst {
    if (self.length > 0) {
        
        NSMutableString *actionStr = [NSMutableString stringWithString:self];
        NSRange rang = NSMakeRange(0, 1);
        [actionStr deleteCharactersInRange:rang];
        
        NSRange rangB = NSMakeRange([actionStr length]-1, 1);
        [actionStr deleteCharactersInRange:rangB];
        return actionStr;
    } else {
        return nil;
    }
}

- (CGSize)sizeWithFont:(UIFont *)font {
    CGSize size = [self sizeWithAttributes:@{NSFontAttributeName:font}];
    return size;
}

- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize {
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : font} context:nil].size;
}

- (CGSize)sizeWithFont:(UIFont *)font fixWith:(CGFloat)with {
    return [self sizeWithFont:font fixSize:CGSizeMake(with, MAXFLOAT)];
}

- (CGSize)sizeWithFont:(UIFont *)font fixHigh:(CGFloat)high {
    return [self sizeWithFont:font fixSize:CGSizeMake(MAXFLOAT, high)];
}

- (CGSize)sizeWithFont:(UIFont *)font fixSize:(CGSize)size {
    return [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil].size;
}

@end
