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
            VStack {
                Spacer()

                VStack (spacing: 12) {
                    Image("img_login")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 105, height: 82)
                        
                    Text("For free, join now and \n start learning")
                        .lineLimit(2)
                        .multilineTextAlignment(.center)
                        .font(.system(size: 22))
                        .fontWeight(.medium)
                        .frame(height: 56)
                        .frame(width: .infinity)
                }
                .padding(.horizontal, 56)
                .padding(.top, 24)
                .padding(.bottom, 32)
                
                VStack (spacing: 24) {
                    VStack (spacing: 8) {
                        Text("Email Address")
                            .font(.system(size: 15))
                            .fontWeight(.medium)
                            .frame(height: 20)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        TextField("Enter your email", text: $email)
                            .textFieldStyle(CustomTextFieldStyle())
                    }
                    
                    VStack (spacing: 8) {
                        Text("Password")
                            .font(.system(size: 15))
                            .fontWeight(.medium)
                            .frame(height: 20)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        TextField("Enter your password", text: $password)
                            .textFieldStyle(CustomTextFieldStyle())
                    }
                    
                    Text("Forgot Password")
                        .font(.system(size: 15))
                        .fontWeight(.medium)
                        .foregroundColor(Color.error02)
                        .frame(height: 20)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 8)
                    
                    Button(action: {
                    }) {
                        Text("Login")
                            .font(.system(size: 20))
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity)
                            .frame(height: 56)
                            .foregroundStyle(Color.white)
                            .background(Color.primary01)
                            .cornerRadius(16)
                            .contentShape(RoundedRectangle(cornerRadius: 16))
                    }
                    .contentShape(RoundedRectangle(cornerRadius: 16))

                    VStack (spacing: 16) {
                        HStack (spacing: 15) {
                            Rectangle()
                                .frame(maxWidth: .infinity)
                                .frame(height: 0.5)
                                .background(Color.neutral08)
                            
                            Text("Or")
                                .font(.system(size: 15))
                                .fontWeight(.medium)
                                .frame(height: 20)
                                .foregroundColor(Color.neutral08)
                            
                            Rectangle()
                                .frame(maxWidth: .infinity)
                                .frame(height: 0.5)
                                .background(Color.neutral08)
                        }
                        
                        HStack (spacing: 15) {
                            Button(action: {
                            }) {
                                Image(.imgFacebook)
                                    .font(.system(size: 20))
                                    .fontWeight(.medium)
                                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                                    .frame(height: 24)
                                    .foregroundStyle(Color.white)
                            }
                            .frame(height: 56)
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .cornerRadius(16)
                            .contentShape(RoundedRectangle(cornerRadius: 16))
                            
                            Button(action: {
                            }) {
                                Image(.imgGoogle)
                                    .font(.system(size: 20))
                                    .fontWeight(.medium)
                                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                                    .frame(height: 24)
                                    .foregroundStyle(Color.white)
                            }
                            .frame(height: 56)
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .cornerRadius(16)
                            .contentShape(RoundedRectangle(cornerRadius: 16))
                        }
                        HStack (spacing: 0) {
                            Text("Not you member? ")
                                .font(.system(size: 17))
                                .fontWeight(.regular)
                                .frame(height: 22)
                            NavigationLink(destination: SignUpView()) {
                                Text("Sign up")
                                    .font(.system(size: 17))
                                    .fontWeight(.medium)
                                    .frame(height: 22)
                            }
                        }
                    }
                    
                }
                .padding(.horizontal, 24)
                
                Spacer()
            }
            .background(Color.neutral01)
        }
    
    }
}

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
