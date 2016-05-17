//
//  NSDate+BTAddition.m
//  LCETimeTranform
//
//  Created by 刘随义 on 16/5/16.
//  Copyright © 2016年 刘随义. All rights reserved.
//

#import "NSDate+BTAddition.h"

@implementation NSDate (BTAddition)

- (NSString *)transformToFuzzyDate {
    NSDate *nowDate = [NSDate date];
    NSUInteger timeInterval = [nowDate timeIntervalSinceDate:self];
    NSCalendar *greCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    //通过已定义的日历对象,获取某个时间点的NSDateComponents表示,并设置需要表示那些信息
    NSDateComponents *nowDateComponents = [greCalendar components:NSCalendarUnitEra | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitMinute | NSCalendarUnitSecond | NSCalendarUnitWeekday | NSCalendarUnitWeekOfYear | NSCalendarUnitWeekOfMonth fromDate:nowDate];
    
    NSDateComponents *selfDateComponents = [greCalendar components:NSCalendarUnitEra | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitMinute | NSCalendarUnitSecond | NSCalendarUnitWeekday | NSCalendarUnitWeekOfYear | NSCalendarUnitWeekOfMonth fromDate:self];
    
    if (timeInterval < 5 *60) {
        return @"刚刚";
    }else if (timeInterval < 60 * 60) {
        NSString *dateString = [NSString stringWithFormat:@"%lu分钟前", timeInterval / 60];
        return dateString;
    }else if (timeInterval < 24 * 60 *60 && nowDateComponents.day == selfDateComponents.day) {
        NSString *dateString = [NSString stringWithFormat:@"%lu小时前", timeInterval / (60 * 60)];
        return dateString;
    }else if (nowDateComponents.day != selfDateComponents.day && timeInterval < 24 *60 *60) {
        return @"昨天";
    }else if (nowDateComponents.day == (selfDateComponents.day + 1)) {
        return @"昨天";
    }else if (nowDateComponents.weekOfMonth == selfDateComponents.weekOfMonth) {
        NSArray *weekdays = @[@"temp", @"星期日", @"星期一", @"星期二", @"星期三", @"星期四", @"星期五", @"星期六"];
        NSString *dateString = weekdays[selfDateComponents.weekday];
        return dateString;
    }
    else if ([self timeIntervalSince1970] == 0) {
        return @"";
    }else {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"MM-dd HH:mm"];
        NSString *dateString = [dateFormatter stringFromDate:self];
        return dateString;
    }
     
    NSString *str = nil;
    return str;
}

+ (NSDate *)getDate:(NSString *)dateString {
    NSDateFormatter *forma = [[NSDateFormatter alloc] init];
    [forma setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date = [forma dateFromString:dateString];
    return date;
}


@end
