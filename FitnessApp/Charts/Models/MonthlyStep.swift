//
//  MonthlyStep.swift
//  FitnessApp
//
//  Created by Dylan on 6/3/2568 BE.
//

import Foundation

struct MonthlyStep: Identifiable {
    let id = UUID()
    let date: Date
    let count: Int
}
