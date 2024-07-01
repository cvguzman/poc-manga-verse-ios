protocol HomeRepositoryProtocol {
    func fetchMangaList(from page: Int) async throws -> MangaListModel
}
