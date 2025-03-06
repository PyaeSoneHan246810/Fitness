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
    private(set) var stepsOneWeek: [DailyStep] = [
        DailyStep(date: .now, count: 12000),
        DailyStep(date: Calendar.current.date(byAdding: .day, value: -1, to: .now) ?? .now, count: 10000),
        DailyStep(date: Calendar.current.date(byAdding: .day, value: -2, to: .now) ?? .now, count: 20000),
        DailyStep(date: Calendar.current.date(byAdding: .day, value: -3, to: .now) ?? .now, count: 22000),
        DailyStep(date: Calendar.current.date(byAdding: .day, value: -4, to: .now) ?? .now, count: 18000),
        DailyStep(date: Calendar.current.date(byAdding: .day, value: -5, to: .now) ?? .now, count: 9000),
        DailyStep(date: Calendar.current.date(byAdding: .day, value: -6, to: .now) ?? .now, count: 10000)
    ]
    private(set) var stepsOneMonth: [DailyStep] = []
    private(set) var stepsThreeMonth: [DailyStep] = []
    private(set) var stepsYearToDate: [MonthlyStep] = []
    private(set) var stepsOneYear: [MonthlyStep] = []
    
    private(set) var averageOneWeek: Int = 0
    private(set) var totalOneWeek: Int = 0
    
    private(set) var averageOneMonth: Int = 0
    private(set) var totalOneMonth: Int = 0
    
    private(set) var averageThreeMonth: Int = 0
    private(set) var totalThreeMonth: Int = 0
    
    private(set) var averageYearToDate: Int = 0
    private(set) var totalYearToDate: Int = 0
    
    private(set) var averageOneYear: Int = 0
    private(set) var totalOneYear: Int = 0
}
