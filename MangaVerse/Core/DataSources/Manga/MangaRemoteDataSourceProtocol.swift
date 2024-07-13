protocol MangaRemoteDataSourceProtocol: AnyObject {
    func fetchMangas(from page: Int) async throws -> PaginatedMangaListEntity
}
