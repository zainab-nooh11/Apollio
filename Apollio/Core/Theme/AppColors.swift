//
//  AppColors.swift
//  Apollio
//
//  Created by Zainab Nooh on 25/11/2026.
//

//
//  AppColors.swift
//  Apollio
//

import SwiftUI

// Colors are defined in Assets.xcassets (light and dark variants).
// Xcode generates a static Color for each color set automatically, for example:
// .brandGold, .brandBlue, .brandBlueText, .brandGreen, .appSurface, .appFieldFill,
// .appTextPrimary, .appTextSecondary, .appError, .appBackgroundTop, .appBackgroundBottom
// Use them like: Text("Hi").foregroundStyle(.appTextPrimary)

// MARK: - Preview (checks every color in light and dark mode)

private struct Swatch: Identifiable {
    let id: String
    let color: Color
}

private struct ColorSwatchPreview: View {
    private let swatches: [Swatch] = [
        Swatch(id: "brandGold", color: .brandGold),
        Swatch(id: "brandBlue", color: .brandBlue),
        Swatch(id: "brandBlueText", color: .brandBlueText),
        Swatch(id: "brandGreen", color: .brandGreen),
        Swatch(id: "appSurface", color: .appSurface),
        Swatch(id: "appFieldFill", color: .appFieldFill),
        Swatch(id: "appTextPrimary", color: .appTextPrimary),
        Swatch(id: "appTextSecondary", color: .appTextSecondary),
        Swatch(id: "appError", color: .appError),
        Swatch(id: "appBackgroundTop", color: .appBackgroundTop),
        Swatch(id: "appBackgroundBottom", color: .appBackgroundBottom)
    ]

    var body: some View {
        List(swatches) { swatch in
            HStack(spacing: 12) {
                RoundedRectangle(cornerRadius: 8)
                    .fill(swatch.color)
                    .frame(width: 44, height: 44)
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(.secondary.opacity(0.4)))
                Text(swatch.id)
            }
        }
    }
}

#Preview("Light") {
    ColorSwatchPreview()
        .preferredColorScheme(.light)
}

#Preview("Dark") {
    ColorSwatchPreview()
        .preferredColorScheme(.dark)
}
