//
//  NSDate+BTAddition.h
//  LCETimeTranform
//
//  Created by 刘随义 on 16/5/16.
//  Copyright © 2016年 刘随义. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (BTAddition)
//转换成描述性字符串
- (NSString *)transformToFuzzyDate;

//字符串时间
+ (NSDate *)getDate:(NSString *)dateString;

@end
