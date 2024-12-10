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

    /// Total count of email subscribers subscribed to the topic.
    public let emailTotal: Int

    /// Total count of SMS subscribers subscribed to the topic.
    public let smsTotal: Int

    /// Total count of push subscribers subscribed to the topic.
    public let pushTotal: Int

    /// Subscribe permissions.
    public let subscribe: [String]


    init(
        id: String,
        createdAt: String,
        updatedAt: String,
        name: String,
        emailTotal: Int,
        smsTotal: Int,
        pushTotal: Int,
        subscribe: [String]
    ) {
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.name = name
        self.emailTotal = emailTotal
        self.smsTotal = smsTotal
        self.pushTotal = pushTotal
        self.subscribe = subscribe
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "$createdAt": createdAt as Any,
            "$updatedAt": updatedAt as Any,
            "name": name as Any,
            "emailTotal": emailTotal as Any,
            "smsTotal": smsTotal as Any,
            "pushTotal": pushTotal as Any,
            "subscribe": subscribe as Any
        ]
    }

    public static func from(map: [String: Any] ) -> Topic {
        return Topic(
            id: map["$id"] as! String,
            createdAt: map["$createdAt"] as! String,
            updatedAt: map["$updatedAt"] as! String,
            name: map["name"] as! String,
            emailTotal: map["emailTotal"] as! Int,
            smsTotal: map["smsTotal"] as! Int,
            pushTotal: map["pushTotal"] as! Int,
            subscribe: map["subscribe"] as! [String]
        )
    }
}
