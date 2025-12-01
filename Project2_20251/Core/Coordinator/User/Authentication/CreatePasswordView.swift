//
//  CreatePasswordView.swift
//  Project2_20251
//
//  Created by Nguyễn Quang Anh on 31/10/25.
//

import SwiftUI

struct CreatePasswordView: View {
    @State private var password: String = ""
    @State private var rePassword: String = ""
    var body: some View {
        VStack (spacing: 0) {
            Spacer()
            
            Text("Choose a Password")
                .font(.system(size: 22))
                .fontWeight(.medium)
                .frame(height: 28)
                .frame(width: .infinity)
                .padding(32)
            
            VStack (spacing: 24) {
                VStack (spacing: 8) {
                    Text("Password")
                        .font(.system(size: 15))
                        .fontWeight(.medium)
                        .frame(height: 20)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    TextField("Enter your password", text: $password)
                        .textFieldStyle(CustomTextFieldStyle())
                }
                
                VStack (spacing: 8) {
                    Text("Confirm Password")
                        .font(.system(size: 15))
                        .fontWeight(.medium)
                        .frame(height: 20)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    TextField("Enter your confirm password", text: $rePassword)
                        .textFieldStyle(CustomTextFieldStyle())
                }
                
                Spacer()
                Button(action: {
                    // Chuyển tới màn hình
                }) {
                    Text("Signup")
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
                                .frame(width: 24, height: 24)
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
                        Text("Already you member? ")
                            .font(.system(size: 17))
                            .fontWeight(.regular)
                            .frame(height: 22)
                        NavigationLink(destination: LoginView()) {
                            Text("Sign in")
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

#Preview {
    CreatePasswordView()
}

