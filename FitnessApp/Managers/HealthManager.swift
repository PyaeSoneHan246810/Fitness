//
//  HealthManager.swift
//  FitnessApp
//
//  Created by Dylan on 4/3/2568 BE.
//

import Foundation
import HealthKit

class HealthManager {
    static var shared: HealthManager = .init()
    
    let healthStore = HKHealthStore()
    
    private init() {}
    
    func requestHealthStoreAuthorization() async throws {
        let activeEnergyBurned = HKQuantityType(.activeEnergyBurned)
        let exerciseTime = HKQuantityType(.appleExerciseTime)
        let standHours = HKCategoryType(.appleStandHour)
        let healthDataTypes: Set<HKObjectType> = [activeEnergyBurned, exerciseTime, standHours]
        try await healthStore.requestAuthorization(toShare: [], read: healthDataTypes)
    }
    
    func getTodayBurnedCaloriesAmount(
        completion: @escaping (Result<Double, Error>) -> Void
    ) {
        let activeEnergyBurned = HKQuantityType(.activeEnergyBurned)
        let predicate = HKQuery.predicateForSamples(withStart: .startOfDay, end: .now)
        let query = HKStatisticsQuery(
            quantityType: activeEnergyBurned,
            quantitySamplePredicate: predicate
        ) { _, statistics, error in
            guard let sumQuantity = statistics?.sumQuantity(), error == nil else {
                completion(.failure(HealthDataError.burnedCaloriesAmountUnavailable))
                return
            }
            let burnedCaloriesAmount = sumQuantity.doubleValue(for: .kilocalorie())
            completion(.success(burnedCaloriesAmount))
        }
        healthStore.execute(query)
    }
    
    func getTodayActiveMinutes(
        completion: @escaping (Result<Double, Error>) -> Void
    ) {
        let exerciseTime = HKQuantityType(.appleExerciseTime)
        let predicate = HKQuery.predicateForSamples(withStart: .startOfDay, end: .now)
        let query = HKStatisticsQuery(
            quantityType: exerciseTime,
            quantitySamplePredicate: predicate
        ) { _, statistics, error in
            guard let sumQuantity = statistics?.sumQuantity(), error == nil else {
                completion(.failure(HealthDataError.activeMinutesUnavailable))
                return
            }
            let activeMinutes = sumQuantity.doubleValue(for: .minute())
            completion(.success(activeMinutes))
        }
        healthStore.execute(query)
    }
    
    func getTodayStandHours(
        completion: @escaping (Result<Int, Error>) -> Void
    ) {
        let standHours = HKCategoryType(.appleStandHour)
        let predicate = HKQuery.predicateForSamples(withStart: .startOfDay, end: .now)
        let query = HKSampleQuery(
            sampleType: standHours,
            predicate: predicate,
            limit: HKObjectQueryNoLimit,
            sortDescriptors: nil
        ) { _, samples, error in
            guard let categorySamples = samples as? [HKCategorySample], error == nil else {
                completion(.failure(HealthDataError.standHoursUnavailable))
                return
            }
            let standHours = categorySamples.filter {
                $0.value == 0
            }.count
            completion(.success(standHours))
        }
        healthStore.execute(query)
    }
}
