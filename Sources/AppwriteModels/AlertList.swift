import Foundation
import JSONCodable

/// Alerts List
open class AlertList: Codable {

    enum CodingKeys: String, CodingKey {
        case total = "total"
        case alerts = "alerts"
    }

    /// Total number of alerts that matched your query.
    public let total: Int
    /// List of alerts.
    public let alerts: [Alert]

    init(
        total: Int,
        alerts: [Alert]
    ) {
        self.total = total
        self.alerts = alerts
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.total = try container.contains(.total) ? container.decode(Int.self, forKey: .total) : 0
        self.alerts = try container.contains(.alerts) ? container.decode([Alert].self, forKey: .alerts) : []
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(total, forKey: .total)
        try container.encode(alerts, forKey: .alerts)
    }

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "alerts": alerts.map { $0.toMap() } as Any,
        ]
    }

    public static func from(map: [String: Any]) -> AlertList {
        let defaults: [String: Any] = [
            "total": 0,
            "alerts": [Any](),
        ]
        let map = defaults.merging(map) { _, new in new }

        return AlertList(
            total: map["total"] as! Int,
            alerts: (map["alerts"] as! [[String: Any]]).map { Alert.from(map: $0) }
        )
    }
}
