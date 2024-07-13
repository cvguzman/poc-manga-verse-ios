import MVNetwork

final class MangaRemoteDataSource: RemoteDataSourceBase<Endpoint.Manga>, MangaRemoteDataSourceProtocol {
    func fetchMangas(from page: Int) async throws -> PaginatedMangaListEntity {
        let url = String(format: domain.url(for: .paginatedList), String(page))
        let model: PaginatedMangaListEntity = try await network.request(url: url)
        return model
    }
}
