import Foundation

protocol HTTPClient {
    typealias Result = (Data, HTTPURLResponse)
    
    func request(url: String, httpMethod: String, httpBody: Data?) async throws -> Result
}
