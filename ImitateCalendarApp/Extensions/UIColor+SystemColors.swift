//
//  UIColor+SystemColors.swift
//  ImitateCalendarApp
//
//  Created by daishenao on 2021/1/27.
//

import Foundation
import UIKit

enum SystemColors {
    static var label: UIColor {
        if #available(iOS 13, *) {
            return .label
        }
        return .black
    }
    static var secondaryLabel: UIColor {
        if #available(iOS 13, *) {
            return .secondaryLabel
        }
        return .lightGray
    }
    static var secondarySystemBackground: UIColor {
        if #available(iOS 13, *) {
            return .secondarySystemBackground
        }
        return UIColor(white: 247/255, alpha: 1)
    }
    static var systemBackground: UIColor {
        if #available(iOS 13, *) {
            return .systemBackground
        }
        return .white
    }
    static var systemRed: UIColor {
        if #available(iOS 13, *) {
            return .systemRed
        }
        return .red
    }
    
}
