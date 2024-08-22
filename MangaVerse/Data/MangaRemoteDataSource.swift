import Foundation
import MVNetwork

final class MangaRemoteDataSource: RemoteDataSourceBase<Endpoint.Manga>, MangaDataSource {
    private let mapper: MangaEntityMapper

    init(mapper: MangaEntityMapper, domain: DomainBase<E>, network: MangaVerseNetwork) {
        self.mapper = mapper
        super.init(domain: domain, network: network)
    }

    required init(domain: DomainBase<E>, network: MangaVerseNetwork) {
        fatalError("init(domain:network:) has not been implemented")
    }

    func fetchMangas(from type: MangaListType) async throws -> [MangaModel] {
        let url: String
        switch type {
        case .page(let pageNumber):
            url = String(format: domain.url(for: .paginatedList), String(pageNumber))
        case .matchingWord(let word, let pageNumber):
            url = String(format: domain.url(for: .searchByWord), word, String(pageNumber))
        case .category(let category, let pageNumber):
            url = prepareCategoryURL(from: category, pageNumber: String(pageNumber))
        }
        let entity: PaginatedMangaListEntity = try await network.request(url: url)
        var model = [MangaModel]()
        for entity in entity.items {
            do {
                let imageData: Data = try await network.request(
                    url: cleanMainPictureURL(entity.mainPicture))
                model.append(mapper.map(value: entity, imageData: imageData))
            } catch {
                model.append(mapper.map(value: entity, imageData: nil))
            }
        }
        return model
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
    private func prepareCategoryURL(from category: MangaCategoryType, pageNumber: String) -> String
    {
        let endpoint: (Endpoint.Manga, String)
        switch category {
        case .genre(let value):
            endpoint = (.searchByGenre, value)
        case .theme(let value):
            endpoint = (.searchByTheme, value)
        case .demographic(let value):
            endpoint = (.searchByDemographic, value)
        }
        return String(format: domain.url(for: endpoint.0), endpoint.1, pageNumber)
    }

    private func cleanMainPictureURL(_ url: String) -> String {
        url.replacingOccurrences(of: "\"", with: String())
    }
}
