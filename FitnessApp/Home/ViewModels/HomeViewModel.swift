//
//  HomeViewModel.swift
//  FitnessApp
//
//  Created by Dylan on 4/3/2568 BE.
//

import Foundation
import Observation

@Observable
class HomeViewModel {
    // MARK: - PROPERTIES
    let healthManager: HealthManager = .shared
    
    // MARK: - STATE PROPERTIES
    private(set) var caloriesAmount: Double = 0
    private(set) var activeMinutes: Int = 0
    private(set) var standHours: Int = 0
    private(set) var fitnessActivities: [FitnessActivity] = []
    private(set) var recentWorkouts: [Workout] = []
    
    // MARK: - INITIALIZER
    init() {
        Task {
            do {
                try await healthManager.requestHealthStoreAuthorization()
                getHealthData()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    // MARK: - FUNCTIONS
    private func getHealthData() {
        getTodayBurnedCaloriesAmount()
        getTodayActiveMinutes()
        getTodayStandHours()
        getTodayStepsFitnessActivity()
        getCurrentWeekFitnessActivities()
        getWorkoutsForMonth()
    }
    
    private func getTodayBurnedCaloriesAmount() {
        healthManager.getTodayBurnedCaloriesAmount { result in
            switch result {
            case .success(let caloriesAmount):
                DispatchQueue.main.async {
                    self.caloriesAmount = caloriesAmount
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func getTodayActiveMinutes() {
        healthManager.getTodayActiveMinutes { result in
            switch result {
            case .success(let activeMinutes):
                DispatchQueue.main.async {
                    self.activeMinutes = Int(activeMinutes)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
     private func getTodayStandHours() {
        healthManager.getTodayStandHours { result in
            switch result {
            case .success(let standHours):
                DispatchQueue.main.async {
                    self.standHours = standHours
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func getTodayStepsFitnessActivity() {
        healthManager.getTodayStepsFitnessActivity { result in
            switch result {
            case .success(let fitnessActivity):
                DispatchQueue.main.async {
                    self.fitnessActivities.append(fitnessActivity)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func getCurrentWeekFitnessActivities() {
        healthManager.getCurrentWeekWorkoutFitnessActivities { result in
            switch result {
            case .success(let fitnessActivities):
                DispatchQueue.main.async {
                    self.fitnessActivities.append(contentsOf: fitnessActivities)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func getWorkoutsForMonth() {
        healthManager.getWorkoutsForMonth(Date()) { result in
            switch result {
            case .success(let workouts):
                DispatchQueue.main.async {
                    self.recentWorkouts.append(contentsOf: workouts)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
