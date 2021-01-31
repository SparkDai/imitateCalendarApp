//
//  DayView.swift
//  ImitateCalendarApp
//
//  Created by daishenao on 2021/1/26.
//

import UIKit

class DayView: UIView {
    
    let dayHeaderView : DayHeaderView

    var calendar: Calendar = Calendar.autoupdatingCurrent
    
    static let headerVisibleHeight: CGFloat = 88
    var headerHeight: CGFloat = headerVisibleHeight
    
    init(calendar: Calendar = Calendar.autoupdatingCurrent) {
        self.calendar = calendar
        self.dayHeaderView = DayHeaderView(calendar: calendar)
        super.init(frame: .zero)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        addSubview(dayHeaderView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        dayHeaderView.frame = CGRect(origin: CGPoint(x: 0, y: layoutMargins.top), size: CGSize(width: bounds.width, height: headerHeight))
        
    }
    
}
