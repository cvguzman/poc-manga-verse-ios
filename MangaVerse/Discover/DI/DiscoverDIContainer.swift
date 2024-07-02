import MVNetwork

struct DiscoverDIContainer {
    // MARK: - DataSource
    
    var remoteDataSource: DiscoverRemoteDataSourceProtocol {
        DiscoverRemoteDataSource(
            domain: DiscoverNetworkDomain(),
            network: MangaVerseNetwork())
    }
    
    var repository: DiscoverRepositoryProtocol {
        DiscoverRepository(remoteDataSource: remoteDataSource)
    }
    
    // MARK: - UseCases
    
    var fetchMangaList: FetchMangaListUseCase {
        FetchMangaListUseCase(repository: repository)
    }
}
