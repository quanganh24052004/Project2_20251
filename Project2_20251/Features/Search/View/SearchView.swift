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
            Text("Tìm kiếm từ vựng Anh - Việt, Việt - Anh")
                .font(.headline)
            Text("(Placeholder)")
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemBackground))
    }
}
