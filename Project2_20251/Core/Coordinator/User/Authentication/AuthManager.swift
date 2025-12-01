//
//  AppState.swift
//  Project2_20251
//
//  Created by Nguyễn Quang Anh on 1/12/25.
//


//
//  AppState.swift
//
import SwiftUI
import Combine

class AuthManager: ObservableObject {
    // Biến này quyết định đang ở màn hình nào
    @Published var isLoggedIn: Bool = false
}
