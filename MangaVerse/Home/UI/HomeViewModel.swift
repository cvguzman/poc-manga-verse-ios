import Observation
import Foundation

@Observable
final class HomeViewModel: HomeViewModelProtocol {
    private let useCase: FetchMangaListUseCase
    var mangas = [MangaModel]()

    init(useCase: FetchMangaListUseCase) {
        self.useCase = useCase
    }
    
    func onAppear() async {
        do {
            let mangaList = try await useCase.execute(from: 1)
            mangas = mangaList.items
        } catch {
            fatalError()
        }
    }
}
