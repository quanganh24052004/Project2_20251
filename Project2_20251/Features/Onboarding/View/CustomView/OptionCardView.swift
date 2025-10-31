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

    // Trạng thái ấn (nhấn giữ) dùng GestureState để không giữ state sau khi ngừng chạm
    @GestureState private var isPressed: Bool = false

    var body: some View {
        // Dùng .plain để không bị ButtonStyle can thiệp vào layout
        Button {
            #if canImport(UIKit)
            UIImpactFeedbackGenerator(style: .light).impactOccurred()
            #endif
            action()
        } label: {
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
            .background(
                ContainerRelativeShape()
                    .fill(isPressed ? Color(.secondarySystemBackground) : Color(.systemBackground))
            )
            .overlay(
                ContainerRelativeShape()
                    .strokeBorder(isPressed ? Color.accentColor : Color.secondary.opacity(0.3),
                                  lineWidth: isPressed ? 2 : 1)
            )
            .clipShape(.rect(cornerRadius: Theme.corner, style: .continuous))
            .scaleEffect(isPressed ? 0.98 : 1)
            .animation(.spring(response: 0.25, dampingFraction: 0.8), value: isPressed)
        }
        .buttonStyle(.plain)
        .simultaneousGesture(
            DragGesture(minimumDistance: 0)
                .updating($isPressed) { _, state, _ in
                    state = true
                }
        )
        .contentShape(Rectangle())
        .accessibilityElement(children: .combine)
        .accessibilityLabel(Text(item.title))
    }
}

#Preview {
    OptionCardView(
        item: OptionItem(title: "Sample Option", systemImage: "gearshape.fill", tint: .blue),
        action: {}
    )
}
