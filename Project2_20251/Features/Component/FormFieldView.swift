//
//  FormFieldView.swift
//  Project2_20251
//
//  Created by Nguyễn Quang Anh on 1/12/25.
//
import SwiftUI

private enum Constants {
    static let smallSpacing: CGFloat = 8
}

struct FormFieldView<Content: View>: View {
    let label: String
    @ViewBuilder let content: Content

    var body: some View {
        VStack(spacing: 8) {
            Text(label)
                .font(.system(size: 15))
                .fontWeight(.medium)
                .foregroundColor(.black)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            content
        }
    }
}
