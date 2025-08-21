import Foundation
import JSONCodable

/// Topic list
open class TopicList: Codable {

    enum CodingKeys: String, CodingKey {
        case total = "total"
        case topics = "topics"
    }

    /// Total number of topics that matched your query.
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

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.total = try container.decode(Int.self, forKey: .total)
        self.topics = try container.decode([Topic].self, forKey: .topics)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(total, forKey: .total)
        try container.encode(topics, forKey: .topics)
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
