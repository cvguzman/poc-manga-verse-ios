protocol DiscoverRepositoryProtocol {
    func fetchMangaList(from page: Int) async throws -> MangaListModel
}
