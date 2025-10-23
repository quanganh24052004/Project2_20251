//import SwiftUI
//
//// MARK: - Theme
//struct Theme {
//    static let corner: CGFloat = 8
//    static let padding: CGFloat = 16
//}
//
//// MARK: - SpeechCard
//struct SpeechCard: View {
//    var text: String
//    var mascot: Image = Image(systemName: "face.smiling")
//
//    var body: some View {
//        HStack(spacing: 12) {
//            mascot
//                .resizable().scaledToFit()
//                .frame(width: 64, height: 64)
//                .padding(.top, 4)
//
//            Text(text)
//                .font(.title3.weight(.semibold))
//                .foregroundStyle(.primary)
//                .multilineTextAlignment(.leading)
//
//            Spacer(minLength: 0)
//        }
//        .padding(.horizontal, 16)
//        .padding(.vertical, 16)
//        .background(ContainerRelativeShape().fill(.background))
//        .overlay(
//            ContainerRelativeShape()
//                .strokeBorder(.separator, lineWidth: 1)
//        )
//        .clipShape(.rect(cornerRadius: Theme.corner, style: .continuous))
//        .padding(.horizontal, Theme.padding)
//    }
//}
//
//// MARK: - CardButtonStyle
//struct CardButtonStyle: ButtonStyle {
//    func makeBody(configuration: Configuration) -> some View {
//        configuration.label
//            .background(
//                ContainerRelativeShape()
//                    .fill(configuration.isPressed ? Color(.secondarySystemBackground) : Color(.systemBackground))
//            )
//            .overlay(
//                ContainerRelativeShape()
//                    .strokeBorder(configuration.isPressed ? Color.primary01 : Color.neutral04,
//                                  lineWidth: configuration.isPressed ? 2 : 1)
//            )
//            .clipShape(.rect(cornerRadius: Theme.corner, style: .continuous))
//            .scaleEffect(configuration.isPressed ? 0.98 : 1)
//            .animation(.spring(response: 0.25, dampingFraction: 0.8), value: configuration.isPressed)
//    }
//}
//
//// MARK: - OptionCard
//struct OptionCard: View {
//    var title: String
//    var systemImage: String
//    var tint: Color = .accentColor
//    var action: () -> Void
//
//    var body: some View {
//        Button(action: {
//            #if canImport(UIKit)
//            UIImpactFeedbackGenerator(style: .light).impactOccurred()
//            #endif
//            action()
//        }) {
//            HStack(spacing: 14) {
//                Image(systemName: systemImage)
//                    .symbolRenderingMode(.palette)
//                    .foregroundStyle(tint, .primary.opacity(0.25))
//                    .font(.system(size: 22, weight: .semibold))
//                    .frame(width: 44, height: 44)
//                    .background(Circle().fill(.thinMaterial))
//
//                Text(title)
//                    .font(.body.weight(.semibold))
//                    .foregroundStyle(.primary)
//                    .lineLimit(2)
//                    .multilineTextAlignment(.leading)
//
//                Spacer()
//
//                Image(systemName: "chevron.right")
//                    .font(.system(size: 16, weight: .semibold))
//                    .foregroundStyle(.tertiary)
//            }
//            .padding(.horizontal, 16)
//            .padding(.vertical, 12)
//            .frame(maxWidth: .infinity, minHeight: 72)
//        }
//        .buttonStyle(CardButtonStyle())
//    }
//}
//
//// MARK: - Flow Step
//enum ReasonStep: Hashable {
//    case screen1, screen2, screen3, screen4
//}
//
//// MARK: - Screen 1 (màn hiện tại của bạn)
//struct ReasonsScreen1: View {
//    var onSelect: () -> Void
//
//    var body: some View {
//        VStack(spacing: 16) {
//            SpeechCard(text: "Lý do học tiếng Anh của bạn là gì nhỉ?")
//
//            ScrollView {
//                VStack(spacing: 14) {
//                    OptionCard(title: "Hỗ trợ việc học tập", systemImage: "book.closed.fill", tint: .pink) {
//                        onSelect()
//                    }
//                    OptionCard(title: "Phát triển sự nghiệp", systemImage: "briefcase.fill", tint: .orange) {
//                        onSelect()
//                    }
//                    OptionCard(title: "Mình đang sống ở nước ngoài", systemImage: "globe.asia.australia.fill", tint: .green) {
//                        onSelect()
//                    }
//                    OptionCard(title: "Để giải trí", systemImage: "theatermasks.fill", tint: .purple) {
//                        onSelect()
//                    }
//                    OptionCard(title: "Khác", systemImage: "ellipsis.circle.fill", tint: .blue) {
//                        onSelect()
//                    }
//                }
//                .padding(.horizontal, Theme.padding)
//                .padding(.vertical, 12)
//            }
//        }
//        .background(Color(.systemGroupedBackground))
//        .navigationTitle("Bước 1/4")
//        .navigationBarTitleDisplayMode(.inline)
//    }
//}
//
//// MARK: - Screen 2
//struct ReasonsScreen2: View {
//    var onSelect: () -> Void
//
//    var body: some View {
//        VStack(spacing: 16) {
//            SpeechCard(text: "Bạn muốn cải thiện kỹ năng nào trước?")
//
//            ScrollView {
//                VStack(spacing: 14) {
//                    OptionCard(title: "Nghe (Listening)", systemImage: "ear.fill", tint: .teal) {
//                        onSelect()
//                    }
//                    OptionCard(title: "Nói (Speaking)", systemImage: "mic.fill", tint: .red) {
//                        onSelect()
//                    }
//                    OptionCard(title: "Đọc (Reading)", systemImage: "book.pages.fill", tint: .indigo) {
//                        onSelect()
//                    }
//                    OptionCard(title: "Viết (Writing)", systemImage: "pencil.and.scribble", tint: .brown) {
//                        onSelect()
//                    }
//                }
//                .padding(.horizontal, Theme.padding)
//                .padding(.vertical, 12)
//            }
//        }
//        .background(Color(.systemGroupedBackground))
//        .navigationTitle("Bước 2/4")
//        .navigationBarTitleDisplayMode(.inline)
//    }
//}
//
//// MARK: - Screen 3
//struct ReasonsScreen3: View {
//    var onSelect: () -> Void
//
//    var body: some View {
//        VStack(spacing: 16) {
//            SpeechCard(text: "Cường độ học mong muốn của bạn?")
//
//            ScrollView {
//                VStack(spacing: 14) {
//                    OptionCard(title: "Nhẹ nhàng • 10 phút/ngày", systemImage: "tortoise.fill", tint: .gray) {
//                        onSelect()
//                    }
//                    OptionCard(title: "Vừa phải • 20–30 phút/ngày", systemImage: "hare.fill", tint: .green) {
//                        onSelect()
//                    }
//                    OptionCard(title: "Tập trung • 45–60 phút/ngày", systemImage: "flame.fill", tint: .orange) {
//                        onSelect()
//                    }
//                }
//                .padding(.horizontal, Theme.padding)
//                .padding(.vertical, 12)
//            }
//        }
//        .background(Color(.systemGroupedBackground))
//        .navigationTitle("Bước 3/4")
//        .navigationBarTitleDisplayMode(.inline)
//    }
//}
//
//// MARK: - Screen 4 (kết thúc)
//struct ReasonsScreen4: View {
//    var onFinish: () -> Void
//
//    var body: some View {
//        VStack(spacing: 16) {
//            SpeechCard(text: "Tuyệt! Bạn muốn bắt đầu từ lộ trình nào?")
//
//            ScrollView {
//                VStack(spacing: 14) {
//                    OptionCard(title: "Từ vựng cơ bản (A1–A2)", systemImage: "textformat.abc", tint: .blue) {
//                        onFinish()
//                    }
//                    OptionCard(title: "Ngữ pháp nền tảng", systemImage: "text.book.closed.fill", tint: .purple) {
//                        onFinish()
//                    }
//                    OptionCard(title: "Luyện nghe theo chủ đề", systemImage: "headphones", tint: .pink) {
//                        onFinish()
//                    }
//                }
//                .padding(.horizontal, Theme.padding)
//                .padding(.vertical, 12)
//            }
//        }
//        .background(Color(.systemGroupedBackground))
//        .navigationTitle("Bước 4/4")
//        .navigationBarTitleDisplayMode(.inline)
//    }
//}
//
//// MARK: - Flow Container
//struct ReasonsFlow: View {
//    @State private var path: [ReasonStep] = []
//    @State private var showRoot = false
//
//    var body: some View {
//        NavigationStack(path: $path) {
//            ReasonsScreen1 {
//                path.append(.screen2)
//            }
//            .navigationDestination(for: ReasonStep.self) { step in
//                switch step {
//                case .screen1:
//                    ReasonsScreen1 {
//                        path.append(.screen2)
//                    }
//                case .screen2:
//                    ReasonsScreen2 {
//                        path.append(.screen3)
//                    }
//                case .screen3:
//                    ReasonsScreen3 {
//                        path.append(.screen4)
//                    }
//                case .screen4:
//                    ReasonsScreen4 {
//                        path.removeAll()
//                        showRoot = true
//                        // Điều hướng tới RootView sau khi hoàn tất
//                    }
//                }
//            }
//            .fullScreenCover(isPresented: $showRoot) {
//                RootView()
//            }
//        }
//    }
//}
//
//// MARK: - Preview
//#Preview {
//    ReasonsFlow()
//}

import SwiftUI

// MARK: - Theme
struct Theme {
    static let corner: CGFloat = 8
    static let padding: CGFloat = 16
}

// MARK: - SpeechCard
struct SpeechCard: View {
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

// MARK: - CardButtonStyle
//struct CardButtonStyle: ButtonStyle {
//    func makeBody(configuration: Configuration) -> some View {
//        configuration.label
//            .background(
//                ContainerRelativeShape()
//                    .fill(configuration.isPressed ? Color(.secondarySystemBackground) : Color(.systemBackground))
//            )
//            .overlay(
//                ContainerRelativeShape()
//                    .strokeBorder(
//                        configuration.isPressed ? Color.accentColor : Color.secondary.opacity(0.3),
//                        lineWidth: configuration.isPressed ? 2 : 1
//                    )
//            )
//            .clipShape(.rect(cornerRadius: Theme.corner, style: .continuous))
//            .scaleEffect(configuration.isPressed ? 0.98 : 1)
//            .animation(.spring(response: 0.25, dampingFraction: 0.8), value: configuration.isPressed)
//    }
//}

// MARK: - OptionCard
struct OptionCard: View {
    var title: String
    var systemImage: String
    var tint: Color = .accentColor
    var action: () -> Void

    var body: some View {
        Button(action: {
            #if canImport(UIKit)
            UIImpactFeedbackGenerator(style: .light).impactOccurred()
            #endif
            action()
        }) {
            HStack(spacing: 14) {
                Image(systemName: systemImage)
                    .symbolRenderingMode(.palette)
                    .foregroundStyle(tint, .primary.opacity(0.25))
                    .font(.system(size: 22, weight: .semibold))
                    .frame(width: 44, height: 44)
                    .background(Circle().fill(.thinMaterial))

                Text(title)
                    .font(.body.weight(.semibold))
                    .foregroundStyle(.primary)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)

                Spacer()

                Image(systemName: "chevron.right")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundStyle(.tertiary)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
            .frame(maxWidth: .infinity, minHeight: 72)
        }
        .buttonStyle(CardButtonStyle())
    }
}

// MARK: - Base Layout cho mọi màn
struct ReasonsBaseScreen<Content: View>: View {
    let title: String
    @ViewBuilder var content: Content

    var body: some View {
        VStack(spacing: 16) {
            content
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbarBackground(.clear, for: .navigationBar)
    }
}

// MARK: - Screen 1
struct ReasonsScreen1: View {
    var onSelect: () -> Void

    var body: some View {
        ReasonsBaseScreen(title: "Bước 1/4") {
            SpeechCard(text: "Lý do học tiếng Anh của bạn là gì nhỉ?")
            ScrollView {
                VStack(spacing: 14) {
                    OptionCard(title: "Hỗ trợ việc học tập", systemImage: "book.closed.fill", tint: .pink) { onSelect() }
                    OptionCard(title: "Phát triển sự nghiệp", systemImage: "briefcase.fill", tint: .orange) { onSelect() }
                    OptionCard(title: "Mình đang sống ở nước ngoài", systemImage: "globe.asia.australia.fill", tint: .green) { onSelect() }
                    OptionCard(title: "Để giải trí", systemImage: "theatermasks.fill", tint: .purple) { onSelect() }
                    OptionCard(title: "Khác", systemImage: "ellipsis.circle.fill", tint: .blue) { onSelect() }
                }
                .padding(.horizontal, Theme.padding)
                .padding(.vertical, 12)
            }
        }
    }
}

// MARK: - Screen 2
struct ReasonsScreen2: View {
    var onSelect: () -> Void

    var body: some View {
        ReasonsBaseScreen(title: "Bước 2/4") {
            SpeechCard(text: "Bạn muốn cải thiện kỹ năng nào trước?")
            ScrollView {
                VStack(spacing: 14) {
                    OptionCard(title: "Nghe (Listening)", systemImage: "ear.fill", tint: .teal) { onSelect() }
                    OptionCard(title: "Nói (Speaking)", systemImage: "mic.fill", tint: .red) { onSelect() }
                    OptionCard(title: "Đọc (Reading)", systemImage: "book.pages.fill", tint: .indigo) { onSelect() }
                    OptionCard(title: "Viết (Writing)", systemImage: "pencil.and.scribble", tint: .brown) { onSelect() }
                }
                .padding(.horizontal, Theme.padding)
                .padding(.vertical, 12)
            }
        }
    }
}

// MARK: - Screen 3
struct ReasonsScreen3: View {
    var onSelect: () -> Void

    var body: some View {
        ReasonsBaseScreen(title: "Bước 3/4") {
            SpeechCard(text: "Cường độ học mong muốn của bạn?")
            ScrollView {
                VStack(spacing: 14) {
                    OptionCard(title: "Nhẹ nhàng • 10 phút/ngày", systemImage: "tortoise.fill", tint: .gray) { onSelect() }
                    OptionCard(title: "Vừa phải • 20–30 phút/ngày", systemImage: "hare.fill", tint: .green) { onSelect() }
                    OptionCard(title: "Tập trung • 45–60 phút/ngày", systemImage: "flame.fill", tint: .orange) { onSelect() }
                }
                .padding(.horizontal, Theme.padding)
                .padding(.vertical, 12)
            }
        }
    }
}

// MARK: - Screen 4 (Kết thúc)
struct ReasonsScreen4: View {
    var onFinish: () -> Void

    var body: some View {
        ReasonsBaseScreen(title: "Bước 4/4") {
            SpeechCard(text: "Tuyệt! Bạn muốn bắt đầu từ lộ trình nào?")
            ScrollView {
                VStack(spacing: 14) {
                    OptionCard(title: "Từ vựng cơ bản (A1–A2)", systemImage: "textformat.abc", tint: .blue) { onFinish() }
                    OptionCard(title: "Ngữ pháp nền tảng", systemImage: "text.book.closed.fill", tint: .purple) { onFinish() }
                    OptionCard(title: "Luyện nghe theo chủ đề", systemImage: "headphones", tint: .pink) { onFinish() }
                }
                .padding(.horizontal, Theme.padding)
                .padding(.vertical, 12)
            }
        }
    }
}

// MARK: - Flow Enum
enum ReasonStep: Hashable {
    case screen2, screen3, screen4
}

// MARK: - Flow Container
struct ReasonsFlow: View {
    @State private var path: [ReasonStep] = []

    var body: some View {
        NavigationStack(path: $path) {
            ReasonsScreen1 {
                path.append(.screen2)
            }
            .navigationDestination(for: ReasonStep.self) { step in
                switch step {
                case .screen2:
                    ReasonsScreen2 { path.append(.screen3) }
                case .screen3:
                    ReasonsScreen3 { path.append(.screen4) }
                case .screen4:
                    ReasonsScreen4 {
                        // Khi hoàn tất, quay lại đầu hoặc sang màn chính
                        path.removeAll()
                        print("Flow hoàn tất – chuyển sang màn hình học thật ở đây!")
                    }
                }
            }
        }
    }
}

// MARK: - Preview
#Preview {
    ReasonsFlow()
}
