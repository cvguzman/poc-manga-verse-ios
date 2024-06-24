public protocol RemoteDataSourceBaseProtocol {
    associatedtype E
    
    var domain: DomainBase<E> { get }
    var network: MangaVerseNetwork { get }
    
    init(domain: DomainBase<E>, network: MangaVerseNetwork)
}
