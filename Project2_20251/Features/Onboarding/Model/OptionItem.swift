//
//  OptionItem.swift
//  Project2_20251
//
//  Created by Nguyễn Quang Anh on 23/10/25.
//

import Foundation
import SwiftUI

struct OptionItem: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let systemImage: String
    let tint: Color
}

enum ReasonStep: String, CaseIterable, Hashable {
    case reason     // màn 1: lý do học
    case skill      // màn 2: kỹ năng muốn cải thiện
    case intensity  // màn 3: cường độ học
    case track      // màn 4: chọn lộ trình bắt đầu
}

struct ReasonsScreenConfig: Hashable {
    let step: ReasonStep
    let title: String          // "Bước 1/4", "Bước 2/4", ...
    let prompt: String         // nội dung trong SpeechCard
    let options: [OptionItem]  // danh sách OptionCard
}
