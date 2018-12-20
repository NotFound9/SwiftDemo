//
//  DateFormatterCache.swift
//  DateFormatterDemo
//
//  Created by ruiwendaier on 2018/12/17.
//  Copyright © 2018年 瑞文戴尔. All rights reserved.
//

import Foundation
import Darwin

class DateFormatterCache {
    //使用方法
    //let timeStr = DateFormatterCache.shared.dateFormatterOne.string(from: publishTime)
    static let shared = DateFormatterCache.init()

    lazy var dateFormatterOne: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy年MM月dd日HH时mm分ss秒"
        return formatter
    }()
    lazy var dateFormatterTwo: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        formatter.dateFormat = "EEE, dd MMM yyyy HH:mm:ss z"
        formatter.locale = Locale.init(identifier: "en_US")
        return formatter
    }()
    
    let format = "%Y年%m月%d日%H时%Ms分%SZ秒"
//    let format = "%Y%m%dT%H%M%SZ"
}

extension String {
    func formatDate(date: Date) -> String {
        var buffer = [Int8](repeating: 0, count: 100)
        var time = time_t(date.timeIntervalSince1970)
        strftime_l(&buffer, buffer.count, self, localtime(&time), nil)
        //        return String.fromCString(buffer)!
        return String.init(cString: buffer, encoding: String.Encoding.utf8) ?? ""
    }
}


