//
//  NSDate+CCCategory.h
//  CCCategoryDemo
//
//  Created by 李飞恒 on 16/4/9.
//  Copyright © 2016年 李飞恒. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSInteger, NSDateTimerFormat) {
    NSDateTimerFormatA, /** 2016/04/09 */
    NSDateTimerFormatB, /** 2016,04,09 */
    NSDateTimerFormatC /** 2016-04-09 */
};
@interface NSDate (CCCategory)

- (BOOL)yesterday;
- (BOOL)today;
- (BOOL)thisYear;
- (instancetype)dateWithYMD; /** yyyy-MM-dd */ 
+ (NSString *)yearMontDayType:(NSDateTimerFormat)format;

- (NSDateComponents *)daltaWithHow;

+ (NSString *)formatTimeWithNumber:(NSNumber *)number;

@end
