//
//  ReasonsFlowViewModel.swift
//  Project2_20251
//
//  Created by Nguyễn Quang Anh on 23/10/25.
//
import SwiftUI
import Foundation
import Combine

final class ReasonsFlowViewModel: ObservableObject {
    // Điều hướng
    @Published var path: [ReasonStep] = []

    // Lựa chọn của user cho từng bước
    @Published var selections: [ReasonStep: OptionItem] = [:]

    // Cấu hình tất cả các màn (data-driven)
    private(set) var screens: [ReasonStep: ReasonsScreenConfig] = [:]

    init() {
        buildScreens()
    }

    private func buildScreens() {
        screens[.reason] = ReasonsScreenConfig(
            step: .reason,
            title: "Bước 1/4",
            prompt: "Lý do học tiếng Anh của bạn là gì nhỉ?",
            options: [
                .init(title: "Hỗ trợ việc học tập", systemImage: "book.closed.fill", tint: .pink),
                .init(title: "Phát triển sự nghiệp", systemImage: "briefcase.fill", tint: .orange),
                .init(title: "Mình đang sống ở nước ngoài", systemImage: "globe.asia.australia.fill", tint: .green),
                .init(title: "Để giải trí", systemImage: "theatermasks.fill", tint: .purple),
                .init(title: "Khác", systemImage: "ellipsis.circle.fill", tint: .blue),
            ]
        )

        screens[.skill] = ReasonsScreenConfig(
            step: .skill,
            title: "Bước 2/4",
            prompt: "Bạn muốn cải thiện kỹ năng nào trước?",
            options: [
                .init(title: "Nghe (Listening)", systemImage: "ear.fill", tint: .teal),
                .init(title: "Nói (Speaking)", systemImage: "mic.fill", tint: .red),
                .init(title: "Đọc (Reading)", systemImage: "book.fill", tint: .indigo),
                .init(title: "Viết (Writing)", systemImage: "pencil", tint: .brown),
            ]
        )

        screens[.intensity] = ReasonsScreenConfig(
            step: .intensity,
            title: "Bước 3/4",
            prompt: "Cường độ học mong muốn của bạn?",
            options: [
                .init(title: "Nhẹ nhàng • 10 phút/ngày", systemImage: "tortoise.fill", tint: .gray),
                .init(title: "Vừa phải • 20–30 phút/ngày", systemImage: "hare.fill", tint: .green),
                .init(title: "Tập trung • 45–60 phút/ngày", systemImage: "flame.fill", tint: .orange),
            ]
        )

        screens[.track] = ReasonsScreenConfig(
            step: .track,
            title: "Bước 4/4",
            prompt: "Tuyệt! Bạn muốn bắt đầu từ lộ trình nào?",
            options: [
                .init(title: "Từ vựng cơ bản (A1–A2)", systemImage: "textformat.abc", tint: .blue),
                .init(title: "Ngữ pháp nền tảng", systemImage: "text.book.closed", tint: .purple),
                .init(title: "Luyện nghe theo chủ đề", systemImage: "headphones", tint: .pink),
            ]
        )
    }

    func config(for step: ReasonStep) -> ReasonsScreenConfig {
        screens[step] ?? ReasonsScreenConfig(
            step: step,
            title: "",
            prompt: "",
            options: []
        )
    }

    func select(_ option: OptionItem, at step: ReasonStep) {
        selections[step] = option
        advance(from: step)
    }

    private func advance(from step: ReasonStep) {
        switch step {
        case .reason:    path.append(.skill)
        case .skill:     path.append(.intensity)
        case .intensity: path.append(.track)
        case .track:
            // Kết thúc flow, xử lý chuyển scene thật ở đây
            path.removeAll()
            // Ví dụ: gửi selections cho Coordinator/Store/Analytics...
            #if DEBUG
            print("Selections:", selections.mapValues { $0.title })
            #endif
        }
    }

    func reset() {
        selections.removeAll()
        path.removeAll()
    }
}

