//
//  AppSearchBar.swift
//  Apollio
//
//  Created by Zainab Nooh on 26/11/2026.
//

import SwiftUI

/// Search field and category chip used on Select Quiz, Join Challenge, and the admin lists.
struct AppSearchBar: View {
    @Binding var text: String
    var placeholder = "Search"

    var body: some View {
        HStack(spacing: AppSpacing.small) {
            Image(systemName: "magnifyingglass").foregroundStyle(Color.appTextSecondary)
            TextField(placeholder, text: $text)
                .font(.appBody)
                .autocorrectionDisabled()
            if !text.isEmpty {
                Button { text = "" } label: {
                    Image(systemName: "xmark.circle.fill").foregroundStyle(Color.appTextSecondary)
                }
                .accessibilityLabel("Clear search")
            }
        }
        .padding(.horizontal, AppSpacing.medium)
        .frame(minHeight: 48)
        .background(RoundedRectangle(cornerRadius: AppRadius.field).fill(Color.appFieldFill))
    }
}

struct CategoryChip: View {
    let title: String
    var isSelected = false
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.appSubheadline.weight(.semibold))
                .foregroundStyle(isSelected ? Color.appPrimaryButtonText : Color.appTextPrimary)
                .padding(.horizontal, AppSpacing.medium)
                .padding(.vertical, 8)
                .background(Capsule().fill(isSelected ? Color.appPrimaryButton : Color.appSurface))
                .overlay(Capsule().stroke(isSelected ? Color.clear : Color.appBorder, lineWidth: 1))
        }
        .accessibilityAddTraits(isSelected ? .isSelected : [])
    }
}
