//
//  Date+Extensions.swift
//  FitnessApp
//
//  Created by Dylan on 4/3/2568 BE.
//

import Foundation

extension Date {
    static var startOfDay: Date {
        let calender = Calendar.current
        return calender.startOfDay(for: .now)
    }
}
