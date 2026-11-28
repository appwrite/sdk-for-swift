import Foundation
import JSONCodable

/// AnalyticsMetricList
open class AnalyticsMetricList: Codable {

    enum CodingKeys: String, CodingKey {
        case total = "total"
        case metrics = "metrics"
    }

    /// Total number of metric rows returned.
    public let total: Int
    /// Metric rows: one per time bucket, one per dimension value, or a single row for the flat aggregate.
    public let metrics: [AnalyticsMetric]

    init(
        total: Int,
        metrics: [AnalyticsMetric]
    ) {
        self.total = total
        self.metrics = metrics
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.total = try container.contains(.total) ? container.decode(Int.self, forKey: .total) : 0
        self.metrics = try container.contains(.metrics) ? container.decode([AnalyticsMetric].self, forKey: .metrics) : []
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(total, forKey: .total)
        try container.encode(metrics, forKey: .metrics)
    }

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "metrics": metrics.map { $0.toMap() } as Any,
        ]
    }

    public static func from(map: [String: Any]) -> AnalyticsMetricList {
        let defaults: [String: Any] = [
            "total": 0,
            "metrics": [Any](),
        ]
        let map = defaults.merging(map) { _, new in new }

        return AnalyticsMetricList(
            total: map["total"] as! Int,
            metrics: (map["metrics"] as! [[String: Any]]).map { AnalyticsMetric.from(map: $0) }
        )
    }
}
