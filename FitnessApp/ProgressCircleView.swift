//
//  ProgressCircleView.swift
//  FitnessApp
//
//  Created by Dylan on 3/3/2568 BE.
//

import SwiftUI

struct ProgressCircleView: View {
    // MARK: - PROPERTIES
    @Binding var progress: Int
    var goal: Int
    var tintColor: Color
    var lineWidth: CGFloat = 20.0
    
    // MARK: - COMPUTED PROPERTIES
    private var progressedAmount: CGFloat {
        CGFloat(progress) / CGFloat(goal)
    }
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            Circle()
                .stroke(tintColor.opacity(0.3), lineWidth: lineWidth)
            Circle()
                .trim(from: 0.0, to: progressedAmount)
                .stroke(tintColor, style: .init(lineWidth: lineWidth, lineCap: .round))
                .rotationEffect(.degrees(270.0))
                .shadow(radius: 5.0)
        }
    }
}

// MARK: - PREVIEW
#Preview(traits: .sizeThatFitsLayout) {
    ProgressCircleView(
        progress: .constant(50),
        goal: 100,
        tintColor: .pink
    )
}
