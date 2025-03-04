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
    // MARK: - STATE PROPERTIES
    private(set) var calories: Int = 123
    private(set) var active: Int = 52
    private(set) var stand: Int = 8
    private(set) var fitnessActivities: [FitnessActivity] = []
    private(set) var recentWorkouts: [Workout] = []
    
    // MARK: - MOCK DATA
    let mockFitnessActivities: [FitnessActivity] = [
        FitnessActivity(
            id: 0,
            title: "Today Steps",
            subtitle: "Goal 10,000",
            imageName: "figure.walk",
            tintColor: .green,
            value: "6,121"
        ),
        FitnessActivity(
            id: 1,
            title: "Today Steps",
            subtitle: "Goal 10,000",
            imageName: "figure.run",
            tintColor: .blue,
            value: "6,121"
        )
    ]
    let mockRecentWorkouts: [Workout] = [
        Workout(
            id: 1,
            title: "Running",
            imageName: "figure.run",
            tintColor: .green,
            duration: "47 mins",
            date: "Aug 3",
            calories: "321 kCal"
        ),
        Workout(
            id: 2,
            title: "Walking",
            imageName: "figure.walk",
            tintColor: .blue,
            duration: "30 mins",
            date: "Aug 3",
            calories: "250 kCal"
        )
    ]
}
