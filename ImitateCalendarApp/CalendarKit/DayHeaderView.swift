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
    
    private var daySymbolsViewHeight: CGFloat = 20
    
    init(calendar: Calendar = Calendar.autoupdatingCurrent) {
        self.calendar = calendar
        self.daySymbolsView = DaySymbolsView()
        super.init(frame: .zero)
        configure()
        setNeedsLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        [daySymbolsView].forEach(addSubview)
        backgroundColor = style.backgroundCloor
    }
    
    private func configurePagingViewController() {
        
    }
    
    override func layoutSubviews() {
        superview?.layoutSubviews()
        daySymbolsView.frame = CGRect(origin: .zero, size: CGSize(width: bounds.width, height: daySymbolsViewHeight))
    }
    
}
