import Foundation
import JSONCodable

/// Indexes List
open class IndexList: Codable {

    enum CodingKeys: String, CodingKey {
        case total = "total"
        case indexes = "indexes"
    }

    /// Total number of indexes that matched your query.
    public let total: Int

    /// List of indexes.
    public let indexes: [Index]


    init(
        total: Int,
        indexes: [Index]
    ) {
        self.total = total
        self.indexes = indexes
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.total = try container.decode(Int.self, forKey: .total)
        self.indexes = try container.decode([Index].self, forKey: .indexes)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(total, forKey: .total)
        try container.encode(indexes, forKey: .indexes)
    }

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "indexes": indexes.map { $0.toMap() } as Any
        ]
    }

    public static func from(map: [String: Any] ) -> IndexList {
        return IndexList(
            total: map["total"] as! Int,
            indexes: (map["indexes"] as! [[String: Any]]).map { Index.from(map: $0) }
        )
    }
}
