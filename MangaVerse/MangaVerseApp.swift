import SwiftUI

@main
struct MangaVerseApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                DiscoverView()
                    .tabItem {
                        Label("Discover", systemImage: "star.fill")
                    }
            }
        }
    }
}
