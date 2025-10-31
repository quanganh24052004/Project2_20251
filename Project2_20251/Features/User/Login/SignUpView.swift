//
//  SignUpView.swift
//  Project2_20251
//
//  Created by Nguyễn Quang Anh on 31/10/25.
//

import SwiftUI

struct SignUpView: View {
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    
    var body: some View {
        NavigationStack {
            VStack (spacing: 0) {
                Spacer()

                Text("Create an Account")
                    .font(.system(size: 22))
                    .fontWeight(.medium)
                    .frame(height: 28)
                    .frame(width: .infinity)
                    .padding(32)
            
                VStack (spacing: 24) {
                    VStack (spacing: 8) {
                        Text("First name")
                            .font(.system(size: 15))
                            .fontWeight(.medium)
                            .frame(height: 20)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    
                        TextField("Enter your first name", text: $firstName)
                            .textFieldStyle(CustomTextFieldStyle())
                    }
                
                    VStack (spacing: 8) {
                        Text("Last name")
                            .font(.system(size: 15))
                            .fontWeight(.medium)
                            .frame(height: 20)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    
                        TextField("Enter your last name", text: $lastName)
                            .textFieldStyle(CustomTextFieldStyle())
                    }
                
                    VStack (spacing: 8) {
                        Text("Email")
                            .font(.system(size: 15))
                            .fontWeight(.medium)
                            .frame(height: 20)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    
                        TextField("Enter your email", text: $email)
                            .textFieldStyle(CustomTextFieldStyle())
                    }
                    .padding(.bottom, 8)
                
                    Button(action: {
                    }) {
                        Text("Sign Up")
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
        }
        .background(Color.neutral01)
    }
}

#Preview {
    SignUpView()
}
