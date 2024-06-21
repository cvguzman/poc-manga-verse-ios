class DomainBase<E> {
    private(set) var baseURL: String = {
        "https://mymanga-acacademy-5607149ebe3d.herokuapp.com"
    }()
    
    func url(for endpoint: E) -> String {
        fatalError("Must override")
    }
}
