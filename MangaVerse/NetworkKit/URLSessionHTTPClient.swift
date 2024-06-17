import Foundation

final class URLSessionHTTPClient: HTTPClient {
    // MARK: - Properties
    
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
        
    // MARK: - Public Methods
        
    func request(url: String, httpMethod: String, httpBody: Data?) async throws -> (Data, HTTPURLResponse) {
        guard let url = URL(string: url) else {
            throw NetworkError(message: "Could not retrieve URL: \(url)")
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = httpMethod
        urlRequest.httpBody = httpBody
        
        let (data, response) = try await session.data(for: urlRequest)
        
        guard let response = response as? HTTPURLResponse else {
            throw NetworkError(message: "Could not retrieve a valid response: \(response)")
        }
        return (data, response)
    }
}
