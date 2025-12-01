//
//  LoginView.swift
//  Project2_20251
//
//  Created by Nguyễn Quang Anh on 30/10/25.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 0) {
                    
                    // --- Header ---
                    HeaderView()
                        .padding(.top, AppConstants.defaultSpacing)
                        .padding(.bottom, AppConstants.largeSpacing)

                    // --- Form ---
                    VStack(spacing: AppConstants.defaultSpacing) {
                        
                        FormFieldView(label: "Email Address") {
                            InputView(
                                text: $email,
                                placeholder: "Enter email",
                                isSecureField: false
                            )
                            .keyboardType(.emailAddress)
                            .textInputAutocapitalization(.never)
                        }
                        
                        FormFieldView(label: "Password") {
                            InputView(
                                text: $password,
                                placeholder: "Enter password",
                                isSecureField: true
                            )
                        }
                        
                        ForgotPasswordButton()
                        
                        PrimaryButton(title: "Đăng nhập") {
                            print("Email: \(email)")
                            print("Password: \(password)")
                        }
                    }
                    .padding(.horizontal, AppConstants.screenPadding)
                    
                    // --- Divider ---
                    OrDividerView()
                        .padding(.vertical, AppConstants.defaultSpacing)
                        .padding(.horizontal, AppConstants.screenPadding)
                    
                    // --- Socials ---
                    SocialLoginView()
                        .padding(.horizontal, AppConstants.screenPadding)
                    
                    // --- Sign Up ---
                    SignUpNavigation()
                        .padding(.vertical, AppConstants.defaultSpacing)

                }
            }
            .background(Color.neutral01)
            .navigationBarHidden(true) // Ẩn thanh Navigation
        }
    }
    
    // MARK: - View Con (Tách biệt logic)

    // --- Header (Logo & Tiêu đề) ---
    private struct HeaderView: View {
        var body: some View {
            VStack(spacing: AppConstants.mediumSpacing) { // Dùng hằng số
                Image("img_login")
                    .resizable()
                    .scaledToFit()
                    .frame(width: AppConstants.logoSize, height: AppConstants.logoSize)
                
                Text("For free, join now and \n start learning")
                    .lineLimit(2)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 22))
                    .fontWeight(.medium)
            }
            .padding(.horizontal, 56) // Padding này có thể giữ lại nếu nó là đặc thù
        }
    }
    
    // --- Nút Quên mật khẩu ---
    private struct ForgotPasswordButton: View {
        var body: some View {
            Button(action: { /* TODO: Forgot Password */ }) {
                Text("Forgot Password")
                    .font(.system(size: 15))
                    .fontWeight(.medium)
                    .foregroundColor(Color.error02)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.bottom, AppConstants.smallSpacing) // Thay cho padding 8
        }
    }
    
    // --- Nút Login ---
    private struct LoginButton: View {
        var body: some View {
            Button(action: { /* TODO: Login Action */ }) {
                Text("Login")
                    .font(.system(size: 20))
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    .frame(height: AppConstants.buttonHeight) // Dùng hằng số
                    .foregroundStyle(Color.white)
                    .background(Color.primary01)
                    .cornerRadius(AppConstants.cornerRadius) // Dùng hằng số
            }
        }
    }
    
    // --- Đường kẻ "Or" ---
    private struct OrDividerView: View {
        var body: some View {
            HStack(spacing: AppConstants.mediumSpacing) {
                // --- 5. Cách làm Divider sạch hơn ---
                Color.neutral08.frame(height: AppConstants.dividerHeight)
                
                Text("Or")
                    .font(.system(size: 15))
                    .fontWeight(.medium)
                    .foregroundColor(Color.neutral08)
                
                Color.neutral08.frame(height: AppConstants.dividerHeight)
            }
        }
    }
    
    // --- Nút Social (Facebook, Google) ---
    private struct SocialLoginView: View {
        var body: some View {
            HStack(spacing: AppConstants.mediumSpacing) {
                // --- 6. Tái sử dụng Social Button ---
                SocialButton(imageName: .imgFacebook) {
                    // TODO: Login Facebook
                }
                
                SocialButton(imageName: .imgGoogle) {
                    // TODO: Login Google
                }
            }
        }
    }

    // --- 6. View SocialButton (Tái sử dụng) ---
    private struct SocialButton: View {
        let imageName: ImageResource // Dùng ImageResource (hoặc String)
        let action: () -> Void
        
        var body: some View {
            Button(action: action) {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 24) // Chỉ cần set height cho ảnh
                    .frame(maxWidth: .infinity, maxHeight: .infinity) // Căn giữa ảnh
            }
            .frame(height: AppConstants.buttonHeight)
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .cornerRadius(AppConstants.cornerRadius)
            .overlay(
                RoundedRectangle(cornerRadius: AppConstants.cornerRadius)
                    .stroke(Color.neutral08, lineWidth: 1) // Thêm border cho rõ
            )
        }
    }
    
    // --- Link tới màn Đăng ký ---
    private struct SignUpNavigation: View {
        var body: some View {
            HStack(spacing: 4) { // Giảm spacing
                Text("Not you member?")
                    .font(.system(size: 17))
                    .fontWeight(.regular)
                
                NavigationLink(destination: SignUpView()) {
                    Text("Sign up")
                        .font(.system(size: 17))
                        .fontWeight(.medium)
                        .foregroundColor(Color.primary01) // Làm nổi bật link
                }
            }
        }
    }
}

// --- 7. Sửa CustomTextFieldStyle dùng `makeBody` ---
struct CustomTextFieldStyle: TextFieldStyle {
    public func _body (configuration: TextField<Self._Label>) -> some View {
        return configuration
            .padding(.horizontal, 20)
            .padding(.vertical, 18)
            .background(Color.white)
            .cornerRadius(16)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(lineWidth: 2)
                    .foregroundColor(.primary01)
            )
            .contentShape(RoundedRectangle(cornerRadius: 16))

    }
}
#Preview {
    LoginView()
}
