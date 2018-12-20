//
//  ViewController.m
//  OCDateFormatter
//
//  Created by ruiwendaier on 2018/12/20.
//  Copyright © 2018年 瑞文戴尔. All rights reserved.
//

#import "ViewController.h"
#import <xlocale.h>
#import "DateFormatterCache.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self testDateFormatterInC:1];
    [self testDateFormatterInOCWithoutCache:1];
    [self testDateFormatterInOCWithCache:1];

    [self testDateFormatterInC:10];
    [self testDateFormatterInOCWithoutCache:10];
    [self testDateFormatterInOCWithCache:10];

    [self testDateFormatterInC:100];
    [self testDateFormatterInOCWithoutCache:100];
    [self testDateFormatterInOCWithCache:100];

    
    [self testDateFormatterInC:1000];
    [self testDateFormatterInOCWithoutCache:1000];
    [self testDateFormatterInOCWithCache:1000];

    
    [self testDateFormatterInC:10000];
    [self testDateFormatterInOCWithoutCache:10000];
    [self testDateFormatterInOCWithCache:10000];
    
    [self testDateFormatterInC:100000];
    [self testDateFormatterInOCWithoutCache:100000];
    [self testDateFormatterInOCWithCache:100000];
    
    [self testDateFormatterInC:1000000];
    [self testDateFormatterInOCWithoutCache:1000000];
    [self testDateFormatterInOCWithCache:1000000];

    

}

//不缓存DateFormatter对象
-(void)testDateFormatterInOCWithoutCache:(NSInteger)times {
    NSString *string = @"";
    NSDate *date;
    CFAbsoluteTime startTime = CFAbsoluteTimeGetCurrent();
    for (int i=0; i<times; i++) {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy年MM月dd日HH时mm分ss秒"];
        date = [NSDate dateWithTimeIntervalSince1970:(1545308405 + i)];
        string = [dateFormatter stringFromDate:date];
    }
    CFAbsoluteTime duration = (CFAbsoluteTimeGetCurrent() - startTime) * 1000.0;
    NSLog(@"\n不缓存DateFormatter对象的方案:\n计算%ld次\n耗时%f ms\n", (long)times, duration);
}

//缓存DateFormatter对象
-(void)testDateFormatterInOCWithCache:(NSInteger)times {
    NSString *string = @"";
    NSDate *date;
    CFAbsoluteTime startTime = CFAbsoluteTimeGetCurrent();
    for (int i=0; i<times; i++) {
        date = [NSDate dateWithTimeIntervalSince1970:(1545308405 + i)];
        string = [[DateFormatterCache shareInstance].formatterOne stringFromDate:date];
    }
    CFAbsoluteTime duration = (CFAbsoluteTimeGetCurrent() - startTime) * 1000.0;
    NSLog(@"\n缓存DateFormatter对象的方案:\n计算%ld次\n耗时%f ms\n", (long)times, duration);
}

//使用C语言来做日期处理
-(void)testDateFormatterInC:(NSInteger)times {
    NSString *string = @"";
    NSDate *date;
    time_t timeInterval;
    char buffer[80];
    CFAbsoluteTime startTime = CFAbsoluteTimeGetCurrent();
    for (int i=0; i<times; i++) {
        date = [NSDate dateWithTimeIntervalSince1970:(1545308405 + i)];
        timeInterval = [date timeIntervalSince1970];
        strftime(buffer, sizeof(buffer), "%Y年%m月%d日%H时%M分%S秒", localtime(&timeInterval));
        string = [NSString stringWithCString:buffer encoding:NSUTF8StringEncoding];
    }
    CFAbsoluteTime duration = (CFAbsoluteTimeGetCurrent() - startTime) * 1000.0;
    NSLog(@"==%@", string);
    NSLog(@"\n使用C语言的方案:\n计算%ld次\n耗时%f ms\n", (long)times, duration);
}


@end
