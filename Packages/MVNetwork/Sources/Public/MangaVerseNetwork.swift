import Foundation

public final class MangaVerseNetwork {
    // MARK: - Properties
    
    private let httpClient: HTTPClient = URLSessionHTTPClient()
    private let codableHelper = CodableHelper()
    
    public init() {}
    
    // MARK: - Public Methods
    
    public func request<D: Decodable>(url: String, httpMethod: HTTPMethod = .get, payload: Data? = nil) async throws -> D {
        let (data, response) = try await httpClient.request(
            url: url,
            httpMethod: httpMethod.rawValue,
            httpBody: payload
        )
        
        guard (200 ..< 400) ~= response.statusCode else {
            throw NetworkError(message: "Invalid status code", statusCode: response.statusCode)
        }
        
        return try codableHelper.decodeNetworkObject(from: data)
    }
}
