import MVNetwork

final class MangaRemoteDataSource: RemoteDataSourceBase<Endpoint.Manga>, MangaRemoteDataSourceProtocol {
    func fetchMangas(from type: MangaListType) async throws -> PaginatedMangaListEntity {
        let url: String
        switch type {
        case .page(let pageNumber):
            url = String(format: domain.url(for: .paginatedList), String(pageNumber))
        case .matchingWord(let word):
            url = String(format: domain.url(for: .searchByWord), word)
        case .category(let category):
            url = prepareCategoryURL(from: category)
        }
        let entity: PaginatedMangaListEntity = try await network.request(url: url)
        return entity
    }
    
    func fetchCategories(by category: MangaCategoryType) async throws -> [String] {
        let url: String
        switch category {
        case .genre:
            url = domain.url(for: .genres)
        case .theme:
            url = domain.url(for: .themes)
        case .demographic:
            url = domain.url(for: .demographics)
        }
        let categories: [String] = try await network.request(url: url)
        return categories
    }
}

extension MangaRemoteDataSource {
    private func prepareCategoryURL(from category: MangaCategoryType) -> String {
        let endpoint: (Endpoint.Manga, String)
        switch category {
        case .genre(let value):
            endpoint = (.searchByGenre, value)
        case .theme(let value):
            endpoint = (.searchByTheme, value)
        case .demographic(let value):
            endpoint = (.searchByDemographic, value)
        }
        return String(format: domain.url(for: endpoint.0), endpoint.1)
    }
}
