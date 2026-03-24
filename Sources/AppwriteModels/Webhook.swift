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
        case security = "security"
        case httpUser = "httpUser"
        case httpPass = "httpPass"
        case signatureKey = "signatureKey"
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
    /// Indicated if SSL / TLS Certificate verification is enabled.
    public let security: Bool
    /// HTTP basic authentication username.
    public let httpUser: String
    /// HTTP basic authentication password.
    public let httpPass: String
    /// Signature key which can be used to validated incoming
    public let signatureKey: String
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
        security: Bool,
        httpUser: String,
        httpPass: String,
        signatureKey: String,
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
        self.security = security
        self.httpUser = httpUser
        self.httpPass = httpPass
        self.signatureKey = signatureKey
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
        self.security = try container.decode(Bool.self, forKey: .security)
        self.httpUser = try container.decode(String.self, forKey: .httpUser)
        self.httpPass = try container.decode(String.self, forKey: .httpPass)
        self.signatureKey = try container.decode(String.self, forKey: .signatureKey)
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
        try container.encode(security, forKey: .security)
        try container.encode(httpUser, forKey: .httpUser)
        try container.encode(httpPass, forKey: .httpPass)
        try container.encode(signatureKey, forKey: .signatureKey)
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
            "security": security as Any,
            "httpUser": httpUser as Any,
            "httpPass": httpPass as Any,
            "signatureKey": signatureKey as Any,
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
            security: map["security"] as! Bool,
            httpUser: map["httpUser"] as! String,
            httpPass: map["httpPass"] as! String,
            signatureKey: map["signatureKey"] as! String,
            enabled: map["enabled"] as! Bool,
            logs: map["logs"] as! String,
            attempts: map["attempts"] as! Int
        )
    }
}
