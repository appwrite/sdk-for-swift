import Foundation
import JSONCodable

/// Embedding list
open class EmbeddingList: Codable {

    enum CodingKeys: String, CodingKey {
        case total = "total"
        case embeddings = "embeddings"
    }

    /// Total number of embeddings that matched your query.
    public let total: Int
    /// List of embeddings.
    public let embeddings: [Embedding]

    init(
        total: Int,
        embeddings: [Embedding]
    ) {
        self.total = total
        self.embeddings = embeddings
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.total = try container.decode(Int.self, forKey: .total)
        self.embeddings = try container.decode([Embedding].self, forKey: .embeddings)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(total, forKey: .total)
        try container.encode(embeddings, forKey: .embeddings)
    }

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "embeddings": embeddings.map { $0.toMap() } as Any
        ]
    }

    public static func from(map: [String: Any] ) -> EmbeddingList {
        return EmbeddingList(
            total: map["total"] as! Int,
            embeddings: (map["embeddings"] as! [[String: Any]]).map { Embedding.from(map: $0) }
        )
    }
}
