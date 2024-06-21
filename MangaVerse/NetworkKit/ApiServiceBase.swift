class ApiServiceBase<E>: ApiServiceBaseProtocol {
    var domain: DomainBase<E>
    var network: ApiService
    var codableHelper: CodableHelper
    
    required init(domain: DomainBase<E>, network: ApiService) {
        self.domain = domain
        self.network = network
        codableHelper = CodableHelper()
    }
}
