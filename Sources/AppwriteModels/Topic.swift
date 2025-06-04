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
            id: map["$id"] as? String ?? "",
            createdAt: map["$createdAt"] as? String ?? "",
            updatedAt: map["$updatedAt"] as? String ?? "",
            name: map["name"] as? String ?? "",
            emailTotal: map["emailTotal"] as? Int ?? 0,
            smsTotal: map["smsTotal"] as? Int ?? 0,
            pushTotal: map["pushTotal"] as? Int ?? 0,
            subscribe: map["subscribe"] as? [String] ?? []
        )
    }
}
