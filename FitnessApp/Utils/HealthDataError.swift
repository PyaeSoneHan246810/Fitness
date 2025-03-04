//
//  HealthDataError.swift
//  FitnessApp
//
//  Created by Dylan on 4/3/2568 BE.
//

import Foundation

enum HealthDataError: LocalizedError {
    case burnedCaloriesAmountUnavailable
    case activeMinutesUnavailable
    case standHoursUnavailable
    var errorDescription: String? {
        switch self {
        case .burnedCaloriesAmountUnavailable:
            return "Burned calories amount unavailable."
        case .activeMinutesUnavailable:
            return "Active minutes unavailable."
        case .standHoursUnavailable:
            return "Stand hours unavailable."
        }
    }
}
