//
//  HomeView.swift
//  FitnessApp
//
//  Created by Dylan on 3/3/2568 BE.
//

import SwiftUI

struct HomeView: View {
    // MARK: - STATE PROPERTIES
    @State private var calories: Int = 123
    @State private var active: Int = 52
    @State private var stand: Int = 8
    
    // MARK: - PROPERTIES
    private let caloriesColor: Color = .pink
    private let activeColor: Color = .green
    private let standColor: Color = .blue
    private let progressLineWidth: CGFloat = 20.0
    
    // MARK: - BODY
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 24.0) {
                Text("Welcome")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                HStack {
                    Spacer()
                    progressInfoView()
                    Spacer()
                    progressCirclesView()
                        .padding(.horizontal, 20.0)
                    Spacer()
                }
                .padding(.horizontal, 16.0)
            }
        }
    }
    
    // MARK: - VIEW BUILDERS
    @ViewBuilder
    private func progressInfoView() -> some View {
        VStack(
            alignment: .leading,
            spacing: 16.0
        ) {
            VStack(
                alignment: .leading,
                spacing: 8.0
            ) {
                Text("Calories")
                    .font(.callout)
                    .fontWeight(.bold)
                    .foregroundStyle(caloriesColor)
                Text("\(calories) kcal")
                    .fontWeight(.bold)
            }
            VStack(
                alignment: .leading,
                spacing: 8.0
            ) {
                Text("Active")
                    .font(.callout)
                    .fontWeight(.bold)
                    .foregroundStyle(activeColor)
                Text("\(active) mins")
                    .fontWeight(.bold)
            }
            VStack(
                alignment: .leading,
                spacing: 8.0
            ) {
                Text("Stand")
                    .font(.callout)
                    .fontWeight(.bold)
                    .foregroundStyle(standColor)
                Text("\(stand) hours")
                    .fontWeight(.bold)
            }
        }
    }
    @ViewBuilder
    private func progressCirclesView() -> some View {
        ZStack {
            ProgressCircleView(
                progress: $calories,
                goal: 600,
                tintColor: caloriesColor,
                lineWidth: progressLineWidth
            )
            ProgressCircleView(
                progress: $active,
                goal: 60,
                tintColor: activeColor
            )
            .padding(.all, progressLineWidth)
            ProgressCircleView(
                progress: $stand,
                goal: 24,
                tintColor: standColor
            )
            .padding(.all, progressLineWidth * 2)
        }
    }
}

// MARK: - PREVIEW
#Preview(traits: .sizeThatFitsLayout) {
    HomeView()
}
