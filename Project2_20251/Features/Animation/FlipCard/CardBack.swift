//
//  CardBack.swift
//  Project2_20251
//
//  Created by Nguyễn Quang Anh on 18/11/25.
//

import SwiftUI

// 1. Thêm <Content: View>
struct CardBack<Content: View>: View {
    let width: CGFloat
    let height: CGFloat
    @Binding var degree: Double
    
    // 2. Closure @ViewBuilder để nhận nội dung
    let content: Content
    
    // 3. Cập nhật init
    init(width: CGFloat, height: CGFloat, degree: Binding<Double>, @ViewBuilder content: () -> Content) {
        self.width = width
        self.height = height
        self._degree = degree
        self.content = content()
    }

    var body: some View {
        ZStack {
            // Viền ngoài
            RoundedRectangle(cornerRadius: 20)
                .stroke(.blue.opacity(0.7), lineWidth: 3)
                .frame(width: width, height: height)

            // Nền nhạt
            RoundedRectangle(cornerRadius: 20)
                .fill(.blue.opacity(0.2))
                .frame(width: width, height: height)
                .shadow(color: .gray, radius: 2, x: 0, y: 0)

            // Layer trong
            RoundedRectangle(cornerRadius: 20)
                .fill(.blue.opacity(0.7))
                .padding()
                .frame(width: width, height: height)

            RoundedRectangle(cornerRadius: 20)
                .stroke(.blue.opacity(0.7), lineWidth: 3)
                .padding()
                .frame(width: width, height: height)

            // 4. Hiển thị nội dung đã được truyền vào
            //    (Thay vì dùng các Image("seal"))
            content
        }
        .rotation3DEffect(.degrees(degree), axis: (x: 0, y: 1, z: 0))
    }
}
