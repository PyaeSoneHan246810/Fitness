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
    
    // MARK: - BODY
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 28.0) {
                    Group {
                        stepsChartsView()
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
    private func oneWeekStepsChartView() -> some View {
        Chart {
            ForEach(viewModel.stepsOneWeek) { dailyStep in
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
    }
    @ViewBuilder
    private func oneMonthStepsChartView() -> some View {
        Chart {
            ForEach(viewModel.stepsOneMonth) { dailyStep in
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
    }
    @ViewBuilder
    private func threeMonthStepsChartView() -> some View {
        Chart {
            ForEach(viewModel.stepsThreeMonth) { dailyStep in
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
    }
    @ViewBuilder
    private func yearToDateStepsChartView() -> some View {
        Chart {
            ForEach(viewModel.stepsYearToDate) { dailyStep in
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
    }
    @ViewBuilder
    private func oneYearStepsChartView() -> some View {
        Chart {
            ForEach(viewModel.stepsOneYear) { dailyStep in
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
    }
    @ViewBuilder
    private func stepsChartsView() -> some View {
        VStack(spacing: 12.0) {
            ZStack {
                switch selectedChartOption {
                case .oneWeek:
                    oneWeekStepsChartView()
                case .oneMonth:
                    oneMonthStepsChartView()
                case .threeMonth:
                    threeMonthStepsChartView()
                case .yearToDate:
                    yearToDateStepsChartView()
                case .oneYear:
                    oneYearStepsChartView()
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
