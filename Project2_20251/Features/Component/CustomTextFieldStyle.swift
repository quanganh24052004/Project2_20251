//
//  CustomTextFieldStyle.swift
//  Project2_20251
//
//  Created by Nguyễn Quang Anh on 1/12/25.
//
import SwiftUI

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
