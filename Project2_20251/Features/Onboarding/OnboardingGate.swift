import SwiftUI

/// A view that acts as a gate for onboarding content.
/// When the user is onboarded, it shows the provided content.
/// Otherwise, it shows a placeholder onboarding screen.
/// 
/// The onboarding state is managed internally and starts with the provided `isOnboarded` value.
struct OnboardingGate<Content: View>: View {
    @State private var isOnboardedInternal: Bool
    private let content: () -> Content
    
    /// Creates an onboarding gate view.
    /// - Parameters:
    ///   - isOnboarded: Initial onboarding state. Defaults to `true`.
    ///   - content: The content to show when onboarding is complete.
    init(isOnboarded: Bool = true, @ViewBuilder content: @escaping () -> Content) {
        self._isOnboardedInternal = State(initialValue: isOnboarded)
        self.content = content
    }
    
    var body: some View {
        if isOnboardedInternal {
            content()
        } else {
            VStack(spacing: 20) {
                Text("Welcome to the App!")
                    .font(.largeTitle)
                    .bold()
                Text("Please complete the onboarding to continue.")
                    .multilineTextAlignment(.center)
                Button("Continue") {
                    isOnboardedInternal = true
                }
                .buttonStyle(.borderedProminent)
            }
            .padding()
        }
    }
}

#Preview("Not Onboarded") {
    OnboardingGate(isOnboarded: false) {
        Text("Content shown after onboarding")
            .padding()
            .background(Color.green.opacity(0.3))
            .cornerRadius(8)
    }
}

#Preview("Onboarded") {
    OnboardingGate(isOnboarded: true) {
        Text("Content shown after onboarding")
            .padding()
            .background(Color.green.opacity(0.3))
            .cornerRadius(8)
    }
}
