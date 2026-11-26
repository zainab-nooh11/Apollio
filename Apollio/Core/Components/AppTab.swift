//
//  AppTab.swift
//  Apollio
//
//  Created by Zainab Nooh on 26/11/2026.
//

import SwiftUI

/// The four bottom tabs from the Figma tab bar: Home, Play, Create Quiz, Profile.
enum AppTab: String, CaseIterable, Identifiable, Hashable {
    case home, play, createQuiz, profile

    var id: String { rawValue }

    var title: String {
        switch self {
        case .home: "Home"
        case .play: "Play"
        case .createQuiz: "Create Quiz"
        case .profile: "Profile"
        }
    }

    /// Outline symbols as in Figma. The native tab bar fills the selected one automatically.
    var systemImage: String {
        switch self {
        case .home: "house"
        case .play: "gamecontroller"
        case .createQuiz: "plus.circle"
        case .profile: "person"
        }
    }
}
