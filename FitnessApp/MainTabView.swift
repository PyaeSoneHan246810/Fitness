//
//  MainTabView.swift
//  FitnessApp
//
//  Created by Dylan on 3/3/2568 BE.
//

import SwiftUI

// MARK: - MAIN TAB VIEW
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
                TabItem.historic.rawValue,
                systemImage: TabItem.historic.systemImageName,
                value: TabItem.historic
            ) {
                HistoricView()
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

// MARK: - TAB ITEM
enum TabItem: String {
    case home = "Home"
    case historic = "Historic"
    var systemImageName: String {
        switch self {
        case .home:
            return "house"
        case .historic:
            return "chart.line.uptrend.xyaxis"
        }
    }
}

// MARK: - PREVIEW
#Preview(traits: .sizeThatFitsLayout) {
    MainTabView()
}
