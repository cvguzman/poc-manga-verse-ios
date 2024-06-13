import Foundation

protocol HTTPClient {
    typealias Result = (Data, HTTPURLResponse)
    
    func request(url: String, httpMethod: HTTPMethod, httpBody: Data?) async throws -> Result
}
