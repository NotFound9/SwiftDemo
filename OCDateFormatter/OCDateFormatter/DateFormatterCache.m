//
//  DateFormatterCache.m
//  OCDateFormatter
//
//  Created by ruiwendaier on 2018/12/20.
//  Copyright © 2018年 瑞文戴尔. All rights reserved.
//

#import "DateFormatterCache.h"

@implementation DateFormatterCache

static DateFormatterCache *_shareInstance;

+ (DateFormatterCache *)shareInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shareInstance = [[DateFormatterCache alloc] init];
    });
    return _shareInstance;
}

-(NSDateFormatter *)formatterOne {
    if (!_formatterOne) {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy年MM月dd日HH时mm分ss秒"];
        _formatterOne = dateFormatter;
    }
    return _formatterOne;
}

@end
