//
//  TabItem.swift
//  FitnessApp
//
//  Created by Dylan on 5/3/2568 BE.
//

import Foundation

enum TabItem: String {
    case home = "Home"
    case charts = "Charts"
    var systemImageName: String {
        switch self {
        case .home:
            return "house"
        case .charts:
            return "chart.line.uptrend.xyaxis"
        }
    }
}
