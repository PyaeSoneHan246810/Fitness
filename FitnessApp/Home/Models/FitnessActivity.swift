//
//  FitnessActivity.swift
//  FitnessApp
//
//  Created by Dylan on 4/3/2568 BE.
//

import Foundation
import SwiftUI

struct FitnessActivity: Identifiable {
    let id: UUID = UUID()
    let title: String
    let subtitle: String
    let imageName: String
    let tintColor: Color
    let value: String
}
