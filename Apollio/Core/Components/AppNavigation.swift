//
//  AppNavigation.swift
//  Apollio
//
//  Created by Zainab Nooh on 26/11/2026.
//

import SwiftUI

extension View {
    /// Native inline title with the glass back button (Figma: Toolbar - Top).
    func appNavigationBar(_ title: String) -> some View {
        navigationTitle(title)
            .navigationBarTitleDisplayMode(.inline)
    }
}

/// "APOLLIO" eyebrow plus large title shown under the toolbar (Figma login/sign-up headers).
struct ScreenHeader: View {
    var eyebrow: String = "APOLLIO"
    let title: String

    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(eyebrow)
                .font(.system(size: 11, weight: .bold))
                .foregroundStyle(Color.brandBlueText)
            Text(title)
                .font(.appLargeTitle)
                .foregroundStyle(Color.appTextPrimary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .accessibilityAddTraits(.isHeader)
    }
}

/// Icon button for toolbars. Gets the glass style automatically.
/// .toolbar { ToolbarItem(placement: .topBarTrailing) {
///     ToolbarIconButton(systemImage: "gearshape", label: "Settings") { ... } } }
struct ToolbarIconButton: View {
    let systemImage: String
    let label: String
    let action: () -> Void

    var body: some View {
        Button(action: action) { Image(systemName: systemImage) }
            .accessibilityLabel(label)
    }
}

/// Placeholder for screens a teammate hasn't built yet.
struct ComingSoonView: View {
    let title: String

    var body: some View {
        EmptyStateView(systemImage: "hammer", title: title,
                       message: "This screen is coming soon.")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .appScreenBackground()
            .appNavigationBar(title)
    }
}
