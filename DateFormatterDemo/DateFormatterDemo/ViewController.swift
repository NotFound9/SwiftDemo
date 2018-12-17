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
        
        testPartInOldWay(1)
        testPartInNewWay(1)
        
        testPartInOldWay(10)
        testPartInNewWay(10)
        
        testPartInOldWay(100)
        testPartInNewWay(100)
        
        testPartInOldWay(1000)
        testPartInNewWay(1000)
        
        testPartInOldWay(10000)
        testPartInNewWay(10000)
        
        testPartInOldWay(100000)
        testPartInNewWay(100000)
        
        testPartInOldWay(1000000)
        testPartInNewWay(1000000)
    }
    
    //不进行缓存
    func testInOldWay(_ times: Int) {
        var string = ""
        let date = Date.init()
        let startTime = CFAbsoluteTimeGetCurrent();
        for _ in 0..<times {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy年MM月dd日"
            string = formatter.string(from: date)
        }
        let duration = (CFAbsoluteTimeGetCurrent() - startTime) * 1000.0;
        print("使用oldWay计算\n\(times)次，总耗时\n\(duration) ms\n")
    }
    //进行缓存
    func testInNewWay(_ times: Int) {
        var string = ""
        let date = Date.init()
        let startTime = CFAbsoluteTimeGetCurrent();
        for _ in 0..<times {
            string = DateFormatterCache.shared.dateFormatterOne.string(from: date)
        }
        let duration = (CFAbsoluteTimeGetCurrent() - startTime) * 1000.0;
        print("使用newWay计算\n\(times)次，总耗时\n\(duration) ms\n")
    }
    
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
    
    func testInSetFormat(_ times: Int) {
        let startTime = CFAbsoluteTimeGetCurrent();
        let dateFormatter = DateFormatter()
        for i in 0..<times {
            dateFormatter.dateFormat = i/2 == 1 ? "yyyy年MM月dd日" : "MM月dd日"
        }
        let duration = (CFAbsoluteTimeGetCurrent() - startTime) * 1000.0;
        print("使用testInSetFormat计算\n\(times)次，总耗时\n\(duration) ms\n")
    }
    
    
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
            formatter.dateFormat = "yyyy年MM月dd日"
            startTime3 = CFAbsoluteTimeGetCurrent();
            string = formatter.string(from: date)
            startTime4 = CFAbsoluteTimeGetCurrent();
            
            duration1 += (startTime2 - startTime1) * 1000.0;
            duration2 += (startTime3 - startTime2) * 1000.0;
            duration3 += (startTime4 - startTime3) * 1000.0;
        }
        print("创建DateFormatter对象耗时=\(duration1)ms\n设置日期格式耗时=\(duration2)ms\n生成字符串耗时=\(duration3)ms\n\n")
    }
    
}

