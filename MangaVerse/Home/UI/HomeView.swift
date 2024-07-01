import SwiftUI
import MVNetwork

struct HomeView: View {
    @State var viewModel: HomeViewModel
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        List {
            ForEach(viewModel.mangas) { manga in
                Text(manga.title)
            }
        }
        .task {
            await viewModel.onAppear()
        }
    }
    
}

#Preview {
    HomeView(
        viewModel: HomeViewModel(
            useCase: FetchMangaListUseCase(
                repository: HomeRepository(
                    remoteDataSource: HomeRemoteDataSource(
                        domain: HomeNetworkDomain(),
                        network: MangaVerseNetwork()
                    )
                )
            )
        )
    )
}
