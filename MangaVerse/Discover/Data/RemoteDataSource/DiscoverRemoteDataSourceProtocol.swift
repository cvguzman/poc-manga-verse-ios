protocol DiscoverRemoteDataSourceProtocol {
    func fetchMangaList(from page: Int) async throws -> MangaListModel
}
