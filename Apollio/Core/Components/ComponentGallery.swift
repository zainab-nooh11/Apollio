//
//  ComponentGallery.swift
//  Apollio
//
//  Created by Zainab Nooh on 26/11/2026.
//

import SwiftUI

private struct ComponentGallery: View {
    @State private var email = ""
    @State private var password = "secret"
    @State private var search = ""
    @State private var selected = "History"

    var body: some View {
        ScrollView {
            VStack(spacing: AppSpacing.medium) {
                PrimaryButton(title: "Login") {}
                PrimaryButton(title: "Loading", isLoading: true) {}
                SecondaryButton(title: "Save Draft") {}
                AppTextField(title: "Email", placeholder: "you@email.com", text: $email,
                             errorMessage: "Email is required")
                AppTextField(title: "Password", placeholder: "Password", text: $password, isSecure: true)
                AppSearchBar(text: $search, placeholder: "Search quizzes")
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(["History", "Science", "Sports"], id: \.self) { c in
                            CategoryChip(title: c, isSelected: selected == c) { selected = c }
                        }
                    }
                }
                HStack { StatCard(value: "5", label: "Streak", systemImage: "flame.fill")
                         StatCard(value: "12", label: "Level", systemImage: "star.fill") }
                AppCard { Text("Bahrain History Quiz").font(.appHeadline) }
                HStack { StatusBadge(style: .live); StatusBadge(style: .draft)
                         StatusBadge(style: .waiting); StatusBadge(style: .completed) }
                ErrorBanner(message: "Invalid email or password")
                EmptyStateView(systemImage: "tray", title: "No challenges yet",
                               message: "Create your first challenge.",
                               actionTitle: "Create Challenge") {}
            }
            .padding(AppSpacing.medium)
            .readableContentWidth()
        }
        .appScreenBackground()
    }
}

#Preview("Light") { ComponentGallery().preferredColorScheme(.light) }
#Preview("Dark") { ComponentGallery().preferredColorScheme(.dark) }
