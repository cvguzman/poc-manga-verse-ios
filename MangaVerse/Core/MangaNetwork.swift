import MVNetwork

final class MangaNetwork: DomainBase<Endpoint.Manga> {
    override func url(for endpoint: Endpoint.Manga) -> String {
        baseURL + endpoint.rawValue
    }
}
