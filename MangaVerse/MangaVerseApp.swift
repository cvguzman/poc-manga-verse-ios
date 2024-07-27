import SwiftUI
import MVNetwork

@main
struct MangaVerseApp: App {
    @State private var discoverViewModel = DiscoverViewModel(
        dataSource: MangaRemoteDataSource(
            domain: MangaNetwork(),
            network: MangaVerseNetwork()
        )
    )
    var body: some Scene {
        WindowGroup {
            TabView {
                DiscoverView()
                    .environment(discoverViewModel)
                    .tabItem {
                        Label("Discover", systemImage: "star.fill")
                    }
            }
        }
    }
}
