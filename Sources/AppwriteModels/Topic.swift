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
    /// Message retention in seconds for offline delivery.
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

        self.id = try container.decode(String.self, forKey: .id)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
        self.name = try container.decode(String.self, forKey: .name)
        self.emailTotal = try container.decode(Int.self, forKey: .emailTotal)
        self.smsTotal = try container.decode(Int.self, forKey: .smsTotal)
        self.pushTotal = try container.decode(Int.self, forKey: .pushTotal)
        self.subscribe = try container.decode([String].self, forKey: .subscribe)
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
