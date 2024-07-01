protocol HomeRemoteDataSourceProtocol {
    func fetchMangaList(from page: Int) async throws -> MangaListModel
}
