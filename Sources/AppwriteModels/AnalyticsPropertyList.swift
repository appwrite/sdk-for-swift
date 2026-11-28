import Foundation
import JSONCodable

/// Analytics properties list
open class AnalyticsPropertyList: Codable {

    enum CodingKeys: String, CodingKey {
        case total = "total"
        case properties = "properties"
    }

    /// Total number of properties that matched your query.
    public let total: Int
    /// List of properties.
    public let properties: [AnalyticsProperty]

    init(
        total: Int,
        properties: [AnalyticsProperty]
    ) {
        self.total = total
        self.properties = properties
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.total = try container.contains(.total) ? container.decode(Int.self, forKey: .total) : 0
        self.properties = try container.contains(.properties) ? container.decode([AnalyticsProperty].self, forKey: .properties) : []
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(total, forKey: .total)
        try container.encode(properties, forKey: .properties)
    }

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "properties": properties.map { $0.toMap() } as Any,
        ]
    }

    public static func from(map: [String: Any]) -> AnalyticsPropertyList {
        let defaults: [String: Any] = [
            "total": 0,
            "properties": [Any](),
        ]
        let map = defaults.merging(map) { _, new in new }

        return AnalyticsPropertyList(
            total: map["total"] as! Int,
            properties: (map["properties"] as! [[String: Any]]).map { AnalyticsProperty.from(map: $0) }
        )
    }
}
