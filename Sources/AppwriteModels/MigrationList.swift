import Foundation
import JSONCodable

/// Migrations List
open class MigrationList: Codable {

    enum CodingKeys: String, CodingKey {
        case total = "total"
        case migrations = "migrations"
    }

    /// Total number of migrations that matched your query.
    public let total: Int
    /// List of migrations.
    public let migrations: [Migration]

    init(
        total: Int,
        migrations: [Migration]
    ) {
        self.total = total
        self.migrations = migrations
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.total = try container.contains(.total) ? container.decode(Int.self, forKey: .total) : 0
        self.migrations = try container.contains(.migrations) ? container.decode([Migration].self, forKey: .migrations) : []
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(total, forKey: .total)
        try container.encode(migrations, forKey: .migrations)
    }

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "migrations": migrations.map { $0.toMap() } as Any,
        ]
    }

    public static func from(map: [String: Any]) -> MigrationList {
        let defaults: [String: Any] = [
            "total": 0,
            "migrations": [Any](),
        ]
        let map = defaults.merging(map) { _, new in new }

        return MigrationList(
            total: map["total"] as! Int,
            migrations: (map["migrations"] as! [[String: Any]]).map { Migration.from(map: $0) }
        )
    }
}
