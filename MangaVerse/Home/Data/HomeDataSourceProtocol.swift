protocol HomeDataSourceProtocol {
    func fetchMangaList(from page: Int) async throws -> MangaListModel
}
