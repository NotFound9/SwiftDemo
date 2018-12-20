//
//  DateFormatterCache.h
//  OCDateFormatter
//
//  Created by ruiwendaier on 2018/12/20.
//  Copyright © 2018年 瑞文戴尔. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DateFormatterCache : NSObject

+ (DateFormatterCache *)shareInstance;

@property (nonatomic, strong) NSDateFormatter *formatterOne;

@end

