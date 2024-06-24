import Foundation

public final class CodableHelper {
    // MARK: - Properties
    
    private let decoder: JSONDecoder
    private let encoder: JSONEncoder
    
    init(
        decoder: JSONDecoder = JSONDecoder(),
        encoder: JSONEncoder = JSONEncoder()
    ) {
        self.decoder = decoder
        self.encoder = encoder
    }
    
    // MARK: - Public Methods
    
    public func decodeNetworkObject<D: Decodable>(from data: Data) throws -> D {
        do {
            let decodedObject = try decoder.decode(D.self, from: data)
            return decodedObject
        } catch {
            throw error
        }
    }
    
    public func encodeObject<E: Encodable>(object: E) throws -> Data {
        do {
            let encodedObject = try encoder.encode(object.self)
            return encodedObject
        } catch {
            throw error
        }
    }
}
