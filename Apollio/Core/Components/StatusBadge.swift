//
//  StatusBadge.swift
//  Apollio
//
//  Created by Zainab Nooh on 26/11/2026.
//

import SwiftUI

/// Pill with a dot and label (Figma: Status / Live, Draft, Waiting, Completed).
struct StatusBadge: View {
    enum Style {
        case live, draft, waiting, completed
        // Admin statuses reuse the four Figma styles.
        case active, open, reported, suspended, removed

        var title: String { String(describing: self).capitalized }

        /// Dot and tint color.
        var accent: Color {
            switch self {
            case .live, .active: .statusLive
            case .draft, .open: .statusDraft
            case .waiting, .reported, .suspended: .statusWaiting
            case .completed, .removed: .statusCompleted
            }
        }

        /// Text color (darker than the dot in light mode for contrast).
        var text: Color {
            switch self {
            case .live, .active: .statusLiveText
            case .draft, .open: .statusDraftText
            case .waiting, .reported, .suspended: .statusWaitingText
            case .completed, .removed: .statusCompletedText
            }
        }
    }

    let style: Style

    var body: some View {
        HStack(spacing: 5) {
            Circle().fill(style.accent).frame(width: 6, height: 6)
            Text(style.title)
                .font(.caption.weight(.medium))
                .foregroundStyle(style.text)
        }
        .padding(.leading, 8)
        .padding(.trailing, 10)
        .padding(.vertical, 4)
        .background(RoundedRectangle(cornerRadius: 12).fill(style.accent.opacity(0.14)))
        .accessibilityElement(children: .combine)
    }
}
