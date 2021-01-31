//
//  CustomCalendarViewController.swift
//  ImitateCalendarApp
//
//  Created by daishenao on 2021/1/25.
//

import UIKit

class CustomCalendarViewController: DayViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = "CustomCalendar"
    }
    
    override func loadView() {
        super.loadView()
        calendar.timeZone = TimeZone(identifier: "Asia/Shanghai")! // 没有Asia/Beijing，中国只有Asia/Shanghai、Asia/Chongqing
        
        dayView = DayView(calendar: calendar)
        view = dayView
    }
    

}
