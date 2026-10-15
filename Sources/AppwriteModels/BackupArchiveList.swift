import Foundation
import JSONCodable

/// Backup archive list
open class BackupArchiveList: Codable {

    enum CodingKeys: String, CodingKey {
        case total = "total"
        case archives = "archives"
    }

    /// Total number of archives that matched your query.
    public let total: Int
    /// List of archives.
    public let archives: [BackupArchive]

    init(
        total: Int,
        archives: [BackupArchive]
    ) {
        self.total = total
        self.archives = archives
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.total = try container.contains(.total) ? container.decode(Int.self, forKey: .total) : 0
        self.archives = try container.contains(.archives) ? container.decode([BackupArchive].self, forKey: .archives) : []
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(total, forKey: .total)
        try container.encode(archives, forKey: .archives)
    }

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "archives": archives.map { $0.toMap() } as Any,
        ]
    }

    public static func from(map: [String: Any]) -> BackupArchiveList {
        let defaults: [String: Any] = [
            "total": 0,
            "archives": [Any](),
        ]
        let map = defaults.merging(map) { _, new in new }

        return BackupArchiveList(
            total: map["total"] as! Int,
            archives: (map["archives"] as! [[String: Any]]).map { BackupArchive.from(map: $0) }
        )
    }
}
