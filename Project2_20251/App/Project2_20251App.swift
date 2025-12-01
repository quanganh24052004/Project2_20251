//
//  Project2_20251App.swift
//  Project2_20251
//
//  Created by Nguyễn Quang Anh on 22/9/25.
//

import SwiftUI

@main
struct Project2_20251App: App {
    @StateObject private var authManager = AuthManager()

    var body: some Scene {
        WindowGroup {
            // Logic chuyển đổi màn hình gốc
            if authManager.isLoggedIn {
                RootView()
                    .environmentObject(authManager) // Truyền vào để RootView có thể Logout
            } else {
                LoginView()
                    .environmentObject(authManager) // Truyền vào để LoginView có thể đổi trạng thái
            }
        }
    }
}
