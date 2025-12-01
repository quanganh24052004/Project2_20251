//
//  FlipCardView.swift
//  Project2_20251
//
//  Created by Nguyễn Quang Anh on 18/11/25.
//

import SwiftUI

// 1. Thêm <FrontContent: View, BackContent: View>
struct FlipCardView<FrontContent: View, BackContent: View>: View {
    // MARK: - State
    @State private var backDegree: Double = 0
    @State private var frontDegree: Double = -90
    @State private var isFlipped: Bool = false

    // MARK: - Properties (Không còn là Constant)
    let width: CGFloat
    let height: CGFloat
    private let durationAndDelay: Double = 0.3
    
    // 2. Thuộc tính để giữ nội dung
    let front: FrontContent
    let back: BackContent
    
    // 3. Cập nhật init
    init(width: CGFloat = 300, height: CGFloat = 450, @ViewBuilder front: () -> FrontContent, @ViewBuilder back: () -> BackContent) {
        self.width = width
        self.height = height
        self.front = front()
        self.back = back()
    }

    // MARK: - Flip Function (Giữ nguyên)
    private func flipCard() {
        isFlipped.toggle()
        if isFlipped {
            withAnimation(.linear(duration: durationAndDelay)) {
                backDegree = 90
            }
            withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)) {
                frontDegree = 0
            }
        } else {
            withAnimation(.linear(duration: durationAndDelay)) {
                frontDegree = -90
            }
            withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)) {
                backDegree = 0
            }
        }
    }

    // MARK: - Body
    var body: some View {
        ZStack {
            // 4. Truyền nội dung vào CardFront
            CardFront(width: width, height: height, degree: $frontDegree) {
                front // Truyền vào đây
            }
            
            // 5. Truyền nội dung vào CardBack
            CardBack(width: width, height: height, degree: $backDegree) {
                back // Truyền vào đây
            }
        }
        .onTapGesture {
            flipCard()
        }
    }
}

#Preview {
    // Cập nhật Preview để chạy
    FlipCardView() {
        // Mặt trước
        Text("Hello")
            .font(.largeTitle)
            .foregroundStyle(.black)
    } back: {
        // Mặt sau
        Text("Xin chào")
            .font(.largeTitle)
            .foregroundStyle(.white)
    }
}
