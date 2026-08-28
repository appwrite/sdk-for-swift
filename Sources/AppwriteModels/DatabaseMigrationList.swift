import Foundation
import JSONCodable

/// Database Migrations List
open class DatabaseMigrationList: Codable {

    enum CodingKeys: String, CodingKey {
        case total = "total"
        case migrations = "migrations"
    }

    /// Total number of migrations that matched your query.
    public let total: Int
    /// List of migrations.
    public let migrations: [DatabaseMigration]

    init(
        total: Int,
        migrations: [DatabaseMigration]
    ) {
        self.total = total
        self.migrations = migrations
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.total = try container.decode(Int.self, forKey: .total)
        self.migrations = try container.decode([DatabaseMigration].self, forKey: .migrations)
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

    public static func from(map: [String: Any]) -> DatabaseMigrationList {
        return DatabaseMigrationList(
            total: map["total"] as! Int,
            migrations: (map["migrations"] as! [[String: Any]]).map { DatabaseMigration.from(map: $0) }
        )
    }
}
