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
    // MARK: - PROPERTIES
    let healthManager: HealthManager = .shared
    
    // MARK: - STATE PROPERTIES
    private(set) var stepsOneWeek: [DailyStep] = []
    private(set) var stepsOneMonth: [DailyStep] = []
    private(set) var stepsThreeMonth: [DailyStep] = []
    private(set) var stepsYearToDate: [MonthlyStep] = []
    private(set) var stepsOneYear: [MonthlyStep] = []
    
    private(set) var totalOneWeek: Int = 0
    private(set) var averageOneWeek: Int = 0
    
    private(set) var totalOneMonth: Int = 0
    private(set) var averageOneMonth: Int = 0

    private(set) var totalThreeMonth: Int = 0
    private(set) var averageThreeMonth: Int = 0
    
    private(set) var totalYearToDate: Int = 0
    private(set) var averageYearToDate: Int = 0
    
    private(set) var totalOneYear: Int = 0
    private(set) var averageOneYear: Int = 0
    
    // MARK: - FUNCTIONS
    func getYearToDateAndOneYearSteps() {
        healthManager.getYearToDateAndOneYearSteps { result in
            switch result {
            case .success(let yearStepData):
                DispatchQueue.main.async {
                    self.stepsYearToDate = yearStepData.yearToDateSteps
                    self.stepsOneYear = yearStepData.oneYearSteps
                    self.totalYearToDate = self.stepsYearToDate.reduce(0) { result, next in
                        result + next.count
                    }
                    self.totalOneYear = self.stepsOneYear.reduce(0) { result, next in
                        result + next.count
                    }
                    self.averageYearToDate = self.totalYearToDate / 12
                    self.averageOneYear = self.totalOneYear / 12
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
