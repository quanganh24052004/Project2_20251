//
//  LoginView.swift
//  Project2_20251
//
//  Created by Nguyễn Quang Anh on 30/10/25.
//

import SwiftUI

struct LoginView: View {
    // 1. Kết nối với ViewModel
    @StateObject private var viewModel = LoginViewModel()
    @EnvironmentObject var authManager: AuthManager
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 0) {
                    
                    // --- Header ---
                    LoginHeaderView()
                        .padding(.top, AppConstants.defaultSpacing)
                        .padding(.bottom, AppConstants.largeSpacing)

                    // --- Form Input ---
                    VStack(spacing: AppConstants.defaultSpacing) {
                        
                        FormFieldView(label: "Email Address") {
                            InputView(
                                text: $viewModel.email, // Binding vào ViewModel
                                placeholder: "Enter email",
                                isSecureField: false
                            )
                            .keyboardType(.emailAddress)
                            .textInputAutocapitalization(.never)
                        }
                        
                        FormFieldView(label: "Password") {
                            InputView(
                                text: $viewModel.password, // Binding vào ViewModel
                                placeholder: "Enter password",
                                isSecureField: true
                            )
                        }
                        
                        ForgotPasswordButton()
                        
                        // Hiển thị lỗi nếu có
                        if let error = viewModel.errorMessage {
                            Text(error)
                                .font(.caption)
                                .foregroundColor(.red)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        
                        // Nút Login (có loading)
                        if viewModel.isLoading {
                            ProgressView()
                                .frame(height: AppConstants.buttonHeight)
                        } else {
                            PrimaryButton(title: "Đăng nhập") {
                                viewModel.login(authManager: authManager)
                            }
                        }
                    }
                    .padding(.horizontal, AppConstants.screenPadding)
                    
                    // --- Footer Section ---
                    VStack(spacing: AppConstants.defaultSpacing) {
                        OrDividerView()
                        
                        SocialLoginView(
                            onFacebook: viewModel.loginWithFacebook,
                            onGoogle: viewModel.loginWithGoogle
                        )
                        
                        SignUpNavigation()
                    }
                    .padding(.vertical, AppConstants.defaultSpacing)
                    .padding(.horizontal, AppConstants.screenPadding)
                }
            }
            .background(Color.neutral01)
            .navigationBarHidden(true)
        }
    }
}

// MARK: - Subviews (Được tách ra Extension để gọn Code chính)

// Để tránh xung đột tên với các file khác, nên để private hoặc fileprivate
fileprivate extension LoginView {
    
    struct LoginHeaderView: View {
        var body: some View {
            VStack(spacing: AppConstants.mediumSpacing) {
                Image("img_login")
                    .resizable()
                    .scaledToFit()
                    .frame(width: AppConstants.logoSize, height: AppConstants.logoSize)
                
                Text("For free, join now and \n start learning")
                    .lineLimit(2)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 22, weight: .medium))
            }
            .padding(.horizontal, 56)
        }
    }
    
    struct ForgotPasswordButton: View {
        var body: some View {
            Button(action: { /* TODO */ }) {
                Text("Forgot Password")
                    .font(.system(size: 15, weight: .medium))
                    .foregroundColor(Color.error02)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.bottom, AppConstants.smallSpacing)
        }
    }
    
    struct OrDividerView: View {
        var body: some View {
            HStack(spacing: AppConstants.mediumSpacing) {
                Color.neutral08.frame(height: AppConstants.dividerHeight)
                Text("Or")
                    .font(.system(size: 15, weight: .medium))
                    .foregroundColor(Color.neutral08)
                Color.neutral08.frame(height: AppConstants.dividerHeight)
            }
        }
    }
    
    struct SocialLoginView: View {
        var onFacebook: () -> Void
        var onGoogle: () -> Void
        
        var body: some View {
            HStack(spacing: AppConstants.mediumSpacing) {
                SocialButton(imageName: "img_facebook", action: onFacebook) // Sửa lại String nếu chưa có Resource
                SocialButton(imageName: "img_google", action: onGoogle)
            }
        }
    }
    
    struct SocialButton: View {
        let imageName: String
        let action: () -> Void
        
        var body: some View {
            Button(action: action) {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 24)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .frame(height: AppConstants.buttonHeight)
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .cornerRadius(AppConstants.cornerRadius)
            .overlay(
                RoundedRectangle(cornerRadius: AppConstants.cornerRadius)
                    .stroke(Color.neutral08, lineWidth: 1)
            )
        }
    }
    
    struct SignUpNavigation: View {
        var body: some View {
            HStack(spacing: 4) {
                Text("Not a member?") // Đã sửa lỗi chính tả "Not you member"
                    .font(.system(size: 17))
                    .fontWeight(.regular)
                
                NavigationLink(destination: SignUpView()) {
                    Text("Sign up")
                        .font(.system(size: 17, weight: .medium))
                        .foregroundColor(Color.primary01)
                }
            }
        }
    }
}

// MARK: - Components Placeholder (Giả lập nếu chưa có file riêng)

#Preview {
    // Cần inject EnvironmentObject để Preview chạy được
    LoginView()
        .environmentObject(AuthManager())
}
