import ApiServiceKit

final class HomeNetworkDomain: DomainBase<Endpoint.Home> {
    override func url(for endpoint: Endpoint.Home) -> String {
        baseURL + endpoint.rawValue
    }
}
