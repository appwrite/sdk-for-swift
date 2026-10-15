import Foundation
import JSONCodable

/// Topic
open class Topic: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case createdAt = "$createdAt"
        case updatedAt = "$updatedAt"
        case name = "name"
        case emailTotal = "emailTotal"
        case smsTotal = "smsTotal"
        case pushTotal = "pushTotal"
        case subscribe = "subscribe"
        case qos = "qos"
        case expiry = "expiry"
    }

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
    /// MQTT QoS for delivery on this topic. Null lets the subscriber choose their level.
    public let qos: Int?
    /// Message retention in seconds for offline delivery. Null inherits the lowest expiry of the project&#039;s enabled Appwrite providers, or the 7-day ledger window if none sets one.
    public let expiry: Int?

    init(
        id: String,
        createdAt: String,
        updatedAt: String,
        name: String,
        emailTotal: Int,
        smsTotal: Int,
        pushTotal: Int,
        subscribe: [String],
        qos: Int?,
        expiry: Int?
    ) {
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.name = name
        self.emailTotal = emailTotal
        self.smsTotal = smsTotal
        self.pushTotal = pushTotal
        self.subscribe = subscribe
        self.qos = qos
        self.expiry = expiry
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.contains(.id) ? container.decode(String.self, forKey: .id) : ""
        self.createdAt = try container.contains(.createdAt) ? container.decode(String.self, forKey: .createdAt) : ""
        self.updatedAt = try container.contains(.updatedAt) ? container.decode(String.self, forKey: .updatedAt) : ""
        self.name = try container.contains(.name) ? container.decode(String.self, forKey: .name) : ""
        self.emailTotal = try container.contains(.emailTotal) ? container.decode(Int.self, forKey: .emailTotal) : 0
        self.smsTotal = try container.contains(.smsTotal) ? container.decode(Int.self, forKey: .smsTotal) : 0
        self.pushTotal = try container.contains(.pushTotal) ? container.decode(Int.self, forKey: .pushTotal) : 0
        self.subscribe = try container.contains(.subscribe) ? container.decode([String].self, forKey: .subscribe) : [
        "users"
    ]
        self.qos = try container.decodeIfPresent(Int.self, forKey: .qos)
        self.expiry = try container.decodeIfPresent(Int.self, forKey: .expiry)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(updatedAt, forKey: .updatedAt)
        try container.encode(name, forKey: .name)
        try container.encode(emailTotal, forKey: .emailTotal)
        try container.encode(smsTotal, forKey: .smsTotal)
        try container.encode(pushTotal, forKey: .pushTotal)
        try container.encode(subscribe, forKey: .subscribe)
        try container.encodeIfPresent(qos, forKey: .qos)
        try container.encodeIfPresent(expiry, forKey: .expiry)
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
            "subscribe": subscribe as Any,
            "qos": qos as Any,
            "expiry": expiry as Any,
        ]
    }

    public static func from(map: [String: Any]) -> Topic {
        let defaults: [String: Any] = [
            "$id": "",
            "$createdAt": "",
            "$updatedAt": "",
            "name": "",
            "emailTotal": 0,
            "smsTotal": 0,
            "pushTotal": 0,
            "subscribe": ["users"] as [Any],
        ]
        let map = defaults.merging(map) { _, new in new }

        return Topic(
            id: map["$id"] as! String,
            createdAt: map["$createdAt"] as! String,
            updatedAt: map["$updatedAt"] as! String,
            name: map["name"] as! String,
            emailTotal: map["emailTotal"] as! Int,
            smsTotal: map["smsTotal"] as! Int,
            pushTotal: map["pushTotal"] as! Int,
            subscribe: map["subscribe"] as! [String],
            qos: map["qos"] as? Int,
            expiry: map["expiry"] as? Int
        )
    }
}
