import MVNetwork
import SwiftUI

@main
struct MangaVerseApp: App {
    @State private var environment = MangaVerseEnvironment()

    var body: some Scene {
        WindowGroup {
            TabView {
                DiscoverView(environment: environment)
                    .tabItem {
                        Label("Discover", systemImage: "star.fill")
                    }
                CategoryListView(environment: environment)
                    .tabItem {
                        Label("Categories", systemImage: "list.bullet")
                    }
            }
        }
    }
}
