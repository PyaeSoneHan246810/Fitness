//
//  ChartsView.swift
//  FitnessApp
//
//  Created by Dylan on 3/3/2568 BE.
//

import SwiftUI
import Charts

struct ChartsView: View {
    // MARK: - PROPERTIES
    @State private var viewModel: ChartsViewModel = .init()
    @State private var selectedChartOption: ChartOption = .oneWeek
    
    // MARK: - COMPUTED PROPERTIES
    private var dailySteps: [DailyStep] {
        switch selectedChartOption {
        case .oneWeek:
            viewModel.dailyStepsOneWeek
        case .oneMonth:
            viewModel.dailyStepsOneMonth
        case .threeMonth:
            viewModel.dailyStepsThreeMonth
        case .yearToDate:
            viewModel.dailyStepsYearToDate
        case .oneYear:
            viewModel.dailySetpsOneYear
        }
    }
    
    // MARK: - BODY
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 28.0) {
                    Group {
                        dailyStepsChartView()
                    }
                    .padding(.horizontal, 16.0)
                }
                .padding(.vertical, 16.0)
            }
            .navigationTitle("Charts")
        }
    }
    
    // MARK: - VIEW BUILDERS
    @ViewBuilder
    private func dailyStepsChartView() -> some View {
        VStack(spacing: 12.0) {
            Chart {
                ForEach(dailySteps) { dailyStep in
                    BarMark(
                        x: .value(
                            dailyStep.date.formatted(),
                            dailyStep.date,
                            unit: .day
                        ),
                        y: .value(
                            "Steps",
                            dailyStep.count
                        )
                    )
                    .foregroundStyle(.blue)
                }
            }
            .frame(height: 320.0)
            .animation(.smooth, value: selectedChartOption)
            Picker("Chart Options", selection: $selectedChartOption) {
                ForEach(ChartOption.allCases) { option in
                    Text(option.rawValue)
                        .tag(option)
                }
            }
            .pickerStyle(.segmented)
        }
    }
}

// MARK: - PREVIEW
#Preview(traits: .sizeThatFitsLayout) {
    ChartsView()
}
