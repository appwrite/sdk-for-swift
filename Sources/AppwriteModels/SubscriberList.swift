import Foundation
import JSONCodable

/// Subscriber list
open class SubscriberList: Codable {

    enum CodingKeys: String, CodingKey {
        case total = "total"
        case subscribers = "subscribers"
    }

    /// Total number of subscribers that matched your query.
    public let total: Int
    /// List of subscribers.
    public let subscribers: [Subscriber]

    init(
        total: Int,
        subscribers: [Subscriber]
    ) {
        self.total = total
        self.subscribers = subscribers
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.total = try container.decode(Int.self, forKey: .total)
        self.subscribers = try container.decode([Subscriber].self, forKey: .subscribers)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(total, forKey: .total)
        try container.encode(subscribers, forKey: .subscribers)
    }

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "subscribers": subscribers.map { $0.toMap() } as Any
        ]
    }

    public static func from(map: [String: Any] ) -> SubscriberList {
        return SubscriberList(
            total: map["total"] as! Int,
            subscribers: (map["subscribers"] as! [[String: Any]]).map { Subscriber.from(map: $0) }
        )
    }
}
