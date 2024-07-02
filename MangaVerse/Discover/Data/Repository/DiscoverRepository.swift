struct DiscoverRepository: DiscoverRepositoryProtocol {
    private let remoteDataSource: DiscoverRemoteDataSourceProtocol
    
    init(remoteDataSource: DiscoverRemoteDataSourceProtocol) {
        self.remoteDataSource = remoteDataSource
    }
    
    func fetchMangaList(from page: Int) async throws -> MangaListModel {
        try await remoteDataSource.fetchMangaList(from: page)
    }
}
