//
//  HomeView.swift
//  FitnessApp
//
//  Created by Dylan on 3/3/2568 BE.
//

import SwiftUI

struct HomeView: View {
    // MARK: - STATE PROPERTIES
    @State private var viewModel: HomeViewModel = .init()
    
    // MARK: - PROPERTIES
    private let caloriesColor: Color = .pink
    private let activeColor: Color = .green
    private let standColor: Color = .blue
    
    // MARK: - BODY
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 28.0) {
                    Group {
                        homeTitleView()
                        progressSessionView()
                        fitnessActivitySessionView()
                        recentWorkoutsSessionView()
                    }
                    .padding(.horizontal, 16.0)
                }
                .padding(.bottom, 16.0)
            }
        }
    }
    
    // MARK: - VIEW BUILDERS
    @ViewBuilder
    private func homeTitleView() -> some View {
        Text("Welcome")
            .font(.largeTitle)
            .fontWeight(.bold)
            .opacity(0.85)
    }
    @ViewBuilder
    private func progressSessionView() -> some View {
        HStack {
            Spacer()
            progressInfoView()
            Spacer()
            progressCirclesView()
                .padding(.horizontal, 40.0)
            Spacer()
        }
    }
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
                    .fontWeight(.semibold)
                    .foregroundStyle(caloriesColor)
                Text("\(viewModel.calories) kCal")
                    .fontWeight(.bold)
            }
            VStack(
                alignment: .leading,
                spacing: 8.0
            ) {
                Text("Active")
                    .font(.callout)
                    .fontWeight(.semibold)
                    .foregroundStyle(activeColor)
                Text("\(viewModel.active) mins")
                    .fontWeight(.bold)
            }
            VStack(
                alignment: .leading,
                spacing: 8.0
            ) {
                Text("Stand")
                    .font(.callout)
                    .fontWeight(.semibold)
                    .foregroundStyle(standColor)
                Text("\(viewModel.stand) hours")
                    .fontWeight(.bold)
            }
        }
    }
    @ViewBuilder
    private func progressCirclesView() -> some View {
        let progressLineWidth: CGFloat = 20.0
        ZStack {
            ProgressCircleView(
                progress: viewModel.calories,
                goal: 600,
                tintColor: caloriesColor,
                lineWidth: progressLineWidth
            )
            ProgressCircleView(
                progress: viewModel.active,
                goal: 60,
                tintColor: activeColor
            )
            .padding(.all, progressLineWidth)
            ProgressCircleView(
                progress: viewModel.stand,
                goal: 24,
                tintColor: standColor
            )
            .padding(.all, progressLineWidth * 2)
        }
    }
    @ViewBuilder
    private func sessionHeaderView(title: String, onShowMoreTapped: @escaping () -> Void) -> some View {
        HStack {
            Text(title)
                .font(.title2)
                .fontWeight(.bold)
                .opacity(0.85)
            Spacer()
            Button(action: onShowMoreTapped) {
                Text("Show more")
                    .font(.callout)
                    .fontWeight(.semibold)
                    .padding(.horizontal, 12.0)
                    .padding(.vertical, 10.0)
                    .foregroundStyle(.white)
                    .background(.accent)
                    .clipShape(.capsule)
            }
        }
    }
    @ViewBuilder
    private func fitnessActivitySessionView() -> some View {
        VStack(spacing: 20.0) {
            sessionHeaderView(title: "Fitness Activity") {
                print("show more fitness activities")
            }
            fitnessActivitiesGridView()
        }
    }
    @ViewBuilder
    private func fitnessActivitiesGridView() -> some View {
        LazyVGrid(
            columns: Array(
                repeating: GridItem(
                    spacing: 12.0,
                    alignment: .center
                ),
                count: 2
            ),
            alignment: .center,
            spacing: 12.0
        ) {
            ForEach(viewModel.mockFitnessActivities) { fitnessActivity in
                FitnessActivityCardView(
                    fitnessActivity: fitnessActivity
                )
            }
        }
    }
    @ViewBuilder
    private func recentWorkoutsSessionView() -> some View {
        VStack(spacing: 20.0) {
            sessionHeaderView(title: "Recent Workouts") {
                print("show more recent workouts")
            }
            recentWorkoutsStackView()
        }
    }
    @ViewBuilder
    private func recentWorkoutsStackView() -> some View {
        LazyVStack(
            spacing: 12.0
        ) {
            ForEach(viewModel.mockRecentWorkouts) { recentWorkout in
                RecentWorkoutCardView(
                    workout: recentWorkout
                )
            }
        }
    }
}

// MARK: - PREVIEW
#Preview(traits: .sizeThatFitsLayout) {
    HomeView()
}
