//
//  DayViewController.swift
//  ImitateCalendarApp
//
//  Created by daishenao on 2021/1/25.
//

import UIKit

class DayViewController: UIViewController {

    lazy var dayView: DayView = DayView()
    
    var calendar = Calendar.autoupdatingCurrent {
        didSet {
            dayView.calendar = calendar
        }
    }
    
    override func loadView() {
        view = DayView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    

}
