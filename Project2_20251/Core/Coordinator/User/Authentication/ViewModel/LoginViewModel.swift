//
//  LoginViewModel.swift
//  Project2_20251
//
//  Created by Nguyễn Quang Anh on 1/12/25.
//


//
//  LoginViewModel.swift
//  Project2_20251
//
//  Created by Nguyễn Quang Anh on 30/10/25.
//

import SwiftUI
import Combine

class LoginViewModel: ObservableObject {
    // Input Properties
    @Published var email: String = ""
    @Published var password: String = ""
    
    // State Properties
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    // Actions
    func login(authManager: AuthManager) {
        isLoading = true
        errorMessage = nil
        
        // Giả lập call API (Delay 1s)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.isLoading = false
            
            // Validate đơn giản
            guard !self.email.isEmpty, !self.password.isEmpty else {
                self.errorMessage = "Vui lòng nhập đầy đủ thông tin"
                return
            }
            
            print("Đăng nhập thành công với: \(self.email)")
            
            // Cập nhật trạng thái Global
            withAnimation {
                authManager.isLoggedIn = true
            }
        }
    }
    
    func loginWithFacebook() {
        print("Login Facebook")
    }
    
    func loginWithGoogle() {
        print("Login Google")
    }
}
