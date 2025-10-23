//
//  OptionCardView.swift
//  Project2_20251
//
//  Created by Nguyễn Quang Anh on 23/10/25.
//
import SwiftUI

struct OptionCardView: View {
    var item: OptionItem
    var action: () -> Void

    var body: some View {
        Button(action: {
            #if canImport(UIKit)
            UIImpactFeedbackGenerator(style: .light).impactOccurred()
            #endif
            action()
        }) {
            HStack(spacing: 14) {
                Image(systemName: item.systemImage)
                    .symbolRenderingMode(.palette)
                    .foregroundStyle(item.tint, .primary.opacity(0.25))
                    .font(.system(size: 22, weight: .semibold))
                    .frame(width: 44, height: 44)
                    .background(Circle().fill(.thinMaterial))

                Text(item.title)
                    .font(.body.weight(.semibold))
                    .foregroundStyle(.primary)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)

                Spacer()

                Image(systemName: "chevron.right")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundStyle(.tertiary)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
            .frame(maxWidth: .infinity, minHeight: 72)
        }
        .buttonStyle(CardButtonStyle())
    }
}

#Preview {
    OptionCardView(
        item: OptionItem(title: "Sample Option", systemImage: "gearshape.fill", tint: .blue),
        action: {}
    )
}
