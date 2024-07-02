import SwiftUI

struct ViewFactory {
    private static var discoverDIContainer = DiscoverDIContainer()
    
    @ViewBuilder
    static func view(type: ViewType) -> some View {
        switch type {
        default:
            DiscoverView(
                viewModel: DiscoverViewModel(
                    useCase: discoverDIContainer.fetchMangaList
                )
            )
        }
    }
}
