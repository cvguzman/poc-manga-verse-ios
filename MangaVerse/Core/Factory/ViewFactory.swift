import SwiftUI

struct ViewFactory {
    private static var homeDIContainer = HomeDIContainer()
    
    @ViewBuilder
    static func view(type: ViewType) -> some View {
        switch type {
        default:
            HomeView(
                viewModel: HomeViewModel(
                    useCase: homeDIContainer.fetchMangaList
                )
            )
        }
    }
}
