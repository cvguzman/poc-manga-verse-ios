open class DomainBase<E> {
    public let baseURL: String = {
        "https://mymanga-acacademy-5607149ebe3d.herokuapp.com"
    }()
    
    open func url(for endpoint: E) -> String {
        fatalError("Must override")
    }
}
