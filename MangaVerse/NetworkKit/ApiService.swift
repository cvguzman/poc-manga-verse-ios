final class ApiService {
    // MARK: - Properties
    
    private let httpClient: HTTPClient
    private let codableHelper: CodableHelper
    
    private enum ApiServiceError: Error {
        case invalidHttpResponse
    }
    
    init(
        httpClient: HTTPClient = NetworkSession(),
        codableHelper: CodableHelper = CodableHelper()
    ) {
        self.httpClient = httpClient
        self.codableHelper = codableHelper
    }
    
    // MARK: - Public Methods
    
    func request<Response: Decodable>(url: String, httpMethod: HTTPMethod = .get) async throws -> Response {
        let (data, response) = try await httpClient.request(url: url, httpMethod: httpMethod, httpBody: nil)
        
        guard response.statusCode >= 200 else {
            throw ApiServiceError.invalidHttpResponse
        }
        
        let decodedObject: Response = try codableHelper.decodeNetworkObject(from: data)
        
        return decodedObject
    }
    
    func request<DecodableObject: Decodable, EncodableObject: Encodable>(url: String, httpMethod: HTTPMethod = .post, object: EncodableObject) async throws -> DecodableObject {
        
        let encodedObject = try codableHelper.encodeObject(object: object.self)
        let (data, response) = try await httpClient.request(url: url, httpMethod: httpMethod, httpBody: encodedObject)
        
        guard response.statusCode >= 200 else {
            throw ApiServiceError.invalidHttpResponse
        }
        
        let decodedObject: DecodableObject = try codableHelper.decodeNetworkObject(from: data)
        
        return decodedObject
    }
}
