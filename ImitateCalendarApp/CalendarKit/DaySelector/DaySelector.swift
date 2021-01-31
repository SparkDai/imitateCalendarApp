//
//  DaySelector.swift
//  ImitateCalendarApp
//
//  Created by daishenao on 2021/1/28.
//

import UIKit

protocol DaySelctorItemProtocol: AnyObject {
    var selector: Bool {set get}
    var date: Date {set get}
    var calendar: Calendar {set get}
    func updateStyle(_ newStyle: DaySelectorStyle)
}

class DaySelector: UIView {

    private var items = [UIView & DaySelctorItemProtocol]()
    
    var calendar = Calendar.autoupdatingCurrent {
        didSet {
            updateItemsCalendar()
        }
    }
    
    var startDate : Date! {
        didSet {
            configure()
        }
    }
    
    private func updateItemsCalendar() {
        items.forEach { (item) in
            item.calendar = calendar
        }
    }
    
    var selectedDate: Date? {
        get {
            // filter叫做过滤器
            return items.filter{$0.selector == true}.first?.date as Date?
        }
        set {
            
        }
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let itemCount = CGFloat(items.count)
        let size = items.first?.intrinsicContentSize ?? .zero
        
        var per = bounds.size.width - size.width * itemCount
        let minX = per / 2
        
        for (i, item) in items.enumerated() {
            
            var x = minX + (size.width + per) * CGFloat(i)
            
            let rightToLeft = UIView.userInterfaceLayoutDirection(for: semanticContentAttribute) == .rightToLeft
            if rightToLeft {
                x = bounds.width - x - size.width
            }
            
            let origin = CGPoint(x: x, y: 0)
            let frame = CGRect(origin: origin, size: size)
            
            item.frame = frame
        }
    }
    
    private func configure() {
        for (i, label) in items.enumerated() {
            label.date = calendar.date(byAdding: .day, value: i, to: startDate)!
        }
    }

}
