//
//  CardFront.swift
//  Project2_20251
//
//  Created by Nguyễn Quang Anh on 18/11/25.
//

import SwiftUI

// 1. Thêm <Content: View> để nhận một View bất kỳ
struct CardFront<Content: View>: View {
    let width: CGFloat
    let height: CGFloat
    @Binding var degree: Double
    
    // 2. Một closure @ViewBuilder để nhận nội dung
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
            RoundedRectangle(cornerRadius: 20)
                .fill(.white)
                .frame(width: width, height: height)
                .shadow(color: .gray, radius: 2, x: 0, y: 0)

            // 4. Hiển thị nội dung đã được truyền vào
            //    (Thay vì dùng Image("suit.club.fill"))
            content
        }
        .rotation3DEffect(.degrees(degree), axis: (x: 0, y: 1, z: 0))
    }
}
