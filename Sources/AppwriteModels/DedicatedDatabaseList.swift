import Foundation
import JSONCodable

/// Dedicated databases list
open class DedicatedDatabaseList: Codable {

    enum CodingKeys: String, CodingKey {
        case total = "total"
        case databases = "databases"
    }

    /// Total number of databases that matched your query.
    public let total: Int
    /// List of databases.
    public let databases: [DedicatedDatabase]

    init(
        total: Int,
        databases: [DedicatedDatabase]
    ) {
        self.total = total
        self.databases = databases
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.total = try container.decode(Int.self, forKey: .total)
        self.databases = try container.decode([DedicatedDatabase].self, forKey: .databases)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(total, forKey: .total)
        try container.encode(databases, forKey: .databases)
    }

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "databases": databases.map { $0.toMap() } as Any,
        ]
    }

    public static func from(map: [String: Any]) -> DedicatedDatabaseList {
        return DedicatedDatabaseList(
            total: map["total"] as! Int,
            databases: (map["databases"] as! [[String: Any]]).map { DedicatedDatabase.from(map: $0) }
        )
    }
}
