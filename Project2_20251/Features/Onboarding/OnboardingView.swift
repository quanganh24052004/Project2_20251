//
//  OnboardingView.swift
//  Project2_20251
//
//  Created by Nguyễn Quang Anh on 21/10/25.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        VStack (spacing: 0) {
            HStack (spacing: 16) {
                Image("img_hi_capy")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(Rectangle())
                Text("Lý do học tiếng Anh của bạn là gì?")
                    .font(.system(size: 24))
                    .fontWeight(.semibold)
                    .padding(16)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.neutral05, lineWidth: 1)
                    )
            }
            List {
                ForEach([
                    "Giao tiếp công việc",
                    "Du lịch nước ngoài",
                    "Học tập và nghiên cứu",
                    "Thi chứng chỉ (IELTS/TOEIC)",
                    "Xem phim/đọc sách không phụ đề",
                    "Kết bạn quốc tế"
                ], id: \.self) { reason in
                    SelectionView(image: "reason_icon", title: reason)
                        .listRowSeparator(.hidden)
                        .listRowBackground(Color.clear)
                }
            }
            .listStyle(.insetGrouped)
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.neutral02)
    }
}

#Preview {
    OnboardingView()
}

