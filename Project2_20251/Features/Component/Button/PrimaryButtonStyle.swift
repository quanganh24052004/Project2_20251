//
//  PrimaryButtonStyle.swift
//  Project2_20251
//
//  Created by Nguyễn Quang Anh on 27/11/25.
//


import SwiftUI

struct PrimaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            // Màu chữ
            .foregroundStyle(Color.white)
            
            // Nền + bo góc
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.primary01) // màu chủ đạo app
            )
            
            // Shadow giống box-shadow
            .shadow(
                color: Color.primary01.opacity(0.5),
                radius: 0,
                x: 0,
                y: configuration.isPressed ? 0 : 5 // bình thường: 10, nhấn: 0
            )
            
            // Hiệu ứng nhấn xuống
            .offset(y: configuration.isPressed ? 5 : 0)
            
            // Animation mượt
            .animation(.easeInOut(duration: 0.2), value: configuration.isPressed)
    }
}
