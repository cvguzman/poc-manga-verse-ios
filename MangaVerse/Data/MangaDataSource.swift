protocol MangaDataSource: AnyObject {
    func fetchMangas(from type: MangaListType) async throws -> [MangaModel]
    func fetchCategories(by category: MangaCategoryType) async throws -> [String]
}
