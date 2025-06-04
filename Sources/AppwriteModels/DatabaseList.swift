import Foundation
import JSONCodable

/// Databases List
open class DatabaseList: Codable {

    enum CodingKeys: String, CodingKey {
        case total = "total"
        case databases = "databases"
    }

    /// Total number of databases documents that matched your query.
    public let total: Int

    /// List of databases.
    public let databases: [Database]


    init(
        total: Int,
        databases: [Database]
    ) {
        self.total = total
        self.databases = databases
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.total = try container.decode(Int.self, forKey: .total)
        self.databases = try container.decode([Database].self, forKey: .databases)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(total, forKey: .total)
        try container.encode(databases, forKey: .databases)
    }

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "databases": databases.map { $0.toMap() } as Any
        ]
    }

    public static func from(map: [String: Any] ) -> DatabaseList {
        return DatabaseList(
            total: map["total"] as? Int ?? 0,
            databases: (map["databases"] as? [[String: Any]] ?? []).map { Database.from(map: $0) }
        )
    }
}
