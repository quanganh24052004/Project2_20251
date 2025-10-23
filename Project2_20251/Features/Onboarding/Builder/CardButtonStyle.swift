//
//  CardButtonStyle.swift
//  Project2_20251
//
//  Created by Nguyễn Quang Anh on 23/10/25.
//
import SwiftUI

struct CardButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background(
                ContainerRelativeShape()
                    .fill(configuration.isPressed ? Color(.secondarySystemBackground) : Color(.systemBackground))
            )
            .overlay(
                ContainerRelativeShape()
                    .strokeBorder(configuration.isPressed ? Color.primary01 : Color.neutral04.opacity(0.9),
                                  lineWidth: configuration.isPressed ? 2 : 1)
            )
            .clipShape(.rect(cornerRadius: Theme.corner, style: .continuous))
            .scaleEffect(configuration.isPressed ? 0.98 : 1)
            .animation(.spring(response: 0.25, dampingFraction: 0.8), value: configuration.isPressed)
    }
}

