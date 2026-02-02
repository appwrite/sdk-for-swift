import Foundation
import JSONCodable

/// Status List
open class HealthStatusList: Codable {

    enum CodingKeys: String, CodingKey {
        case total = "total"
        case statuses = "statuses"
    }

    /// Total number of statuses that matched your query.
    public let total: Int
    /// List of statuses.
    public let statuses: [HealthStatus]

    init(
        total: Int,
        statuses: [HealthStatus]
    ) {
        self.total = total
        self.statuses = statuses
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.total = try container.decode(Int.self, forKey: .total)
        self.statuses = try container.decode([HealthStatus].self, forKey: .statuses)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(total, forKey: .total)
        try container.encode(statuses, forKey: .statuses)
    }

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "statuses": statuses.map { $0.toMap() } as Any
        ]
    }

    public static func from(map: [String: Any] ) -> HealthStatusList {
        return HealthStatusList(
            total: map["total"] as! Int,
            statuses: (map["statuses"] as! [[String: Any]]).map { HealthStatus.from(map: $0) }
        )
    }
}
