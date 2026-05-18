import Foundation
import JSONCodable

/// Usage events list
open class UsageEventList: Codable {

    enum CodingKeys: String, CodingKey {
        case total = "total"
        case events = "events"
    }

    /// Total number of events that matched your query.
    public let total: Int
    /// List of events.
    public let events: [UsageEvent]

    init(
        total: Int,
        events: [UsageEvent]
    ) {
        self.total = total
        self.events = events
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.total = try container.decode(Int.self, forKey: .total)
        self.events = try container.decode([UsageEvent].self, forKey: .events)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(total, forKey: .total)
        try container.encode(events, forKey: .events)
    }

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "events": events.map { $0.toMap() } as Any
        ]
    }

    public static func from(map: [String: Any] ) -> UsageEventList {
        return UsageEventList(
            total: map["total"] as! Int,
            events: (map["events"] as! [[String: Any]]).map { UsageEvent.from(map: $0) }
        )
    }
}
