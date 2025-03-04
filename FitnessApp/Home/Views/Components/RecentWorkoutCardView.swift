//
//  RecentWorkoutCardView.swift
//  FitnessApp
//
//  Created by Dylan on 4/3/2568 BE.
//

import SwiftUI

struct RecentWorkoutCardView: View {
    // MARK: - PROPERTIES
    let workout: Workout
    // MARK: - BODY
    var body: some View {
        HStack(spacing: 12.0) {
            Image(systemName: workout.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 48.0, height: 48.0)
                .foregroundStyle(workout.tintColor)
                .padding()
                .background(Color(uiColor: .systemGray6))
                .clipShape(.rect(cornerRadius: 12.0))
            VStack(alignment: .leading, spacing: 8.0) {
                HStack {
                    Text(workout.title)
                        .font(.title3)
                        .fontWeight(.semibold)
                        .lineLimit(1)
                    Spacer()
                    Text(workout.date)
                        .font(.callout)
                        .lineLimit(1)
                }
                HStack {
                    Text(workout.duration)
                        .font(.callout)
                        .lineLimit(1)
                    Spacer()
                    Text(workout.calories)
                        .font(.callout)
                        .lineLimit(1)
                }
            }
        }
    }
}

// MARK: - PREVIEW
#Preview(traits: .sizeThatFitsLayout) {
    RecentWorkoutCardView(
        workout: Workout(
            id: 1,
            title: "Running",
            imageName: "figure.run",
            tintColor: .green,
            duration: "47 mins",
            date: "Aug 3",
            calories: "321 kCal"
        )
    )
    .padding(.horizontal, 16.0)
}
