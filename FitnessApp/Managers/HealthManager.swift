//
//  HealthManager.swift
//  FitnessApp
//
//  Created by Dylan on 4/3/2568 BE.
//

import Foundation
import HealthKit

class HealthManager {
    // MARK: - PROPERTIES
    static var shared: HealthManager = .init()
    let healthStore = HKHealthStore()
    
    // MARK: - PRIVATE INITIALIZER
    private init() {}
    
    // MARK: - FUNCTIONS
    func requestHealthStoreAuthorization() async throws {
        let activeEnergyBurned = HKQuantityType(.activeEnergyBurned)
        let exerciseTime = HKQuantityType(.appleExerciseTime)
        let standHours = HKCategoryType(.appleStandHour)
        let stepCount = HKQuantityType(.stepCount)
        let workout = HKSampleType.workoutType()
        let healthDataTypes: Set<HKObjectType> = [activeEnergyBurned, exerciseTime, standHours, stepCount, workout]
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
    
    func getTodayStepsFitnessActivity(
        completion: @escaping (Result<FitnessActivity, Error>) -> Void
    ) {
        let stepCount = HKQuantityType(.stepCount)
        let predicate = HKQuery.predicateForSamples(withStart: .startOfDay, end: .now)
        let query = HKStatisticsQuery(
            quantityType: stepCount,
            quantitySamplePredicate: predicate
        ) { _, statistics, error in
            guard let sumQuantity = statistics?.sumQuantity(), error == nil else {
                completion(.failure(HealthDataError.stepCountUnavailable))
                return
            }
            let steps = sumQuantity.doubleValue(for: .count()).formattedNumberString()
            let fitnessActivity = FitnessActivity(
                title: "Today Steps",
                subtitle: "Goal: 800",
                imageName: "figure.walk",
                tintColor: .blue,
                value: steps
            )
            completion(.success(fitnessActivity))
        }
        healthStore.execute(query)
    }
    
    func getCurrentWeekWorkoutFitnessActivities(
        completion: @escaping (Result<[FitnessActivity], Error>) -> Void
    ) {
        let workout = HKSampleType.workoutType()
        let predicate = HKQuery.predicateForSamples(withStart: .startOfWeek, end: .now)
        let query = HKSampleQuery(
            sampleType: workout,
            predicate: predicate,
            limit: HKObjectQueryNoLimit,
            sortDescriptors: []
        ) { _, samples, error in
            guard let workouts = samples as? [HKWorkout], error == nil else {
                completion(.failure(HealthDataError.workoutFitnessActivitiesUnavailable))
                return
            }
            let workoutFitnessActivities = self.getWorkoutFitnessActivities(workouts)
            completion(.success(workoutFitnessActivities))
        }
        healthStore.execute(query)
    }
    
    private func getWorkoutFitnessActivities(_ workouts: [HKWorkout]) -> [FitnessActivity] {
        var runningDuration = 0
        var traditionalStrengthTrainingDuration = 0
        var soccerDuration = 0
        var basketballDuration = 0
        var stairClimbingDuration = 0
        var kickboxingDuration = 0
        for workout in workouts {
            let duration = Int(workout.duration) / 60
            if workout.workoutActivityType == .running {
                runningDuration += duration
            } else if workout.workoutActivityType == .traditionalStrengthTraining {
                traditionalStrengthTrainingDuration += duration
            } else if workout.workoutActivityType == .soccer {
                soccerDuration += duration
            } else if workout.workoutActivityType == .basketball {
                basketballDuration += duration
            } else if workout.workoutActivityType == .stairClimbing {
                stairClimbingDuration += duration
            } else if workout.workoutActivityType == .kickboxing {
                kickboxingDuration += duration
            }
        }
        let workoutFitnessActivities: [FitnessActivity] = [
            .init(
                title: "Running",
                subtitle: "This week",
                imageName: "figure.run",
                tintColor: .indigo,
                value: "\(runningDuration) mins"
            ),
            .init(
                title: "Strength Training",
                subtitle: "This week",
                imageName: "figure.strengthtraining.functional",
                tintColor: .purple,
                value: "\(traditionalStrengthTrainingDuration) mins"
            ),
            .init(
                title: "Soccer",
                subtitle: "This week",
                imageName: "figure.indoor.soccer",
                tintColor: .green,
                value: "\(soccerDuration) mins"
            ),
            .init(
                title: "Basketball",
                subtitle: "This week",
                imageName: "figure.basketball",
                tintColor: .orange,
                value: "\(basketballDuration) mins"
            ),
            .init(
                title: "Stair Climbing",
                subtitle: "This week",
                imageName: "figure.stair.stepper",
                tintColor: .brown,
                value: "\(stairClimbingDuration) mins"
            ),
            .init(
                title: "Kickboxing",
                subtitle: "This week",
                imageName: "figure.kickboxing",
                tintColor: .red,
                value: "\(kickboxingDuration) mins"
            )
        ]
        return workoutFitnessActivities
    }
}
