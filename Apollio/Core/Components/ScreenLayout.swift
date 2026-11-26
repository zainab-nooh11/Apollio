//
//  ScreenLayout.swift
//  Apollio
//
//  Created by Zainab Nooh on 26/11/2026.
//

import SwiftUI

extension View {
    /// App gradient background (Figma: top, 55% mid stop, bottom). Apply to the root of every screen.
    func appScreenBackground() -> some View {
        background(
            LinearGradient(
                stops: [
                    .init(color: .appBackgroundTop, location: 0),
                    .init(color: .appBackgroundMid, location: 0.55),
                    .init(color: .appBackgroundBottom, location: 1)
                ],
                startPoint: .top, endPoint: .bottom
            )
            .ignoresSafeArea()
        )
    }

    /// Centres content and limits its width so screens look right on iPad.
    func readableContentWidth() -> some View {
        frame(maxWidth: AppLayout.maxContentWidth)
            .frame(maxWidth: .infinity)
    }

    /// Soft card shadow from Figma. Stronger black in dark mode so it stays visible.
    func appCardShadow() -> some View { modifier(AppShadowModifier(radius: 16, y: 4, opacity: 0.12)) }

    /// Shadow under primary buttons.
    func appButtonShadow() -> some View { modifier(AppShadowModifier(radius: 12, y: 4, opacity: 0.28)) }
}

private struct AppShadowModifier: ViewModifier {
    let radius: CGFloat
    let y: CGFloat
    let opacity: Double
    @Environment(\.colorScheme) private var scheme

    func body(content: Content) -> some View {
        content.shadow(
            color: scheme == .light
                ? Color(red: 0.12, green: 0.24, blue: 0.32).opacity(opacity)
                : Color.black.opacity(0.35),
            radius: radius, x: 0, y: y
        )
    }
}
