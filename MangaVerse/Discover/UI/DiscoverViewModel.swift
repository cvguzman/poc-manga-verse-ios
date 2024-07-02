import Observation
import Foundation

@Observable
final class DiscoverViewModel: DiscoverViewModelProtocol {
    private let useCase: FetchMangaListUseCase
    var mangas = [MangaModel]()

    init(useCase: FetchMangaListUseCase) {
        self.useCase = useCase
    }
    
    func onAppear() async {
        guard mangas.isEmpty else { return }
        do {
            let mangaList = try await useCase.execute(from: 1)
            mangas = mangaList.items
        } catch {
            fatalError()
        }
    }
}
