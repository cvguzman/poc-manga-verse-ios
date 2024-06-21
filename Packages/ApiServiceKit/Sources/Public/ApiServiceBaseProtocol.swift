public protocol ApiServiceBaseProtocol {
    associatedtype E
    
    var domain: DomainBase<E> { get }
    var network: ApiService { get }
    
    init(domain: DomainBase<E>, network: ApiService)
}
