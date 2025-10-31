//
//  SpeechCardView.swift
//  Project2_20251
//
//  Created by Nguyễn Quang Anh on 23/10/25.
//
import SwiftUI

struct SpeechCardView: View {
    var text: String
    var mascot: Image = Image(systemName: "face.smiling")

    var body: some View {
        HStack(spacing: 12) {
            mascot
                .resizable().scaledToFit()
                .frame(width: 64, height: 64)
                .padding(.top, 4)

            Text(text)
                .font(.title3.weight(.semibold))
                .foregroundStyle(.primary)
                .multilineTextAlignment(.leading)
                .fixedSize(horizontal: false, vertical: true)

            Spacer(minLength: 0)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 16)
        .background(ContainerRelativeShape().fill(.background))
        .overlay(
            ContainerRelativeShape()
                .strokeBorder(.separator, lineWidth: 1)
        )
        .clipShape(.rect(cornerRadius: Theme.corner, style: .continuous))
        .padding(.horizontal, Theme.padding)
    }
}

#Preview {
    SpeechCardView(text: "Xin chào", mascot: Image(systemName: "face.smiling"))
}
