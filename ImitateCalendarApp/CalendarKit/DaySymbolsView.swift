//
//  DaySymbolsView.swift
//  ImitateCalendarApp
//
//  Created by daishenao on 2021/1/26.
//

import UIKit

class DaySymbolsView: UIView {
    private(set) var daysInWeek = 7
    private var calendar = Calendar.autoupdatingCurrent
    private var labels = [UILabel]()
    private var style: DaySymbolsStyle = DaySymbolsStyle()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeViews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
    private func initializeViews() {
        for _ in 1...daysInWeek {
            let label = UILabel()
            label.textAlignment = .center
            labels.append(label)
            addSubview(label)
        }
        configure()
    }
    
    func configure() {
        // 星期的缩写
        let daySymbols = calendar.veryShortWeekdaySymbols
        let weekendMask = [true] + [Bool].init(repeating: false, count: 5) + [true]
        var weekDays = Array(zip(daySymbols, weekendMask))
        
        // weekday 默认：1：星期日  2：星期一  3：星期二  4：星期三  5：星期四  6：星期五  7：星期六
        // firstWeekday 默认是1，即代表这周第一天是星期天。如果设置firstWeekday = 2，即代表这周第一天是星期一
        weekDays.shift(calendar.firstWeekday - 1)
        
        let rightToLeft = UIView.userInterfaceLayoutDirection(for: semanticContentAttribute) == .rightToLeft
        if rightToLeft { weekDays.reverse() } // reverse()翻转数组，倒着排序

        for (index, label) in labels.enumerated() {
          label.text = weekDays[index].0
          label.textColor = weekDays[index].1 ? style.weekendColor : style.weekDayColor
          label.font = style.font
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let labelsCount = CGFloat(labels.count)
        var per = bounds.width - bounds.height * labelsCount
        per /= labelsCount
        
        let minX = per / 2
        for (i, label) in labels.enumerated() {
          let frame = CGRect(x: minX + (bounds.height + per) * CGFloat(i), y: 0,
                             width: bounds.height, height: bounds.height)
          label.frame = frame
        }
    }
    
}
