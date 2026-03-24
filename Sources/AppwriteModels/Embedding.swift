import Foundation
import JSONCodable

/// Embedding
open class Embedding: Codable {

    enum CodingKeys: String, CodingKey {
        case model = "model"
        case dimension = "dimension"
        case embedding = "embedding"
        case error = "error"
    }

    /// Embedding model used to generate embeddings.
    public let model: String
    /// Number of dimensions for each embedding vector.
    public let dimension: Int
    /// Embedding vector values. If an error occurs, this will be an empty array.
    public let embedding: [Double]
    /// Error message if embedding generation fails. Empty string if no error.
    public let error: String

    init(
        model: String,
        dimension: Int,
        embedding: [Double],
        error: String
    ) {
        self.model = model
        self.dimension = dimension
        self.embedding = embedding
        self.error = error
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.model = try container.decode(String.self, forKey: .model)
        self.dimension = try container.decode(Int.self, forKey: .dimension)
        self.embedding = try container.decode([Double].self, forKey: .embedding)
        self.error = try container.decode(String.self, forKey: .error)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(model, forKey: .model)
        try container.encode(dimension, forKey: .dimension)
        try container.encode(embedding, forKey: .embedding)
        try container.encode(error, forKey: .error)
    }

    public func toMap() -> [String: Any] {
        return [
            "model": model as Any,
            "dimension": dimension as Any,
            "embedding": embedding as Any,
            "error": error as Any
        ]
    }

    public static func from(map: [String: Any] ) -> Embedding {
        return Embedding(
            model: map["model"] as! String,
            dimension: map["dimension"] as! Int,
            embedding: map["embedding"] as! [Double],
            error: map["error"] as! String
        )
    }
}
