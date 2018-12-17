//
//  DateFormatterCache.swift
//  DateFormatterDemo
//
//  Created by ruiwendaier on 2018/12/17.
//  Copyright © 2018年 瑞文戴尔. All rights reserved.
//

import Foundation

class DateFormatterCache {
    //使用方法
    //let timeStr = DateFormatterCache.shared.dateFormatterOne.string(from: publishTime)
    static let shared = DateFormatterCache.init()

    lazy var dateFormatterOne: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy年MM月dd日"
        return formatter
    }()
    lazy var dateFormatterTwo: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        formatter.dateFormat = "EEE, dd MMM yyyy HH:mm:ss z"
        formatter.locale = Locale.init(identifier: "en_US")
        return formatter
    }()
}


