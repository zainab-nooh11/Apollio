//
//  NavigationPreview.swift
//  Apollio
//
//  Created by Zainab Nooh on 26/11/2026.
//

import SwiftUI

// Preview only: shows the native Liquid Glass navigation bar (title, back button, toolbar buttons).
// Nothing here ships in the app.

private struct NavigationPreviewRoot: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: AppSpacing.medium) {
                    ScreenHeader(title: "Navigation preview")

                    NavigationLink {
                        NavigationPreviewDetail()
                    } label: {
                        AppCard {
                            HStack {
                                Text("Open detail screen")
                                    .font(.appHeadline)
                                    .foregroundStyle(Color.appTextPrimary)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundStyle(Color.appTextSecondary)
                            }
                        }
                    }
                    .buttonStyle(.plain)
                }
                .padding(AppSpacing.medium)
                .readableContentWidth()
            }
            .appScreenBackground()
            .appNavigationBar("Home")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    ToolbarIconButton(systemImage: "gearshape", label: "Settings") {}
                }
            }
        }
    }
}

private struct NavigationPreviewDetail: View {
    var body: some View {
        ScrollView {
            VStack(spacing: AppSpacing.medium) {
                ScreenHeader(title: "Detail screen")

                // Enough content to scroll, so you can see the glass bar over moving content.
                ForEach(1...12, id: \.self) { index in
                    AppCard {
                        Text("Card \(index)")
                            .font(.appBody)
                            .foregroundStyle(Color.appTextPrimary)
                    }
                }
            }
            .padding(AppSpacing.medium)
            .readableContentWidth()
        }
        .appScreenBackground()
        .appNavigationBar("Detail")        // native back button appears automatically
        .toolbar {
            ToolbarItemGroup(placement: .topBarTrailing) {
                ToolbarIconButton(systemImage: "square.and.arrow.up", label: "Share") {}
                ToolbarIconButton(systemImage: "ellipsis", label: "More") {}
            }
            ToolbarSpacer(.fixed, placement: .topBarTrailing)
            ToolbarItem(placement: .topBarTrailing) {
                Button("Save") {}
                    .buttonStyle(.borderedProminent)   // tinted glass button
            }
        }
    }
}

#Preview("Light") {
    NavigationPreviewRoot().preferredColorScheme(.light)
}

#Preview("Dark") {
    NavigationPreviewRoot().preferredColorScheme(.dark)
}
