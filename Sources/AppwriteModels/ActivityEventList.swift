import Foundation
import JSONCodable

/// Activity event list
open class ActivityEventList: Codable {

    enum CodingKeys: String, CodingKey {
        case total = "total"
        case events = "events"
    }

    /// Total number of events that matched your query.
    public let total: Int
    /// List of events.
    public let events: [ActivityEvent]

    init(
        total: Int,
        events: [ActivityEvent]
    ) {
        self.total = total
        self.events = events
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.total = try container.contains(.total) ? container.decode(Int.self, forKey: .total) : 0
        self.events = try container.contains(.events) ? container.decode([ActivityEvent].self, forKey: .events) : []
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(total, forKey: .total)
        try container.encode(events, forKey: .events)
    }

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "events": events.map { $0.toMap() } as Any,
        ]
    }

    public static func from(map: [String: Any]) -> ActivityEventList {
        let defaults: [String: Any] = [
            "total": 0,
            "events": [Any](),
        ]
        let map = defaults.merging(map) { _, new in new }

        return ActivityEventList(
            total: map["total"] as! Int,
            events: (map["events"] as! [[String: Any]]).map { ActivityEvent.from(map: $0) }
        )
    }
}
