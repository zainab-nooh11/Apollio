//
//  PrimaryButton.swift
//  Apollio
//
//  Created by Zainab Nooh on 26/11/2026.
//

import SwiftUI

/// Filled blue capsule button (Figma: Button / Login). Main action on a screen.
struct PrimaryButton: View {
    let title: String
    var isLoading = false
    var isEnabled = true
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            ZStack {
                Text(title).font(.appHeadline).opacity(isLoading ? 0 : 1)
                if isLoading { ProgressView().tint(Color.appPrimaryButtonText) }
            }
            .foregroundStyle(Color.appPrimaryButtonText)
            .frame(maxWidth: .infinity, minHeight: 50)
            .background(Capsule().fill(Color.appPrimaryButton))
            .appButtonShadow()
            .opacity(isEnabled ? 1 : 0.5)
        }
        .disabled(!isEnabled || isLoading)
        .accessibilityLabel(title)
    }
}

/// Outlined capsule button (Figma: Button / Cancel). Secondary actions.
struct SecondaryButton: View {
    let title: String
    var isEnabled = true
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.appHeadline)
                .foregroundStyle(Color.brandBlueText)
                .frame(maxWidth: .infinity, minHeight: 50)
                .background(Capsule().fill(Color.appSurface))
                .overlay(Capsule().stroke(Color.appBorder, lineWidth: 1))
                .opacity(isEnabled ? 1 : 0.5)
        }
        .disabled(!isEnabled)
    }
}
