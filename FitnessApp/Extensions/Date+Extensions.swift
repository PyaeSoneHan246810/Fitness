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
    static var startOfWeek: Date {
        let calendar = Calendar.current
        return calendar.dateInterval(of: .weekOfYear, for: .now)?.start ?? .now
    }
    func getMonthStartAndEndDates() -> (startDate: Date, endDate: Date) {
        let calendar = Calendar.current
        let startDateComponents = calendar.dateComponents([.year, .month], from: calendar.startOfDay(for: self))
        let startDate = calendar.date(from: startDateComponents) ?? self
        let endDate = calendar.date(byAdding: DateComponents(month: 1, day: -1), to: startDate) ?? self
        return (startDate, endDate)
    }
}
