import Foundation
import JSONCodable

/// Usage gauges list
open class UsageGaugeList: Codable {

    enum CodingKeys: String, CodingKey {
        case total = "total"
        case gauges = "gauges"
    }

    /// Total number of gauges that matched your query.
    public let total: Int
    /// List of gauges.
    public let gauges: [UsageGauge]

    init(
        total: Int,
        gauges: [UsageGauge]
    ) {
        self.total = total
        self.gauges = gauges
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.total = try container.decode(Int.self, forKey: .total)
        self.gauges = try container.decode([UsageGauge].self, forKey: .gauges)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(total, forKey: .total)
        try container.encode(gauges, forKey: .gauges)
    }

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "gauges": gauges.map { $0.toMap() } as Any
        ]
    }

    public static func from(map: [String: Any] ) -> UsageGaugeList {
        return UsageGaugeList(
            total: map["total"] as! Int,
            gauges: (map["gauges"] as! [[String: Any]]).map { UsageGauge.from(map: $0) }
        )
    }
}
