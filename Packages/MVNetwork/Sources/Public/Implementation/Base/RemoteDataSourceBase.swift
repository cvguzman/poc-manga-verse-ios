open class RemoteDataSourceBase<E>: RemoteDataSourceBaseProtocol {
    public var domain: DomainBase<E>
    public var network: MangaVerseNetwork
    public var codableHelper: CodableHelper
    
    public required init(domain: DomainBase<E>, network: MangaVerseNetwork) {
        self.domain = domain
        self.network = network
        codableHelper = CodableHelper()
    }
}
