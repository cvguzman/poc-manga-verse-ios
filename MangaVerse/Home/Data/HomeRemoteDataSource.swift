import MVNetwork

final class HomeRemoteDataSource: RemoteDataSourceBase<Endpoint.Home>, HomeRemoteDataSourceProtocol {
    func fetchMangaList(from page: Int) async throws -> MangaListModel {
        let url = String(format: domain.url(for: .mangaList), String(page))
        let model: MangaListModel = try await network.request(url: url)
        
        return model
    }
}
