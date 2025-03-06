//
//  DailyStep.swift
//  FitnessApp
//
//  Created by Dylan on 5/3/2568 BE.
//

import Foundation

struct DailyStep: Identifiable {
    let id = UUID()
    let date: Date
    let count: Double
}
