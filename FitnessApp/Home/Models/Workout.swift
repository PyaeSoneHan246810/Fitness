//
//  Workout.swift
//  FitnessApp
//
//  Created by Dylan on 4/3/2568 BE.
//

import Foundation
import SwiftUI

struct Workout: Identifiable {
    let id: UUID = UUID()
    let title: String
    let imageName: String
    let tintColor: Color
    let duration: String
    let date: String
    let calories: String
}
