import Foundation
import JSONCodable

/// Collections List
open class CollectionList: Codable {

    enum CodingKeys: String, CodingKey {
        case total = "total"
        case collections = "collections"
    }

    /// Total number of collections rows that matched your query.
    public let total: Int

    /// List of collections.
    public let collections: [Collection]


    init(
        total: Int,
        collections: [Collection]
    ) {
        self.total = total
        self.collections = collections
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.total = try container.decode(Int.self, forKey: .total)
        self.collections = try container.decode([Collection].self, forKey: .collections)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(total, forKey: .total)
        try container.encode(collections, forKey: .collections)
    }

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "collections": collections.map { $0.toMap() } as Any
        ]
    }

    public static func from(map: [String: Any] ) -> CollectionList {
        return CollectionList(
            total: map["total"] as! Int,
            collections: (map["collections"] as! [[String: Any]]).map { Collection.from(map: $0) }
        )
    }
}
