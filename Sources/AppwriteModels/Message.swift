import Foundation
import JSONCodable
import AppwriteEnums

/// Message
open class Message: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case createdAt = "$createdAt"
        case updatedAt = "$updatedAt"
        case providerType = "providerType"
        case topics = "topics"
        case users = "users"
        case targets = "targets"
        case scheduledAt = "scheduledAt"
        case deliveredAt = "deliveredAt"
        case deliveryErrors = "deliveryErrors"
        case deliveredTotal = "deliveredTotal"
        case data = "data"
        case status = "status"
    }

    /// Message ID.
    public let id: String
    /// Message creation time in ISO 8601 format.
    public let createdAt: String
    /// Message update date in ISO 8601 format.
    public let updatedAt: String
    /// Message provider type.
    public let providerType: String
    /// Topic IDs set as recipients.
    public let topics: [String]
    /// User IDs set as recipients.
    public let users: [String]
    /// Target IDs set as recipients.
    public let targets: [String]
    /// The scheduled time for message.
    public let scheduledAt: String?
    /// The time when the message was delivered.
    public let deliveredAt: String?
    /// Delivery errors if any.
    public let deliveryErrors: [String]?
    /// Number of recipients the message was delivered to.
    public let deliveredTotal: Int
    /// Data of the message.
    public let data: [String: AnyCodable]
    /// Status of delivery.
    public let status: AppwriteEnums.MessageStatus

    init(
        id: String,
        createdAt: String,
        updatedAt: String,
        providerType: String,
        topics: [String],
        users: [String],
        targets: [String],
        scheduledAt: String?,
        deliveredAt: String?,
        deliveryErrors: [String]?,
        deliveredTotal: Int,
        data: [String: AnyCodable],
        status: AppwriteEnums.MessageStatus
    ) {
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.providerType = providerType
        self.topics = topics
        self.users = users
        self.targets = targets
        self.scheduledAt = scheduledAt
        self.deliveredAt = deliveredAt
        self.deliveryErrors = deliveryErrors
        self.deliveredTotal = deliveredTotal
        self.data = data
        self.status = status
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decode(String.self, forKey: .id)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
        self.providerType = try container.decode(String.self, forKey: .providerType)
        self.topics = try container.decode([String].self, forKey: .topics)
        self.users = try container.decode([String].self, forKey: .users)
        self.targets = try container.decode([String].self, forKey: .targets)
        self.scheduledAt = try container.decodeIfPresent(String.self, forKey: .scheduledAt)
        self.deliveredAt = try container.decodeIfPresent(String.self, forKey: .deliveredAt)
        self.deliveryErrors = try container.decodeIfPresent([String].self, forKey: .deliveryErrors)
        self.deliveredTotal = try container.decode(Int.self, forKey: .deliveredTotal)
        self.data = try container.decode([String: AnyCodable].self, forKey: .data)
        self.status = AppwriteEnums.MessageStatus(rawValue: try container.decode(String.self, forKey: .status))!
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(updatedAt, forKey: .updatedAt)
        try container.encode(providerType, forKey: .providerType)
        try container.encode(topics, forKey: .topics)
        try container.encode(users, forKey: .users)
        try container.encode(targets, forKey: .targets)
        try container.encodeIfPresent(scheduledAt, forKey: .scheduledAt)
        try container.encodeIfPresent(deliveredAt, forKey: .deliveredAt)
        try container.encodeIfPresent(deliveryErrors, forKey: .deliveryErrors)
        try container.encode(deliveredTotal, forKey: .deliveredTotal)
        try container.encode(data, forKey: .data)
        try container.encode(status.rawValue, forKey: .status)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "$createdAt": createdAt as Any,
            "$updatedAt": updatedAt as Any,
            "providerType": providerType as Any,
            "topics": topics as Any,
            "users": users as Any,
            "targets": targets as Any,
            "scheduledAt": scheduledAt as Any,
            "deliveredAt": deliveredAt as Any,
            "deliveryErrors": deliveryErrors as Any,
            "deliveredTotal": deliveredTotal as Any,
            "data": data as Any,
            "status": status.rawValue as Any
        ]
    }

    public static func from(map: [String: Any] ) -> Message {
        return Message(
            id: map["$id"] as! String,
            createdAt: map["$createdAt"] as! String,
            updatedAt: map["$updatedAt"] as! String,
            providerType: map["providerType"] as! String,
            topics: map["topics"] as! [String],
            users: map["users"] as! [String],
            targets: map["targets"] as! [String],
            scheduledAt: map["scheduledAt"] as? String,
            deliveredAt: map["deliveredAt"] as? String,
            deliveryErrors: map["deliveryErrors"] as? [String],
            deliveredTotal: map["deliveredTotal"] as! Int,
            data: map["data"] as! [String: AnyCodable],
            status: MessageStatus(rawValue: map["status"] as! String)!
        )
    }
}
