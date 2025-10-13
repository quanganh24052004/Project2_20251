//
//  LearnView.swift
//  Project2_20251
//
//  Created by Nguyễn Quang Anh on 13/10/25.
//
import SwiftUI

struct LearnView: View {
    var body: some View {
        VStack(spacing: 16) {
            Text("Học từ vựng")
                .font(.headline)
            Text("Danh sách lesson của một course (Placeholder)")
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemBackground))
    }
}
