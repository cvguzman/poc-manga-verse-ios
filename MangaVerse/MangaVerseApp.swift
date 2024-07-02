import SwiftUI

@main
struct MangaVerseApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                ViewFactory.view(type: .discover)
                    .tabItem {
                        Label("Discover", systemImage: "star")
                    }
            }
        }
    }
}
