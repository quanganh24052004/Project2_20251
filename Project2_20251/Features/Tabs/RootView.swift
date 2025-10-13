import SwiftUI

struct RootView: View {
    @State private var selectedTab: AppTab = .review

    var body: some View {
        TabView(selection: $selectedTab) {
            NavigationStack {
                SearchView()
                    .navigationTitle(AppTab.search.title)
            }
            .tabItem {
                Image(systemName: AppTab.search.systemImage)
                Text(AppTab.search.title)
            }
            .tag(AppTab.search)

            NavigationStack {
                LearnView()
                    .navigationTitle(AppTab.learn.title)
            }
            .tabItem {
                Image(systemName: AppTab.learn.systemImage)
                Text(AppTab.learn.title)
            }
            .tag(AppTab.learn)

            NavigationStack {
                ReviewView()
                    .navigationTitle(AppTab.review.title)
            }
            .tabItem {
                Image(systemName: AppTab.review.systemImage)
                Text(AppTab.review.title)
            }
            .tag(AppTab.review)

            NavigationStack {
                ForumView()
                    .navigationTitle(AppTab.forum.title)
            }
            .tabItem {
                Image(systemName: AppTab.forum.systemImage)
                Text(AppTab.forum.title)
            }
            .tag(AppTab.forum)

            NavigationStack {
                SettingsView()
                    .navigationTitle(AppTab.settings.title)
            }
            .tabItem {
                Image(systemName: AppTab.settings.systemImage)
                Text(AppTab.settings.title)
            }
            .tag(AppTab.settings)
        }
    }
}

#Preview {
    RootView()
}
