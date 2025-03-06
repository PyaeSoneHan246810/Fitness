//
//  ChartOption.swift
//  FitnessApp
//
//  Created by Dylan on 6/3/2568 BE.
//

import Foundation

enum ChartOption: String, CaseIterable, Identifiable {
    case oneWeek = "1W"
    case oneMonth = "1M"
    case threeMonth = "3M"
    case yearToDate = "YTD"
    case oneYear = "1Y"
    var id: String {
        rawValue
    }
}
