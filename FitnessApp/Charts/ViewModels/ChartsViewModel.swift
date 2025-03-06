//
//  ChartsViewModel.swift
//  FitnessApp
//
//  Created by Dylan on 5/3/2568 BE.
//

import Foundation
import Observation

@Observable
class ChartsViewModel {
    // MARK: - STATE PROPERTIES
    private(set) var dailyStepsOneWeek: [DailyStep] = [
        DailyStep(date: .now, count: 12000),
        DailyStep(date: Calendar.current.date(byAdding: .day, value: -1, to: .now) ?? .now, count: 10000),
        DailyStep(date: Calendar.current.date(byAdding: .day, value: -2, to: .now) ?? .now, count: 20000),
        DailyStep(date: Calendar.current.date(byAdding: .day, value: -3, to: .now) ?? .now, count: 22000),
        DailyStep(date: Calendar.current.date(byAdding: .day, value: -4, to: .now) ?? .now, count: 18000),
        DailyStep(date: Calendar.current.date(byAdding: .day, value: -5, to: .now) ?? .now, count: 9000),
        DailyStep(date: Calendar.current.date(byAdding: .day, value: -6, to: .now) ?? .now, count: 10000)
    ]
    private(set) var dailyStepsOneMonth: [DailyStep] = []
    private(set) var dailyStepsThreeMonth: [DailyStep] = []
    private(set) var dailyStepsYearToDate: [DailyStep] = []
    private(set) var dailySetpsOneYear: [DailyStep] = []
}
