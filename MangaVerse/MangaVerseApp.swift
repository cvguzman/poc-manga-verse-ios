import SwiftUI

@main
struct MangaVerseApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                ViewFactory.view(type: .home)
                    .tabItem {
                        Label("Browse", systemImage: "house")
                    }
                Text("Account")
                    .tabItem {
                        Label("Account", systemImage: "magnifyingglass")
                    }
            }
        }
    }
}
