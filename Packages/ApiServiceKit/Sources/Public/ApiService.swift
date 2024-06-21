import Foundation

public final class ApiService {
    // MARK: - Properties
    
    private let httpClient: HTTPClient
    private let codableHelper: CodableHelper
    
    init(
        httpClient: HTTPClient = URLSessionHTTPClient(),
        codableHelper: CodableHelper = CodableHelper()
    ) {
        self.httpClient = httpClient
        self.codableHelper = codableHelper
    }
    
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
