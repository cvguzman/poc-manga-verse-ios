import MVNetwork

struct HomeDIContainer {
    // MARK: - DataSource
    
    var remoteDataSource: HomeRemoteDataSourceProtocol {
        HomeRemoteDataSource(
            domain: HomeNetworkDomain(),
            network: MangaVerseNetwork())
    }
    
    var repository: HomeRepositoryProtocol {
        HomeRepository(remoteDataSource: remoteDataSource)
    }
    
    // MARK: - UseCases
    
    var fetchMangaList: FetchMangaListUseCase {
        FetchMangaListUseCase(repository: repository)
    }
}
