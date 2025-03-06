//
//  MainTabView.swift
//  FitnessApp
//
//  Created by Dylan on 3/3/2568 BE.
//

import SwiftUI

struct MainTabView: View {
    // MARK: - STATE PROPERTIES
    @State private var selectedTabItem: TabItem = .home
    
    // MARK: - INITIALIZER
    init() {
        configureTabBarApperance()
    }
    
    // MARK: - BODY
    var body: some View {
        TabView(selection: $selectedTabItem) {
            Tab(
                TabItem.home.rawValue,
                systemImage: TabItem.home.systemImageName,
                value: TabItem.home
            ) {
                HomeView()
            }
            Tab(
                TabItem.charts.rawValue,
                systemImage: TabItem.charts.systemImageName,
                value: TabItem.charts
            ) {
                ChartsView()
            }
        }
    }
    
    // MARK: - FUNCTIONS
    private func configureTabBarApperance() {
        let apperence = UITabBarAppearance()
        apperence.configureWithDefaultBackground()
        apperence.stackedLayoutAppearance.selected.iconColor = UIColor.accent
        apperence.stackedLayoutAppearance.selected.titleTextAttributes = [
            .foregroundColor: UIColor.accent
        ]
        UITabBar.appearance().scrollEdgeAppearance = apperence
    }
}

// MARK: - PREVIEW
#Preview(traits: .sizeThatFitsLayout) {
    MainTabView()
}
