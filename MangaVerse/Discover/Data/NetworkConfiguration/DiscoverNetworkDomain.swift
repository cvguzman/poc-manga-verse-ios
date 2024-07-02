import MVNetwork

final class DiscoverNetworkDomain: DomainBase<Endpoint.Discover> {
    override func url(for endpoint: Endpoint.Discover) -> String {
        baseURL + endpoint.rawValue
    }
}
