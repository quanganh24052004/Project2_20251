//
//  ReasonsScreenView.swift
//  Project2_20251
//
//  Created by Nguyễn Quang Anh on 23/10/25.
//
import SwiftUI

struct ReasonsScreenView: View {
    let config: ReasonsScreenConfig
    let onSelect: (OptionItem) -> Void

    var body: some View {
        ReasonsBaseView(title: config.title) {
            SpeechCardView(text: config.prompt)
            ScrollView {
                VStack(spacing: 14) {
                    ForEach(config.options) { item in
                        OptionCardView(item: item) {
                            onSelect(item)
                        }
                        .background(Color.clear)
                        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                        .contentShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                    }
                }
                .padding(.horizontal, Theme.padding)
                .padding(.vertical, 12)
            }
        }
    }
}
