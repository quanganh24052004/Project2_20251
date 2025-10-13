//
//  TermsOfUseView.swift
//  Project2_20251
//
//  Created by Nguyễn Quang Anh on 13/10/25.
//
import SwiftUI

struct TermsOfUseView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var showIntro = true
    @State private var showOwnership = true
    @State private var showAccount = true
    @State private var showUserRights = true
    @State private var showPrivacy = true
    @State private var showLiability = true
    @State private var showUpdates = true
    @State private var showContact = true
    @State private var showEffect = true
    @State private var agreed = false

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {

                    // Header
                    VStack(alignment: .leading, spacing: 6) {
                        Text("ĐIỀU KHOẢN SỬ DỤNG ỨNG DỤNG HỌC TIẾNG ANH")
                            .font(.title2).bold()
                        Text("Cập nhật lần cuối: 13/10/2025")
                            .font(.footnote)
                            .foregroundStyle(.secondary)
                    }
                    .padding(.bottom, 8)

                    // Intro
                    DisclosureGroup(isExpanded: $showIntro) {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("""
Ứng dụng học tiếng Anh (“Ứng dụng”) được phát triển với mục đích hỗ trợ người dùng học và ôn tập từ vựng, luyện phát âm, và cải thiện kỹ năng tiếng Anh thông qua các bài học, trò chơi và công cụ học tập.

Việc bạn cài đặt, đăng ký tài khoản hoặc sử dụng Ứng dụng đồng nghĩa với việc bạn đồng ý tuân thủ các điều khoản dưới đây.
""")
                        }
                        .padding(.top, 8)
                    } label: {
                        TermHeader(number: "1", title: "Giới thiệu", sf: "info.circle")
                    }

                    // Ownership
                    DisclosureGroup(isExpanded: $showOwnership) {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("""
Toàn bộ nội dung, mã nguồn, thiết kế, hình ảnh, biểu tượng, âm thanh và dữ liệu trên Ứng dụng thuộc quyền sở hữu của Nhóm phát triển ứng dụng học tiếng Anh hoặc các bên cấp phép hợp pháp.

Người dùng không được sao chép, chỉnh sửa, tái phân phối hoặc sử dụng vào mục đích thương mại nếu chưa được phép bằng văn bản.
""")
                        }
                        .padding(.top, 8)
                    } label: {
                        TermHeader(number: "2", title: "Quyền sở hữu", sf: "shield.lefthalf.filled")
                    }

                    // Account
                    DisclosureGroup(isExpanded: $showAccount) {
                        VStack(alignment: .leading, spacing: 8) {
                            bullet("Cung cấp thông tin chính xác khi đăng ký (nếu có).")
                            bullet("Tự chịu trách nhiệm bảo mật thông tin đăng nhập.")
                            bullet("Ứng dụng có quyền tạm khóa hoặc xóa tài khoản nếu phát hiện vi phạm, gian lận, hoặc gây hại.")
                        }
                        .padding(.top, 8)
                    } label: {
                        TermHeader(number: "3", title: "Đăng ký và sử dụng tài khoản", sf: "person.crop.circle.badge.checkmark")
                    }

                    // User rights & obligations
                    DisclosureGroup(isExpanded: $showUserRights) {
                        VStack(alignment: .leading, spacing: 10) {
                            Text("**Người dùng được phép:**")
                            bullet("Truy cập, học và ôn tập nội dung do Ứng dụng cung cấp.")
                            bullet("Lưu trữ dữ liệu học tập cá nhân trên thiết bị hoặc tài khoản đăng nhập.")
                            Divider()
                            Text("**Người dùng không được phép:**")
                            bullet("Chia sẻ nội dung phản cảm, bạo lực, vi phạm pháp luật hoặc bản quyền.")
                            bullet("Cố ý phá hoại, can thiệp hệ thống, hoặc truy cập dữ liệu trái phép.")
                        }
                        .padding(.top, 8)
                    } label: {
                        TermHeader(number: "4", title: "Quyền và nghĩa vụ của người dùng", sf: "list.bullet.clipboard")
                    }

                    // Privacy
                    DisclosureGroup(isExpanded: $showPrivacy) {
                        VStack(alignment: .leading, spacing: 8) {
                            bullet("Ứng dụng có thể thu thập dữ liệu ẩn danh (ví dụ: số lượng bài học, thời gian ôn tập) để cải thiện trải nghiệm.")
                            bullet("Nếu có tài khoản, một số thông tin cá nhân (email, tên hiển thị) sẽ được lưu trữ an toàn.")
                            bullet("Không chia sẻ thông tin cá nhân cho bên thứ ba trừ khi có yêu cầu pháp luật hoặc được bạn đồng ý.")
                            bullet("Bạn có thể yêu cầu xóa dữ liệu cá nhân qua email hỗ trợ.")
                        }
                        .padding(.top, 8)
                    } label: {
                        TermHeader(number: "5", title: "Dữ liệu và quyền riêng tư", sf: "lock.shield")
                    }

                    // Liability
                    DisclosureGroup(isExpanded: $showLiability) {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("""
Ứng dụng được cung cấp “như hiện có” (as-is). Nhóm phát triển không chịu trách nhiệm về thiệt hại phát sinh do:
""")
                            bullet("Lỗi thiết bị, kết nối mạng, hoặc gián đoạn dịch vụ từ phía người dùng.")
                            bullet("Việc áp dụng sai thông tin học tập hoặc ngoài phạm vi học thuật.")
                        }
                        .padding(.top, 8)
                    } label: {
                        TermHeader(number: "6", title: "Giới hạn trách nhiệm", sf: "exclamationmark.triangle")
                    }

                    // Updates
                    DisclosureGroup(isExpanded: $showUpdates) {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("""
Nhóm phát triển có thể cập nhật nội dung, tính năng hoặc điều khoản bất kỳ lúc nào. Bạn nên thường xuyên kiểm tra phiên bản mới nhất trong “Cài đặt → Chính sách & Điều khoản”.
""")
                        }
                        .padding(.top, 8)
                    } label: {
                        TermHeader(number: "7", title: "Cập nhật và sửa đổi", sf: "arrow.triangle.2.circlepath")
                    }

                    // Contact
                    DisclosureGroup(isExpanded: $showContact) {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("📧 Email hỗ trợ: **support@englishapp.vn**")
                            Text("🌐 Website: **https://englishapp.vn** (hoặc domain của bạn)")
                        }
                        .padding(.top, 8)
                    } label: {
                        TermHeader(number: "8", title: "Liên hệ", sf: "envelope")
                    }

                    // Effectiveness
                    DisclosureGroup(isExpanded: $showEffect) {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("""
Điều khoản có hiệu lực kể từ khi bạn cài đặt hoặc sử dụng Ứng dụng. Bằng việc tiếp tục sử dụng, bạn xác nhận đã đọc, hiểu và đồng ý với toàn bộ điều khoản.
""")
                        }
                        .padding(.top, 8)
                    } label: {
                        TermHeader(number: "9", title: "Hiệu lực", sf: "checkmark.seal")
                    }

                    // Agree toggle (tuỳ chọn)
                    Toggle(isOn: $agreed) {
                        Text("Tôi đã đọc và đồng ý với Điều khoản sử dụng")
                    }
                    .padding(.top, 12)

                    Button {
                        dismiss()
                    } label: {
                        Text(agreed ? "Đóng" : "Đã hiểu")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.blue)
                }
                .padding(16)
            }
            .navigationTitle("Chính sách & Điều khoản")
            .navigationBarTitleDisplayMode(.inline)
        }
    }

    // MARK: - Helpers
    @ViewBuilder
    private func bullet(_ text: String) -> some View {
        HStack(alignment: .top, spacing: 8) {
            Text("•")
            Text(text)
        }
    }
}

private struct TermHeader: View {
    let number: String
    let title: String
    let sf: String

    var body: some View {
        HStack(spacing: 10) {
            Text(number).font(.headline).bold()
                .frame(width: 28, height: 28)
                .background(Color.blue.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
            Image(systemName: sf)
                .imageScale(.medium)
                .foregroundStyle(.blue)
            Text(title).bold()
            Spacer()
        }
        .padding(.vertical, 6)
    }
}
