import Foundation
import JSONCodable

/// Monitors List
open class MonitorList: Codable {

    enum CodingKeys: String, CodingKey {
        case total = "total"
        case monitors = "monitors"
    }

    /// Total number of monitors that matched your query.
    public let total: Int
    /// List of monitors.
    public let monitors: [Monitor]

    init(
        total: Int,
        monitors: [Monitor]
    ) {
        self.total = total
        self.monitors = monitors
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.total = try container.contains(.total) ? container.decode(Int.self, forKey: .total) : 0
        self.monitors = try container.contains(.monitors) ? container.decode([Monitor].self, forKey: .monitors) : []
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(total, forKey: .total)
        try container.encode(monitors, forKey: .monitors)
    }

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "monitors": monitors.map { $0.toMap() } as Any,
        ]
    }

    public static func from(map: [String: Any]) -> MonitorList {
        let defaults: [String: Any] = [
            "total": 0,
            "monitors": [Any](),
        ]
        let map = defaults.merging(map) { _, new in new }

        return MonitorList(
            total: map["total"] as! Int,
            monitors: (map["monitors"] as! [[String: Any]]).map { Monitor.from(map: $0) }
        )
    }
}
