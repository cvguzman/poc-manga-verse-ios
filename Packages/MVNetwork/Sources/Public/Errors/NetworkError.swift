public struct NetworkError: Error {
    let message: String
    let statusCode: Int?
    
    init(message: String, statusCode: Int? = nil) {
        self.message = message
        self.statusCode = statusCode
    }
}
