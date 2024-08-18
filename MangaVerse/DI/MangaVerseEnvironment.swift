import MVNetwork

struct MangaVerseEnvironment {
    var remoteDataSource: MangaDataSource = {
        MangaRemoteDataSource(
            mapper: MangaEntityMapper(),
            domain: MangaNetwork(),
            network: MangaVerseNetwork()
        )
    }()

    var paginatedListViewModel: PaginatedListViewModel {
        PaginatedListViewModel(dataSource: remoteDataSource)
    }

    var categoryListViewModel: CategoryListViewModel {
        CategoryListViewModel(dataSource: remoteDataSource)
    }
}
