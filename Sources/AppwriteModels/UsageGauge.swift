import Foundation
import JSONCodable

/// usageGauge
open class UsageGauge: Codable {

    enum CodingKeys: String, CodingKey {
        case metric = "metric"
        case value = "value"
        case time = "time"
    }

    /// The metric key.
    public let metric: String
    /// The current snapshot value.
    public let value: Int
    /// The snapshot timestamp.
    public let time: String

    init(
        metric: String,
        value: Int,
        time: String
    ) {
        self.metric = metric
        self.value = value
        self.time = time
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.metric = try container.decode(String.self, forKey: .metric)
        self.value = try container.decode(Int.self, forKey: .value)
        self.time = try container.decode(String.self, forKey: .time)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(metric, forKey: .metric)
        try container.encode(value, forKey: .value)
        try container.encode(time, forKey: .time)
    }

    public func toMap() -> [String: Any] {
        return [
            "metric": metric as Any,
            "value": value as Any,
            "time": time as Any
        ]
    }

    public static func from(map: [String: Any] ) -> UsageGauge {
        return UsageGauge(
            metric: map["metric"] as! String,
            value: map["value"] as! Int,
            time: map["time"] as! String
        )
    }
}
