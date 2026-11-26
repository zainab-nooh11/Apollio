//
//  StateViews.swift
//  Apollio
//
//  Created by Zainab Nooh on 26/11/2026.
//

import SwiftUI

/// Empty state with icon, message and optional button.
struct EmptyStateView: View {
    let systemImage: String
    let title: String
    let message: String
    var actionTitle: String? = nil
    var action: (() -> Void)? = nil

    var body: some View {
        VStack(spacing: AppSpacing.medium) {
            Image(systemName: systemImage)
                .font(.system(size: 48))
                .foregroundStyle(Color.brandGold)
            Text(title).font(.appTitle).foregroundStyle(Color.appTextPrimary)
            Text(message)
                .font(.appBody)
                .foregroundStyle(Color.appTextSecondary)
                .multilineTextAlignment(.center)
            if let actionTitle, let action {
                PrimaryButton(title: actionTitle, action: action)
                    .padding(.top, AppSpacing.small)
            }
        }
        .padding(AppSpacing.large)
        .frame(maxWidth: 400)
        .accessibilityElement(children: .contain)
    }
}

/// Red banner for form or network errors.
struct ErrorBanner: View {
    let message: String

    var body: some View {
        Label(message, systemImage: "exclamationmark.circle.fill")
            .font(.appSubheadline)
            .foregroundStyle(Color.appError)
            .padding(AppSpacing.medium)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                RoundedRectangle(cornerRadius: AppRadius.field)
                    .fill(Color.appErrorBackground)
            )
    }
}

/// Dims the screen and shows a spinner. Usage: .loadingOverlay(isLoading, message: "Logging in...")
private struct LoadingOverlayModifier: ViewModifier {
    let isLoading: Bool
    let message: String?

    func body(content: Content) -> some View {
        content
            .disabled(isLoading)
            .overlay {
                if isLoading {
                    ZStack {
                        Color.black.opacity(0.35).ignoresSafeArea()
                        VStack(spacing: AppSpacing.medium) {
                            ProgressView().controlSize(.large)
                            if let message { Text(message).font(.appSubheadline) }
                        }
                        .padding(AppSpacing.large)
                        .background(RoundedRectangle(cornerRadius: AppRadius.card).fill(.regularMaterial))
                    }
                }
            }
    }
}

extension View {
    func loadingOverlay(_ isLoading: Bool, message: String? = nil) -> some View {
        modifier(LoadingOverlayModifier(isLoading: isLoading, message: message))
    }
}
