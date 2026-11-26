//
//  MainTabView.swift
//  Apollio
//
//  Created by Zainab Nooh on 26/11/2026.
//

import SwiftUI

/// Main app shell shown after login. Each tab has its own NavigationStack,
/// so the native glass tab bar and back buttons work automatically.
/// Teammates: replace the ComingSoonView for your tab with your root screen.
struct MainTabView: View {
    @State private var selection: AppTab = .home

    var body: some View {
        TabView(selection: $selection) {
            ForEach(AppTab.allCases) { tab in
                Tab(tab.title, systemImage: tab.systemImage, value: tab) {
                    NavigationStack {
                        destination(for: tab)
                    }
                }
            }
        }
        .environment(\.symbolVariants, .none)
        .tint(Color.appPrimaryButton)
        .tint(Color.appPrimaryButton)
    }

    @ViewBuilder
    private func destination(for tab: AppTab) -> some View {
        switch tab {
        case .home:       ComingSoonView(title: "Home")          // Zainab
        case .play:       ComingSoonView(title: "Play")          // Layal
        case .createQuiz: ComingSoonView(title: "Create Quiz")   // Ejlal
        case .profile:    ComingSoonView(title: "Profile")       // Zainab
        }
    }
}

#Preview("Light") { MainTabView().preferredColorScheme(.light) }
#Preview("Dark") { MainTabView().preferredColorScheme(.dark) }
