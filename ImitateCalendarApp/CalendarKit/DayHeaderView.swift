//
//  DayHeaderView.swift
//  ImitateCalendarApp
//
//  Created by daishenao on 2021/1/26.
//

import UIKit

class DayHeaderView: UIView {

    let daySymbolsView : DaySymbolsView
    let calendar: Calendar
    var style = DayHeaderStyle()
    let currentSizeClass = UIUserInterfaceSizeClass.compact
    
    private var daySymbolsViewHeight: CGFloat = 20
    
    init(calendar: Calendar = Calendar.autoupdatingCurrent) {
        self.calendar = calendar
        self.daySymbolsView = DaySymbolsView()
        super.init(frame: .zero)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        [daySymbolsView].forEach(addSubview)
        backgroundColor = style.backgroundCloor
        configurePagingViewController()
    }
    
    private func configurePagingViewController() {
        let selectedDate = Date()
        let vc = makeSelectorController(startDate: beginningOfWeek(selectedDate))
        
    }
    
    private func makeSelectorController(startDate: Date) -> DaySelectorController {
        let new = DaySelectorController()
        new.calendar = calendar
        new.startDate = startDate
        return new
    }
    
    // 返回一个具体日期，例如：2021-01-30 16:00:00 +0000
    private func beginningOfWeek(_ date: Date) -> Date {
        // 今天在这一年的第几周，例如返回6
        let weekOfYear = component(component: .weekOfYear, from: date)
        // 今天在哪一年，例如返回2021
        let yearForWeekOfYear = component(component: .yearForWeekOfYear, from: date)
        return calendar.date(from: DateComponents(calendar: calendar,
                                                  weekday: calendar.firstWeekday,
                                                  weekOfYear: weekOfYear,
                                                  yearForWeekOfYear: yearForWeekOfYear))!
    }
    
    private func component(component: Calendar.Component, from date: Date) -> Int {
        return calendar.component(component, from: date)
    }
    
    override func layoutSubviews() {
        daySymbolsView.frame = CGRect(origin: .zero, size: CGSize(width: bounds.width, height: daySymbolsViewHeight))
    }
    
}
