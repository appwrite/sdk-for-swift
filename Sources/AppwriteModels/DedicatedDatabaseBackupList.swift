import Foundation
import JSONCodable

/// BackupList
open class DedicatedDatabaseBackupList: Codable {

    enum CodingKeys: String, CodingKey {
        case total = "total"
        case backups = "backups"
    }

    /// Total number of backups.
    public let total: Int
    /// List of backups.
    public let backups: [DedicatedDatabaseBackup]

    init(
        total: Int,
        backups: [DedicatedDatabaseBackup]
    ) {
        self.total = total
        self.backups = backups
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.total = try container.contains(.total) ? container.decode(Int.self, forKey: .total) : 0
        self.backups = try container.contains(.backups) ? container.decode([DedicatedDatabaseBackup].self, forKey: .backups) : []
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(total, forKey: .total)
        try container.encode(backups, forKey: .backups)
    }

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "backups": backups.map { $0.toMap() } as Any,
        ]
    }

    public static func from(map: [String: Any]) -> DedicatedDatabaseBackupList {
        let defaults: [String: Any] = [
            "total": 0,
            "backups": [Any](),
        ]
        let map = defaults.merging(map) { _, new in new }

        return DedicatedDatabaseBackupList(
            total: map["total"] as! Int,
            backups: (map["backups"] as! [[String: Any]]).map { DedicatedDatabaseBackup.from(map: $0) }
        )
    }
}
