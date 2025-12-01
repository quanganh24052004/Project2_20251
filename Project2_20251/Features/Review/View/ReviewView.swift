//
//  ReviewView.swift
//  Project2_20251
//
//  Created by Nguyễn Quang Anh on 13/10/25.
//
import SwiftUI

struct ReviewView: View {
    @EnvironmentObject var authManager: AuthManager
    var body: some View {
        VStack(spacing: 16) {
            Text("Ôn tập")
                .font(.headline)
            Text("Màn hình chính (Placeholder)")
                .foregroundStyle(.secondary)
            Button("Logout") {
                // Logic đăng xuất
                withAnimation {
                    authManager.isLoggedIn = false
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemBackground))
    }
}
