import Foundation
import JSONCodable

/// Topic
public class Topic {

    /// Topic ID.
    public let id: String

    /// Topic creation time in ISO 8601 format.
    public let createdAt: String

    /// Topic update date in ISO 8601 format.
    public let updatedAt: String

    /// The name of the topic.
    public let name: String

    /// Total count of subscribers subscribed to topic.
    public let total: Int

    /// Description of the topic.
    public let description: String??


    init(
        id: String,
        createdAt: String,
        updatedAt: String,
        name: String,
        total: Int,
        description: String??
    ) {
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.name = name
        self.total = total
        self.description = description
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "$createdAt": createdAt as Any,
            "$updatedAt": updatedAt as Any,
            "name": name as Any,
            "total": total as Any,
            "description": description as Any
        ]
    }

    public static func from(map: [String: Any] ) -> Topic {
        return Topic(
            id: map["$id"] as! String,
            createdAt: map["$createdAt"] as! String,
            updatedAt: map["$updatedAt"] as! String,
            name: map["name"] as! String,
            total: map["total"] as! Int,
            description: map["description"] as? String?
        )
    }
}
