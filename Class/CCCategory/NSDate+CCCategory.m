//
//  NSDate+CCCategory.m
//  CCCategoryDemo
//
//  Created by 李飞恒 on 16/4/9.
//  Copyright © 2016年 李飞恒. All rights reserved.
//

#import "NSDate+CCCategory.h"

@implementation NSDate (CCCategory)

- (BOOL)yesterday {
    NSDate *nowDate = [[NSDate date] dateWithYMD];
    // 2014-04-30
    NSDate *selfDate = [self dateWithYMD];
    
    // 获得nowDate和selfDate的差距
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *cmps = [calendar components:NSCalendarUnitDay fromDate:selfDate toDate:nowDate options:0];
    return cmps.day == 1;
}
- (BOOL)today {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unInt = NSCalendarUnitDay | NSCalendarUnitMonth |  NSCalendarUnitYear;
    //获取今天的年月日
    NSDateComponents *nowCmps = [calendar components:unInt fromDate:[NSDate date]];
    //获取self的年月日
    NSDateComponents *selfCmps = [calendar components:unInt fromDate:self];
    return (selfCmps.year == nowCmps.year) &&
    (selfCmps.month == nowCmps.month) &&
    (selfCmps.day == nowCmps.day);
}
- (BOOL)thisYear {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit = NSCalendarUnitYear;
    
    // 1.获得当前时间的年月日
    NSDateComponents *nowCmps = [calendar components:unit fromDate:[NSDate date]];
    
    // 2.获得self的年月日
    NSDateComponents *selfCmps = [calendar components:unit fromDate:self];
    
    return nowCmps.year == selfCmps.year;

}
- (instancetype)dateWithYMD {
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd";
    NSString *selfStr = [fmt stringFromDate:self];
    return [fmt dateFromString:selfStr];

}
+ (NSString *)yearMontDayType:(NSDateTimerFormat)format {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    switch (format) {
        case NSDateTimerFormatA: {
            [dateFormatter setDateFormat:@"yyyy/MM/dd"];
            break;
        }
        case NSDateTimerFormatB: {
            [dateFormatter setDateFormat:@"yyyy,MM,dd"];
            break;
        }
        case NSDateTimerFormatC: {
            [dateFormatter setDateFormat:@"yyyy-MM-dd"];
            break;
        }
    }
    return [dateFormatter stringFromDate:[NSDate date]];
}

- (NSDateComponents *)daltaWithHow {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit = NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    return [calendar components:unit fromDate:self toDate:[NSDate date] options:0];
}

+ (NSString *)formatTimeWithNumber:(NSNumber *)number {
    double doubleTempTime = [number doubleValue]/1000;
    NSTimeInterval timestamp = (NSTimeInterval)doubleTempTime;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timestamp];
    
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"EEE MMM dd HH:mm:ss Z yyyy";
    
    // 判断是否为今年
    if (date.thisYear) {
        NSDateComponents *cmps = [date deltaWithNow];
        if (date.today) { // 今天
            
            if (cmps.hour >= 1) { // 至少是1小时前发的
                NSLog(@"%@",cmps);
                return [NSString stringWithFormat:@"%ld小时前", (long)cmps.hour];
            } else if (cmps.minute >= 1) { // 1~59分钟之前发的
                return [NSString stringWithFormat:@"%ld分钟前", (long)cmps.minute];
            } else { // 1分钟内发的
                return @"刚刚";
            }
        } else if (date.yesterday) { // 昨天
            fmt.dateFormat = @"昨天 HH:mm";
            return [fmt stringFromDate:date];
        } else if (cmps.day < 30) { // 至少是前天
            return [NSString stringWithFormat:@"%ld天前", (long)cmps.day];
        } else { // 至少是一个月前
            fmt.dateFormat = @"MM-dd HH:mm";
            return [fmt stringFromDate:date];
        }
    } else { // 非今年
        fmt.dateFormat = @"yyyy-MM-dd";
        return [fmt stringFromDate:date];
    }

}

- (NSDateComponents *)deltaWithNow {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    return [calendar components:unit fromDate:self toDate:[NSDate date] options:0];
}

@end
