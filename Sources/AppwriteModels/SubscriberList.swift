import Foundation
import JSONCodable

/// Subscriber list
public class SubscriberList {

    /// Total number of subscribers documents that matched your query.
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
