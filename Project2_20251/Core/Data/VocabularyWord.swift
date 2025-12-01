//
//  này.swift
//  Project2_20251
//
//  Created by Nguyễn Quang Anh on 18/11/25.
//


import SwiftUI

// MARK: - 1. Data Model
// (Bạn có thể đặt struct này trong file riêng)
struct VocabularyWord: Identifiable, Hashable {
    let id = UUID()
    let front: String // Từ tiếng Anh
    let back: String  // Nghĩa tiếng Việt
}

// MARK: - 2. Mock Data
// (Dữ liệu giả 10 thẻ)
fileprivate var cardDeck: [VocabularyWord] = [
    VocabularyWord(front: "Hello", back: "Xin chào"),
    VocabularyWord(front: "World", back: "Thế giới"),
    VocabularyWord(front: "SwiftUI", back: "Framework của Apple"),
    VocabularyWord(front: "View", back: "Giao diện"),
    VocabularyWord(front: "State", back: "Trạng thái"),
    VocabularyWord(front: "Button", back: "Nút bấm"),
    VocabularyWord(front: "Loop", back: "Vòng lặp"),
    VocabularyWord(front: "Next", back: "Tiếp theo"),
    VocabularyWord(front: "Card", back: "Thẻ"),
    VocabularyWord(front: "Vocabulary", back: "Từ vựng")
]
