import Foundation

final class NetworkSession: HTTPClient {
    // MARK: - Properties
    
    private let session: URLSession
    
    private enum NetworkSessionError: Error {
        case invalidURL
        case invalidResponse
    }
    
    init(session: URLSession = .shared) {
        self.session = session
    }
        
    // MARK: - Public Methods
        
    func request(url: String, httpMethod: HTTPMethod, httpBody: Data?) async throws -> (Data, HTTPURLResponse) {
        guard let url = URL(string: url) else {
            throw NetworkSessionError.invalidURL
        }
        
        let urlRequest = URLRequest(url: url)
        let (data, response) = try await session.data(for: urlRequest)
        
        guard let response = response as? HTTPURLResponse else {
            throw NetworkSessionError.invalidResponse
        }
        return (data, response)
    }
}
