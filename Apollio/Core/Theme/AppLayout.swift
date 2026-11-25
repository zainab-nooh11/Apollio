//
//  AppLayout.swift
//  Apollio
//
//  Created by Zainab Nooh on 25/11/2026.
//

//
//  AppLayout.swift
//  Apollio
//

import SwiftUI

/// Shared spacing values.
enum AppSpacing {
    static let small: CGFloat = 8
    static let medium: CGFloat = 16
    static let large: CGFloat = 24
    static let extraLarge: CGFloat = 32
}

/// Shared corner radii, taken from the Figma design. Buttons use Capsule() instead.
enum AppRadius {
    static let field: CGFloat = 16
    static let card: CGFloat = 24
}

/// Shared layout limits.
enum AppLayout {
    /// Keeps content readable on iPad instead of stretching across the whole screen.
    static let maxContentWidth: CGFloat = 600
}
