import Foundation

public enum LessonLevel: String, Codable, CaseIterable, Sendable {
    case beginner
    case intermediate
    case advanced
}

public struct Lesson: Identifiable, Codable, Hashable, Sendable {
    public let id: UUID
    public var title: String
    public var description: String
    public var duration: TimeInterval // seconds
    public var progress: Double       // 0.0 ... 1.0
    public var isCompleted: Bool
    public var level: LessonLevel

    public init(
        id: UUID = UUID(),
        title: String,
        description: String,
        duration: TimeInterval,
        progress: Double = 0,
        isCompleted: Bool = false,
        level: LessonLevel = .beginner
    ) {
        self.id = id
        self.title = title
        self.description = description
        self.duration = duration
        self.progress = min(max(progress, 0), 1)
        self.isCompleted = isCompleted
        self.level = level
    }
}

public extension Lesson {
    static let sampleData: [Lesson] = [
        Lesson(
            title: "Chào hỏi cơ bản",
            description: "Học các câu chào hỏi thường dùng",
            duration: 8 * 60,
            progress: 0.2,
            isCompleted: false,
            level: .beginner
        ),
        Lesson(
            title: "Từ vựng chủ đề Gia đình",
            description: "Mở rộng vốn từ về các thành viên trong gia đình",
            duration: 12 * 60,
            progress: 0.75,
            isCompleted: false,
            level: .intermediate
        ),
        Lesson(
            title: "Ngữ pháp: Thì hiện tại hoàn thành",
            description: "Cấu trúc, cách dùng và ví dụ minh họa",
            duration: 15 * 60,
            progress: 1.0,
            isCompleted: true,
            level: .advanced
        )
    ]
}
