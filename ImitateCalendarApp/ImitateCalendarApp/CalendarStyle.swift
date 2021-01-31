//
//  CalendarStyle.swift
//  ImitateCalendarApp
//
//  Created by daishenao on 2021/1/27.
//

import Foundation
import UIKit

struct DaySymbolsStyle {
    var weekendColor = SystemColors.secondaryLabel
    var weekDayColor = SystemColors.label
    var font = UIFont.systemFont(ofSize: 10)
    init() {}
}

struct DayHeaderStyle {
    var backgroundCloor = SystemColors.secondarySystemBackground
    
}

struct DaySelectorStyle {
    var activeTextColor = SystemColors.systemBackground
    var selectedBackgroundColor = SystemColors.label
    
    var weekendTextColor = SystemColors.secondaryLabel
    var inactiveTextColor = SystemColors.label
    var inactiveBackgroundColor = UIColor.clear
    
    // 今天未被选中
    var todayInactiveTextColor = SystemColors.systemRed
    // 今天被选中
    var todayActiveTextColor = UIColor.white
    // 今天被选中的背景
    var todayActiveBackgroundColor = SystemColors.systemRed
    
    var font = UIFont.systemFont(ofSize: 18)
    var todayFont = UIFont.systemFont(ofSize: 18)
}
