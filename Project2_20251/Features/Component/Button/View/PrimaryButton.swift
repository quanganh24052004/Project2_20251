//
//  PrimaryButton.swift
//  Project2_20251
//
//  Created by Nguyễn Quang Anh on 27/11/25.
//
import SwiftUI

struct PrimaryButton: View {
    let title: String
    let action: () -> Void
    var fullWidth: Bool = true   // mặc định fill ngang, có thể tắt nếu muốn
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 17, weight: .semibold))
                .frame(maxWidth: fullWidth ? .infinity : nil)
                .frame(height: 56)
        }
        .buttonStyle(PrimaryButtonStyle())
    }
}

