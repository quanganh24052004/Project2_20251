//
//  SettingsView.swift
//  Project2_20251
//
//  Created by Nguyễn Quang Anh on 13/10/25.
//
import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationStack {
            List {
                Section {
                    NavigationLink {
                        AccountInfoView()
                    } label: {
                        Label("Thông tin tài khoản", systemImage: "person.circle")
                    }

                    NavigationLink {
                        StudentGroupView()
                    } label: {
                        Label("Group học viên", systemImage: "person.3")
                    }

                    NavigationLink {
                        FAQView()
                    } label: {
                        Label("Câu hỏi thường gặp", systemImage: "questionmark.circle")
                    }

                    NavigationLink {
                        AdminChatView()
                    } label: {
                        Label("Chat với admin", systemImage: "bubble.left.and.bubble.right")
                    }

                    NavigationLink {
                        TermsOfUseView()
                    } label: {
                        Label("Điều khoản sử dụng", systemImage: "doc.text")
                    }

                    NavigationLink {
                        OtherSettingsView()
                    } label: {
                        Label("Cài đặt khác", systemImage: "gearshape")
                    }
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Cài đặt")
        }
    }
}

// MARK: - Destination Placeholders
struct AccountInfoView: View {
    var body: some View {
        VStack(spacing: 16) {
            Text("Thông tin tài khoản")
                .font(.headline)
            Text("(Placeholder)")
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemBackground))
    }
}

struct StudentGroupView: View {
    var body: some View {
        VStack(spacing: 16) {
            Text("Group học viên")
                .font(.headline)
            Text("(Placeholder)")
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemBackground))
    }
}

struct FAQView: View {
    var body: some View {
        VStack(spacing: 16) {
            Text("Câu hỏi thường gặp")
                .font(.headline)
            Text("(Placeholder)")
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemBackground))
    }
}

struct AdminChatView: View {
    var body: some View {
        VStack(spacing: 16) {
            Text("Chat với admin")
                .font(.headline)
            Text("(Placeholder)")
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemBackground))
    }
}

struct OtherSettingsView: View {
    var body: some View {
        VStack(spacing: 16) {
            Text("Cài đặt khác")
                .font(.headline)
            Text("(Placeholder)")
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemBackground))
    }
}

#Preview {
    NavigationStack { SettingsView() }
}
