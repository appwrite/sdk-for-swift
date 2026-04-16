import Foundation
import JSONCodable

/// Webhook
open class Webhook: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case createdAt = "$createdAt"
        case updatedAt = "$updatedAt"
        case name = "name"
        case url = "url"
        case events = "events"
        case tls = "tls"
        case authUsername = "authUsername"
        case authPassword = "authPassword"
        case secret = "secret"
        case enabled = "enabled"
        case logs = "logs"
        case attempts = "attempts"
    }

    /// Webhook ID.
    public let id: String
    /// Webhook creation date in ISO 8601 format.
    public let createdAt: String
    /// Webhook update date in ISO 8601 format.
    public let updatedAt: String
    /// Webhook name.
    public let name: String
    /// Webhook URL endpoint.
    public let url: String
    /// Webhook trigger events.
    public let events: [String]
    /// Indicates if SSL / TLS certificate verification is enabled.
    public let tls: Bool
    /// HTTP basic authentication username.
    public let authUsername: String
    /// HTTP basic authentication password.
    public let authPassword: String
    /// Signature key which can be used to validate incoming webhook payloads. Only returned on creation and secret rotation.
    public let secret: String
    /// Indicates if this webhook is enabled.
    public let enabled: Bool
    /// Webhook error logs from the most recent failure.
    public let logs: String
    /// Number of consecutive failed webhook attempts.
    public let attempts: Int

    init(
        id: String,
        createdAt: String,
        updatedAt: String,
        name: String,
        url: String,
        events: [String],
        tls: Bool,
        authUsername: String,
        authPassword: String,
        secret: String,
        enabled: Bool,
        logs: String,
        attempts: Int
    ) {
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.name = name
        self.url = url
        self.events = events
        self.tls = tls
        self.authUsername = authUsername
        self.authPassword = authPassword
        self.secret = secret
        self.enabled = enabled
        self.logs = logs
        self.attempts = attempts
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decode(String.self, forKey: .id)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
        self.name = try container.decode(String.self, forKey: .name)
        self.url = try container.decode(String.self, forKey: .url)
        self.events = try container.decode([String].self, forKey: .events)
        self.tls = try container.decode(Bool.self, forKey: .tls)
        self.authUsername = try container.decode(String.self, forKey: .authUsername)
        self.authPassword = try container.decode(String.self, forKey: .authPassword)
        self.secret = try container.decode(String.self, forKey: .secret)
        self.enabled = try container.decode(Bool.self, forKey: .enabled)
        self.logs = try container.decode(String.self, forKey: .logs)
        self.attempts = try container.decode(Int.self, forKey: .attempts)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(updatedAt, forKey: .updatedAt)
        try container.encode(name, forKey: .name)
        try container.encode(url, forKey: .url)
        try container.encode(events, forKey: .events)
        try container.encode(tls, forKey: .tls)
        try container.encode(authUsername, forKey: .authUsername)
        try container.encode(authPassword, forKey: .authPassword)
        try container.encode(secret, forKey: .secret)
        try container.encode(enabled, forKey: .enabled)
        try container.encode(logs, forKey: .logs)
        try container.encode(attempts, forKey: .attempts)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "$createdAt": createdAt as Any,
            "$updatedAt": updatedAt as Any,
            "name": name as Any,
            "url": url as Any,
            "events": events as Any,
            "tls": tls as Any,
            "authUsername": authUsername as Any,
            "authPassword": authPassword as Any,
            "secret": secret as Any,
            "enabled": enabled as Any,
            "logs": logs as Any,
            "attempts": attempts as Any
        ]
    }

    public static func from(map: [String: Any] ) -> Webhook {
        return Webhook(
            id: map["$id"] as! String,
            createdAt: map["$createdAt"] as! String,
            updatedAt: map["$updatedAt"] as! String,
            name: map["name"] as! String,
            url: map["url"] as! String,
            events: map["events"] as! [String],
            tls: map["tls"] as! Bool,
            authUsername: map["authUsername"] as! String,
            authPassword: map["authPassword"] as! String,
            secret: map["secret"] as! String,
            enabled: map["enabled"] as! Bool,
            logs: map["logs"] as! String,
            attempts: map["attempts"] as! Int
        )
    }
}
