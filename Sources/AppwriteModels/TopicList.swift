import Foundation
import JSONCodable

/// Topic list
public class TopicList {

    /// Total number of topics documents that matched your query.
    public let total: Int

    /// List of topics.
    public let topics: [Topic]


    init(
        total: Int,
        topics: [Topic]
    ) {
        self.total = total
        self.topics = topics
    }

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "topics": topics.map { $0.toMap() } as Any
        ]
    }

    public static func from(map: [String: Any] ) -> TopicList {
        return TopicList(
            total: map["total"] as! Int,
            topics: (map["topics"] as! [[String: Any]]).map { Topic.from(map: $0) }
        )
    }
}
