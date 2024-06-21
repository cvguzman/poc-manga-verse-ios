open class ApiServiceBase<E>: ApiServiceBaseProtocol {
    public var domain: DomainBase<E>
    public var network: ApiService
    public var codableHelper: CodableHelper
    
    public required init(domain: DomainBase<E>, network: ApiService) {
        self.domain = domain
        self.network = network
        codableHelper = CodableHelper()
    }
}
