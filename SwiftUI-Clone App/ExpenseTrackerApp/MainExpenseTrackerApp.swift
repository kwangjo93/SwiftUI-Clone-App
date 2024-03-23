//
//  MainExpenseTrackerApp.swift
//  SwiftUI-Clone App
//
//  Created by 천광조 on 3/22/24.
//

import SwiftUI

struct MainExpenseTrackerApp: View {
    //Visibility Status
    @AppStorage("isFirstTime") private var isFirstTime = true
    @AppStorage("isAppLockEnabled") private var isAppLockEnabled: Bool = false
    @AppStorage("lockWhenAppGoesBackground") private var lockWhenAppGoesBackground: Bool = false
    //Active Tab
    @State private var activeTab: ExpenseTab = .recents
    var body: some View {
        TabView(selection: $activeTab) {
            Recents()
                .tag(ExpenseTab.recents)
                .tabItem { ExpenseTab.recents.tabContent }
            Search()
                .tag(ExpenseTab.search)
                .tabItem { ExpenseTab.search.tabContent }
            Graphs()
                .tag(ExpenseTab.charts)
                .tabItem { ExpenseTab.charts.tabContent }
            Settings()
                .tag(ExpenseTab.settings)
                .tabItem { ExpenseTab.settings.tabContent }
        }
        .tint(appTint)
        .sheet(isPresented: $isFirstTime, content: {
            IntroScreen()
                .interactiveDismissDisabled()
        })
    }
}

#Preview {
    MainExpenseTrackerApp()
}
