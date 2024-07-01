struct FetchMangaListUseCase {
    private let repository: HomeRepositoryProtocol
    
    init(repository: HomeRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute(from page: Int) async throws -> MangaListModel {
        try await repository.fetchMangaList(from: page)
    }
}
