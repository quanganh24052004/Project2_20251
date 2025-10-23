//
//  SelectionView.swift
//  Project2_20251
//
//  Created by Nguyễn Quang Anh on 21/10/25.
//

import SwiftUI

struct SelectionView: View {
    let image: String
    let title: String
    
    var body: some View {
        HStack (spacing: 0) {
            Image(systemName: image)
                .font(.system(size: 24, weight: .semibold))
                .padding(16)
            Text(title)
                .font(.system(size: 18, weight: .semibold))
            Spacer()
        }
        .frame(height: 60)
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(16)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.neutral05, lineWidth: 1)
        )
        .padding()
    }
}

#Preview {
    SelectionView(image: "book", title: "Nội dung hiển thị")
}
