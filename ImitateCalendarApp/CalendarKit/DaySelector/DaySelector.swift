//
//  DaySelector.swift
//  ImitateCalendarApp
//
//  Created by daishenao on 2021/1/28.
//

import UIKit

protocol DaySelctorItemProtocol {
    var selector: Bool {set get}
    var date: Date {set get}
    var calendar: Calendar {set get}
    func updateStyle(_ newStyle: DaySelectorStyle)
}

class DaySelector: UIView {

    private var items = [UIView & DaySelctorItemProtocol]()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let itemCount = CGFloat(items.count)
        let size = items.first?.intrinsicContentSize ?? .zero
        
        var pre = bounds.size.width - size.width * itemCount
        let minX = pre / 2
        
        for (i, item) in items.enumerated() {
            
            var x = minX + (size.width + pre) * CGFloat(i)
            
            let rightToLeft = UIView.userInterfaceLayoutDirection(for: semanticContentAttribute) == .rightToLeft
            if rightToLeft {
                x = bounds.width - x - size.width
            }
            
            let origin = CGPoint(x: x, y: 0)
            let frame = CGRect(origin: origin, size: size)
            
            item.frame = frame
        }
        
        
    }
    

}
