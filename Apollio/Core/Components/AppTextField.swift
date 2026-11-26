//
//  AppTextField.swift
//  Apollio
//
//  Created by Zainab Nooh on 26/11/2026.
//

import SwiftUI

/// Labelled field (Figma: Card / Form fields). Optional password mode and error text.
struct AppTextField: View {
    let title: String
    let placeholder: String
    @Binding var text: String
    var isSecure = false
    var errorMessage: String? = nil
    var keyboard: UIKeyboardType = .default

    @State private var isRevealed = false

    private var prompt: Text {
        Text(placeholder).foregroundStyle(Color.appPlaceholder)
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .font(.subheadline.weight(.medium))
                .foregroundStyle(errorMessage == nil ? Color.appTextPrimary : Color.appError)

            HStack {
                Group {
                    if isSecure && !isRevealed {
                        SecureField(title, text: $text, prompt: prompt)
                    } else {
                        TextField(title, text: $text, prompt: prompt)
                            .keyboardType(keyboard)
                            .textInputAutocapitalization(.never)
                            .autocorrectionDisabled()
                    }
                }
                .font(.appBody)
                .foregroundStyle(Color.appTextPrimary)

                if isSecure {
                    Button { isRevealed.toggle() } label: {
                        Image(systemName: isRevealed ? "eye.slash" : "eye")
                            .foregroundStyle(Color.appTextSecondary)
                    }
                    .accessibilityLabel(isRevealed ? "Hide password" : "Show password")
                }
            }
            .padding(.horizontal, 14)
            .frame(minHeight: 52)
            .background(RoundedRectangle(cornerRadius: AppRadius.field).fill(Color.appFieldFill))
            .overlay(
                RoundedRectangle(cornerRadius: AppRadius.field)
                    .stroke(Color.appError, lineWidth: errorMessage == nil ? 0 : 1)
            )

            if let errorMessage {
                Text(errorMessage)
                    .font(.caption.weight(.medium))
                    .foregroundStyle(Color.appError)
                    .padding(.leading, 6)
            }
        }
    }
}
