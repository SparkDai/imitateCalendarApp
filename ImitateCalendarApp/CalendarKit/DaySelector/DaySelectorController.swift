//
//  DaySelectorController.swift
//  ImitateCalendarApp
//
//  Created by daishenao on 2021/1/28.
//

import UIKit

class DaySelectorController: UIViewController {
    
    private(set) lazy var daySelctor = DaySelector()
    
    override func loadView() {
        view = daySelctor
    }
    
    

}
