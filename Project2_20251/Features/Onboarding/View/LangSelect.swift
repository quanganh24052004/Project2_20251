//
//  LangSelect.swift
//  Project2_20251
//
//  Created by Nguyễn Quang Anh on 27/10/25.
//

import SwiftUI

// MARK: - Model
struct AppLanguage: Identifiable, Equatable {
    let id: String        // mã ngôn ngữ, ví dụ: "en", "vi"
    let name: String      // tên hiển thị
    let flag: String      // emoji cờ
}

// MARK: - Store (UserDefaults)
final class LanguageStore {
    private let key = "app.language"
    func save(_ lang: AppLanguage) { UserDefaults.standard.set(lang.id, forKey: key) }
    func load(all: [AppLanguage], fallback: AppLanguage) -> AppLanguage {
        let id = UserDefaults.standard.string(forKey: key)
        return all.first(where: { $0.id == id }) ?? fallback
    }
}

// MARK: - View
struct LangSelect: View {
    // Danh sách ngôn ngữ hỗ trợ
    private let languages: [AppLanguage] = [
        .init(id: "vi", name: "Tiếng Việt", flag: "🇻🇳"),
        .init(id: "en", name: "English",     flag: "🇬🇧"),
    ]

    private let store = LanguageStore()

    // Chọn mặc định theo thiết bị (nếu trùng), fallback là "vi"
    @State private var selected: AppLanguage

    init() {
        let fallback = AppLanguage(id: "vi", name: "Tiếng Việt", flag: "🇻🇳")
        let deviceCode = Locale.current.language.languageCode?.identifier ?? "vi"
        let all = [
            AppLanguage(id: "vi", name: "Tiếng Việt", flag: "🇻🇳"),
            AppLanguage(id: "en", name: "English",     flag: "🇬🇧"),
        ]
        let store = LanguageStore()
        let saved = store.load(all: all, fallback: fallback)
        let device = all.first(where: { $0.id == deviceCode }) ?? fallback
        _selected = State(initialValue: saved.id == fallback.id ? device : saved)
    }

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                // Tiêu đề
                VStack(spacing: 8) {
                    Text("Chọn ngôn ngữ")
                        .font(.largeTitle.bold())
                        .multilineTextAlignment(.center)
                    Text("Bạn có thể thay đổi trong Cài đặt bất cứ lúc nào.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                        .multilineTextAlignment(.center)
                }
                .padding(.top, 8)

                // Danh sách ngôn ngữ
                VStack(spacing: 0) {
                    ForEach(languages) { lang in
                        Button {
                            selected = lang
                        } label: {
                            HStack(spacing: 12) {
                                Text(lang.flag)
                                    .font(.system(size: 26))
                                    .frame(width: 36, height: 36)

                                Text(lang.name)
                                    .font(.body.weight(.semibold))
                                    .foregroundStyle(.primary)

                                Spacer()

                                Image(systemName: selected == lang ? "checkmark.circle.fill" : "circle")
                                    .font(.system(size: 20, weight: .semibold))
                                    .foregroundStyle(selected == lang ? Color.accentColor : .primary01)
                                    .accessibilityHidden(true)
                            }
                            .padding(.horizontal)
                            .frame(maxWidth: .infinity, minHeight: 56, alignment: .leading)
                            .contentShape(Rectangle())
                        }
                        .buttonStyle(.plain)

                        // Divider between rows
                        if lang.id != languages.last?.id {
                            Divider()
                                .padding(.leading, 36 + 12) // align under text after flag
                        }
                    }
                }
                .clipShape(.rect(cornerRadius: 12, style: .continuous))
                .overlay(
                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                        .strokeBorder(.quaternary, lineWidth: 1)
                )

                // Nút tiếp tục
                Button {
                    store.save(selected)
                    // TODO: Điều hướng sang màn hình tiếp theo
                    // Ví dụ: path.append(Route.onboarding) hoặc set flag đã chọn ngôn ngữ.
                } label: {
                    Text("Tiếp tục")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 14)
                        .background(Color.accentColor)
                        .foregroundStyle(.white)
                        .clipShape(.rect(cornerRadius: 12, style: .continuous))
                }
                .padding(.horizontal)
                .padding(.bottom, 8)
            }
            .padding(.horizontal)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

// MARK: - Preview
#Preview {
    LangSelect()
}
