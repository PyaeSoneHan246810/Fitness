//
//  FitnessActivityCardView.swift
//  FitnessApp
//
//  Created by Dylan on 4/3/2568 BE.
//

import SwiftUI

struct FitnessActivityCardView: View {
    // MARK: - PROPERTIES
    let fitnessActivity: FitnessActivity
    // MARK: - BODY
    var body: some View {
        ZStack {
            Color(uiColor: .systemGray6)
            VStack(spacing: 16.0) {
                HStack(
                    alignment: .top
                ) {
                    VStack(
                        alignment: .leading,
                        spacing: 8.0
                    ) {
                        Text(fitnessActivity.title)
                            .font(.headline)
                            .lineLimit(1)
                        Text(fitnessActivity.subtitle)
                            .font(.callout)
                            .fontWeight(.medium)
                            .lineLimit(1)
                    }
                    Spacer()
                    Image(
                        systemName: fitnessActivity.imageName
                    )
                    .imageScale(.large)
                    .foregroundStyle(fitnessActivity.tintColor)
                }
                Text(fitnessActivity.value)
                    .font(.title3)
                    .fontWeight(.bold)
                    .lineLimit(1)
            }
            .padding(.horizontal, 16.0)
            .padding(.vertical, 16.0)
        }
        .clipShape(.rect(cornerRadius: 16.0))
    }
}

// MARK: - PREVIEW
#Preview(traits: .sizeThatFitsLayout) {
    FitnessActivityCardView(
        fitnessActivity: .init(
            title: "Today Steps",
            subtitle: "Goal 10,000",
            imageName: "figure.walk",
            tintColor: .green,
            value: "6,121"
        )
    )
}
