import SwiftUI
import MVNetwork

@main
struct MangaVerseApp: App {
    @State private var environment = MangaVerseEnvironment()

    var body: some Scene {
        WindowGroup {
            TabView {
                DiscoverView()
                    .environment(environment.paginatedListViewModel)
                    .tabItem {
                        Label("Discover", systemImage: "star.fill")
                    }
                CategoryListView()
                    .environment(environment.categoryListViewModel)
                    .environment(environment.paginatedListViewModel)
                    .tabItem {
                        Label("Categories", systemImage: "list.bullet")
                    }
            }
        }
    }
}
