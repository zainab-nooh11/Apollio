//
//  AppCard.swift
//  Apollio
//
//  Created by Zainab Nooh on 26/11/2026.
//

import SwiftUI

/// Rounded surface container used for cards across the app.
struct AppCard<Content: View>: View {
    @ViewBuilder var content: () -> Content

    var body: some View {
        content()
            .padding(AppSpacing.medium)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(RoundedRectangle(cornerRadius: AppRadius.card).fill(Color.appSurface))
            .appCardShadow()
    }
}

/// Small card showing a value and label (Streak, Level, Challenges won...).
struct StatCard: View {
    let value: String
    let label: String
    var systemImage: String? = nil

    var body: some View {
        AppCard {
            VStack(spacing: 4) {
                if let systemImage {
                    Image(systemName: systemImage).foregroundStyle(Color.brandGold)
                }
                Text(value).font(.appTitle).foregroundStyle(Color.appTextPrimary)
                Text(label).font(.appFootnote).foregroundStyle(Color.appTextSecondary)
            }
            .frame(maxWidth: .infinity)
        }
        .accessibilityElement(children: .combine)
    }
}
