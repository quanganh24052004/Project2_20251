//
//  SearchView.swift
//  Project2_20251
//
//  Created by Nguyễn Quang Anh on 13/10/25.
//
import SwiftUI

struct SearchView: View {
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                TextField("Tìm kiếm", text: .constant(""))
                    .foregroundColor(.primary)
                    .frame(height: 48)
                    .padding(.horizontal, 8)
                    .background(Color(.systemGray6))
                    .cornerRadius(16)
            }
            .padding(16)
            
            Text("Tìm kiếm từ vựng Anh - Việt, Việt - Anh")
                .font(.headline)
            Text("(Placeholder)")
                .foregroundStyle(.secondary)
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemBackground))
        .padding(16)
    }
}

#Preview {
    SearchView()
}
