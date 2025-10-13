//
//  ForumView.swift
//  Project2_20251
//
//  Created by Nguyễn Quang Anh on 13/10/25.
//
import SwiftUI

struct ForumView: View {
    var body: some View {
        VStack(spacing: 16) {
            Text("Diễn đàn")
                .font(.headline)
            Text("(Placeholder)")
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemBackground))
    }
}
