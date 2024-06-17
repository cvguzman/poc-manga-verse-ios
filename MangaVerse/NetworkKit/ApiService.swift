final class ApiService {
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
    
    func request<D: Decodable, E: Encodable>(url: String, httpMethod: HTTPMethod = .get, payload: E? = nil) async throws -> D {
        let (data, response) = try await httpClient.request(
            url: url,
            httpMethod: httpMethod.rawValue,
            httpBody: try payload.flatMap { httpMethod != .get
                ? try codableHelper.encodeObject(object: $0)
                : nil
            }
        )
        
        guard (200 ..< 400) ~= response.statusCode else {
            throw NetworkError(message: "Invalid status code", statusCode: response.statusCode)
        }
        
        return try codableHelper.decodeNetworkObject(from: data)
    }
}
