protocol MangaRemoteDataSourceProtocol: AnyObject {
    func fetchMangas(from type: MangaListType) async throws -> PaginatedMangaListEntity
    func fetchCategories(by category: MangaCategoryType) async throws -> [String]
}
