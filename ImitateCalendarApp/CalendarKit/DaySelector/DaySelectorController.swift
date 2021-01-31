//
//  DaySelectorController.swift
//  ImitateCalendarApp
//
//  Created by daishenao on 2021/1/28.
//

import UIKit

class DaySelectorController: UIViewController {
    private(set) lazy var daySelctor = DaySelector()
    
    var calendar: Calendar {
        get {
            return daySelctor.calendar
        }
        set (newValue) {
            daySelctor.calendar = newValue
        }
    }
 
    var startDate: Date {
        get {
            return daySelctor.startDate!
        }
        set {
            daySelctor.startDate = newValue
        }
    }
    
//    var selectedDate: Date? {
//
//    }
    
    
    override func loadView() {
        view = daySelctor
    }

}
