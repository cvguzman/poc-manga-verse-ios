struct HomeRepository: HomeRepositoryProtocol {
    private let remoteDataSource: HomeRemoteDataSourceProtocol
    
    init(remoteDataSource: HomeRemoteDataSourceProtocol) {
        self.remoteDataSource = remoteDataSource
    }
    
    func fetchMangaList(from page: Int) async throws -> MangaListModel {
        try await remoteDataSource.fetchMangaList(from: page)
    }
}
