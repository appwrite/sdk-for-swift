import Foundation
import JSONCodable

/// Message
public class Message {

    /// Message ID.
    public let id: String

    /// Message creation time in ISO 8601 format.
    public let createdAt: String

    /// Message update date in ISO 8601 format.
    public let updatedAt: String

    /// Message provider type.
    public let providerType: String

    /// Topic IDs set as recipients.
    public let topics: [Any]

    /// User IDs set as recipients.
    public let users: [Any]

    /// Target IDs set as recipients.
    public let targets: [Any]

    /// The scheduled time for message.
    public let scheduledAt: String?

    /// The time when the message was delivered.
    public let deliveredAt: String?

    /// Delivery errors if any.
    public let deliveryErrors: [Any]?

    /// Number of recipients the message was delivered to.
    public let deliveredTotal: Int

    /// Data of the message.
    public let data: Any

    /// Status of delivery.
    public let status: String


    init(
        id: String,
        createdAt: String,
        updatedAt: String,
        providerType: String,
        topics: [Any],
        users: [Any],
        targets: [Any],
        scheduledAt: String?,
        deliveredAt: String?,
        deliveryErrors: [Any]?,
        deliveredTotal: Int,
        data: Any,
        status: String
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
            "status": status as Any
        ]
    }

    public static func from(map: [String: Any] ) -> Message {
        return Message(
            id: map["$id"] as! String,
            createdAt: map["$createdAt"] as! String,
            updatedAt: map["$updatedAt"] as! String,
            providerType: map["providerType"] as! String,
            topics: map["topics"] as! [Any],
            users: map["users"] as! [Any],
            targets: map["targets"] as! [Any],
            scheduledAt: map["scheduledAt"] as? String,
            deliveredAt: map["deliveredAt"] as? String,
            deliveryErrors: map["deliveryErrors"] as? [Any],
            deliveredTotal: map["deliveredTotal"] as! Int,
            data: map["data"] as! Any,
            status: map["status"] as! String
        )
    }
}
