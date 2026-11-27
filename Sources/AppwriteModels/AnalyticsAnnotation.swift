import Foundation
import JSONCodable

/// AnalyticsAnnotation
open class AnalyticsAnnotation: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case createdAt = "$createdAt"
        case updatedAt = "$updatedAt"
        case propertyId = "propertyId"
        case date = "date"
        case content = "content"
        case userId = "userId"
    }

    /// Annotation ID.
    public let id: String
    /// Annotation creation date in ISO 8601 format.
    public let createdAt: String
    /// Annotation update date in ISO 8601 format.
    public let updatedAt: String
    /// ID of the analytics property the annotation belongs to.
    public let propertyId: String
    /// Point in time the annotation marks, in ISO 8601 format.
    public let date: String
    /// Annotation text.
    public let content: String
    /// ID of the user who created the annotation. Empty when it was created with an API key.
    public let userId: String

    init(
        id: String,
        createdAt: String,
        updatedAt: String,
        propertyId: String,
        date: String,
        content: String,
        userId: String
    ) {
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.propertyId = propertyId
        self.date = date
        self.content = content
        self.userId = userId
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.contains(.id) ? container.decode(String.self, forKey: .id) : ""
        self.createdAt = try container.contains(.createdAt) ? container.decode(String.self, forKey: .createdAt) : ""
        self.updatedAt = try container.contains(.updatedAt) ? container.decode(String.self, forKey: .updatedAt) : ""
        self.propertyId = try container.contains(.propertyId) ? container.decode(String.self, forKey: .propertyId) : ""
        self.date = try container.contains(.date) ? container.decode(String.self, forKey: .date) : ""
        self.content = try container.contains(.content) ? container.decode(String.self, forKey: .content) : ""
        self.userId = try container.contains(.userId) ? container.decode(String.self, forKey: .userId) : ""
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(updatedAt, forKey: .updatedAt)
        try container.encode(propertyId, forKey: .propertyId)
        try container.encode(date, forKey: .date)
        try container.encode(content, forKey: .content)
        try container.encode(userId, forKey: .userId)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "$createdAt": createdAt as Any,
            "$updatedAt": updatedAt as Any,
            "propertyId": propertyId as Any,
            "date": date as Any,
            "content": content as Any,
            "userId": userId as Any,
        ]
    }

    public static func from(map: [String: Any]) -> AnalyticsAnnotation {
        let defaults: [String: Any] = [
            "$id": "",
            "$createdAt": "",
            "$updatedAt": "",
            "propertyId": "",
            "date": "",
            "content": "",
            "userId": "",
        ]
        let map = defaults.merging(map) { _, new in new }

        return AnalyticsAnnotation(
            id: map["$id"] as! String,
            createdAt: map["$createdAt"] as! String,
            updatedAt: map["$updatedAt"] as! String,
            propertyId: map["propertyId"] as! String,
            date: map["date"] as! String,
            content: map["content"] as! String,
            userId: map["userId"] as! String
        )
    }
}
