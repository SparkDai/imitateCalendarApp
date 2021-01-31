//
//  Array+Shift.swift
//  ImitateCalendarApp
//
//  Created by daishenao on 2021/1/26.
//

extension Array {
    
    mutating func shift(_ amount: Int) {
        var amount = amount
        guard -count...count ~= amount else { return } // ~= 表示的意思是 前面区间的值包不包含后面的值
        if amount < 0 { amount += count }
        self =  Array(self[amount ..< count] + self[0 ..< amount])
    }
    
}
