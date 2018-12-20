//
//  ViewController.swift
//  DateFormatterDemo
//
//  Created by ruiwendaier on 2018/12/17.
//  Copyright © 2018年 瑞文戴尔. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
//        testInOldWay(1)
//        testInNewWay(1)
//
//        testInOldWay(10)
//        testInNewWay(10)
//
//        testInOldWay(100)
//        testInNewWay(100)
//
//        testInOldWay(1000)
//        testInNewWay(1000)
//
//        testInOldWay(10000)
//        testInNewWay(10000)
//
//        testInOldWay(100000)
//        testInNewWay(100000)
//
//        testInOldWay(1000000)
//        testInNewWay(1000000)
        
//        testInCreateDateFormatter(1)
//        testInSetFormat(1)
//
//        testInCreateDateFormatter(10)
//        testInSetFormat(10)
//
//        testInCreateDateFormatter(100)
//        testInSetFormat(100)
//
//        testInCreateDateFormatter(1000)
//        testInSetFormat(1000)
//
//        testInCreateDateFormatter(10000)
//        testInSetFormat(10000)
//
//        testInCreateDateFormatter(100000)
//        testInSetFormat(100000)
//
//        testInCreateDateFormatter(1000000)
//        testInSetFormat(1000000)
        
        testInOldWay(1)
        testInNewWay(1)
        testFormatterInC(1)

        testInOldWay(10)
        testInNewWay(10)
        testFormatterInC(10)
        
        testInOldWay(100)
        testInNewWay(100)
        testFormatterInC(100)
        
        testInOldWay(1000)
        testInNewWay(1000)
        testFormatterInC(1000)
        
        testInOldWay(10000)
        testInNewWay(10000)
        testFormatterInC(10000)

        testInOldWay(100000)
        testInNewWay(100000)
        testFormatterInC(100000)
        
        testInOldWay(1000000)
        testInNewWay(1000000)
        testFormatterInC(1000000)
        
    }
    
    //不进行缓存
    func testInOldWay(_ times: Int) {
        var string = ""
        var date = Date.init()
        let startTime = CFAbsoluteTimeGetCurrent();
        for i in 0..<times {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy年MM月dd日HH时mm分ss秒"
            date = Date.init(timeIntervalSince1970: TimeInterval(1545308405 + i))
            string = formatter.string(from: date)
        }
        let duration = (CFAbsoluteTimeGetCurrent() - startTime) * 1000.0;
        print("使用oldWay计算\n\(times)次，总耗时\n\(duration) ms\n")
    }
    //进行缓存
    func testInNewWay(_ times: Int) {
        var string = ""
        var date = Date.init()
        let startTime = CFAbsoluteTimeGetCurrent();
        for i in 0..<times {
            date = Date.init(timeIntervalSince1970: TimeInterval(1545308405 + i))
            string = DateFormatterCache.shared.dateFormatterOne.string(from: date)
        }
        let duration = (CFAbsoluteTimeGetCurrent() - startTime) * 1000.0;
        print("使用缓存Formatter的方案计算\n\(times)次，总耗时\n\(duration) ms\n")
    }
    
    //测试创建DateFormatter
    func testInCreateDateFormatter(_ times: Int) {
        let startTime = CFAbsoluteTimeGetCurrent();
        var dateFormatter = DateFormatter()
        for i in 0..<times {
            dateFormatter = DateFormatter()
            dateFormatter.dateFormat = i/2 == 1 ? "yyyy年MM月dd日" : "MM月dd日"
        }
        let duration = (CFAbsoluteTimeGetCurrent() - startTime) * 1000.0;
        print("使用testInCreateDateFormatter计算\n\(times)次，总耗时\n\(duration) ms\n")
    }
    
    //测试设置Formatter
    func testInSetFormat(_ times: Int) {
        let startTime = CFAbsoluteTimeGetCurrent();
        let dateFormatter = DateFormatter()
        for i in 0..<times {
            dateFormatter.dateFormat = i/2 == 1 ? "yyyy年MM月dd日" : "MM月dd日"
        }
        let duration = (CFAbsoluteTimeGetCurrent() - startTime) * 1000.0;
        print("使用testInSetFormat计算\n\(times)次，总耗时\n\(duration) ms\n")
    }
    
    //测试Formatter的创建，设置格式，生成字符串三个步骤
    func testPartInOldWay(_ times: Int) {
        print("执行\(times)次")
        var string = ""
        let date = Date.init()
        var startTime1: CFAbsoluteTime = 0;
        var startTime2: CFAbsoluteTime = 0;
        var startTime3: CFAbsoluteTime = 0;
        var startTime4: CFAbsoluteTime = 0;

        var duration1: CFAbsoluteTime = 0;
        var duration2: CFAbsoluteTime = 0;
        var duration3: CFAbsoluteTime = 0;

        for i in 0..<times {
            startTime1 = CFAbsoluteTimeGetCurrent();
            let formatter = DateFormatter()
            startTime2 = CFAbsoluteTimeGetCurrent();
            formatter.dateFormat = "yyyy年MM月dd日HH时mm分ss秒"
            startTime3 = CFAbsoluteTimeGetCurrent();
            string = formatter.string(from: date)
            startTime4 = CFAbsoluteTimeGetCurrent();
            
            duration1 += (startTime2 - startTime1) * 1000.0;
            duration2 += (startTime3 - startTime2) * 1000.0;
            duration3 += (startTime4 - startTime3) * 1000.0;
        }
        print("创建DateFormatter对象耗时=\(duration1)ms\n设置日期格式耗时=\(duration2)ms\n生成字符串耗时=\(duration3)ms\n\n")
    }
    
    //使用C语言来做日期处理
    func testFormatterInC(_ times: Int) {
        var date = Date.init()
        var dateString = ""
        var buffer = [Int8](repeating: 0, count: 100)
        var time = time_t(date.timeIntervalSince1970)
        let format = "%Y年%m月%d日%H时%M分%S秒"
        let startTime = CFAbsoluteTimeGetCurrent();
        for i in 0..<times {
            date = Date.init(timeIntervalSince1970: TimeInterval(1545308405 + i))
            time = time_t(date.timeIntervalSince1970)
            strftime(&buffer, buffer.count, format, localtime(&time))
            dateString = String.init(cString: buffer, encoding: String.Encoding.utf8) ?? ""
        }
        let duration = (CFAbsoluteTimeGetCurrent() - startTime) * 1000.0;
        print("使用C语言的方案计算\n\(times)次，总耗时\n\(duration) ms\n")
        print(dateString)
    }
}

