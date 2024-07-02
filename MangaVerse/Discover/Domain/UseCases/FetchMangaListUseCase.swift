struct FetchMangaListUseCase {
    private let repository: DiscoverRepositoryProtocol
    
    init(repository: DiscoverRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute(from page: Int) async throws -> MangaListModel {
        try await repository.fetchMangaList(from: page)
    }
}
