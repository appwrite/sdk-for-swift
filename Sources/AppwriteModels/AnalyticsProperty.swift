import AppwriteEnums
import Foundation
import JSONCodable

/// AnalyticsProperty
open class AnalyticsProperty: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case createdAt = "$createdAt"
        case updatedAt = "$updatedAt"
        case name = "name"
        case domain = "domain"
        case enabled = "enabled"
        case allowedOrigins = "allowedOrigins"
        case type = "type"
        case identifyUsers = "identifyUsers"
        case accessedAt = "accessedAt"
        case firstAccessedAt = "firstAccessedAt"
    }

    /// Analytics property ID.
    public let id: String
    /// Property creation date in ISO 8601 format.
    public let createdAt: String
    /// Property update date in ISO 8601 format.
    public let updatedAt: String
    /// Human-readable name of the tracked website or application.
    public let name: String
    /// Primary domain being tracked (e.g. example.com). May be empty for mobile and agent properties.
    public let domain: String
    /// Whether tracking is currently active.
    public let enabled: Bool
    /// List of origins allowed to send tracking events. Use [&quot;*&quot;] to allow all. Managed by Appwrite for a property linked to a site, following the site&#039;s production domains.
    public let allowedOrigins: [String]
    /// Kind of product this property tracks. Decides which dashboard panels apply.
    public let type: AppwriteEnums.AnalyticsPropertyType
    /// Whether events sent from a signed-in client session record that user&#039;s ID.
    public let identifyUsers: Bool
    /// Most recent event date in ISO 8601 format. This attribute is only updated again after 24 hours.
    public let accessedAt: String
    /// First event date in ISO 8601 format. Empty until the property receives its first event.
    public let firstAccessedAt: String

    init(
        id: String,
        createdAt: String,
        updatedAt: String,
        name: String,
        domain: String,
        enabled: Bool,
        allowedOrigins: [String],
        type: AppwriteEnums.AnalyticsPropertyType,
        identifyUsers: Bool,
        accessedAt: String,
        firstAccessedAt: String
    ) {
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.name = name
        self.domain = domain
        self.enabled = enabled
        self.allowedOrigins = allowedOrigins
        self.type = type
        self.identifyUsers = identifyUsers
        self.accessedAt = accessedAt
        self.firstAccessedAt = firstAccessedAt
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.contains(.id) ? container.decode(String.self, forKey: .id) : ""
        self.createdAt = try container.contains(.createdAt) ? container.decode(String.self, forKey: .createdAt) : ""
        self.updatedAt = try container.contains(.updatedAt) ? container.decode(String.self, forKey: .updatedAt) : ""
        self.name = try container.contains(.name) ? container.decode(String.self, forKey: .name) : ""
        self.domain = try container.contains(.domain) ? container.decode(String.self, forKey: .domain) : ""
        self.enabled = try container.contains(.enabled) ? container.decode(Bool.self, forKey: .enabled) : true
        self.allowedOrigins = try container.contains(.allowedOrigins) ? container.decode([String].self, forKey: .allowedOrigins) : [
        "*"
    ]
        self.type = AppwriteEnums.AnalyticsPropertyType(rawValue: try container.contains(.type) ? container.decode(String.self, forKey: .type) : "web")!
        self.identifyUsers = try container.contains(.identifyUsers) ? container.decode(Bool.self, forKey: .identifyUsers) : false
        self.accessedAt = try container.contains(.accessedAt) ? container.decode(String.self, forKey: .accessedAt) : ""
        self.firstAccessedAt = try container.contains(.firstAccessedAt) ? container.decode(String.self, forKey: .firstAccessedAt) : ""
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(updatedAt, forKey: .updatedAt)
        try container.encode(name, forKey: .name)
        try container.encode(domain, forKey: .domain)
        try container.encode(enabled, forKey: .enabled)
        try container.encode(allowedOrigins, forKey: .allowedOrigins)
        try container.encode(type.rawValue, forKey: .type)
        try container.encode(identifyUsers, forKey: .identifyUsers)
        try container.encode(accessedAt, forKey: .accessedAt)
        try container.encode(firstAccessedAt, forKey: .firstAccessedAt)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "$createdAt": createdAt as Any,
            "$updatedAt": updatedAt as Any,
            "name": name as Any,
            "domain": domain as Any,
            "enabled": enabled as Any,
            "allowedOrigins": allowedOrigins as Any,
            "type": type.rawValue as Any,
            "identifyUsers": identifyUsers as Any,
            "accessedAt": accessedAt as Any,
            "firstAccessedAt": firstAccessedAt as Any,
        ]
    }

    public static func from(map: [String: Any]) -> AnalyticsProperty {
        let defaults: [String: Any] = [
            "$id": "",
            "$createdAt": "",
            "$updatedAt": "",
            "name": "",
            "domain": "",
            "enabled": true,
            "allowedOrigins": ["*"] as [Any],
            "type": "web",
            "identifyUsers": false,
            "accessedAt": "",
            "firstAccessedAt": "",
        ]
        let map = defaults.merging(map) { _, new in new }

        return AnalyticsProperty(
            id: map["$id"] as! String,
            createdAt: map["$createdAt"] as! String,
            updatedAt: map["$updatedAt"] as! String,
            name: map["name"] as! String,
            domain: map["domain"] as! String,
            enabled: map["enabled"] as! Bool,
            allowedOrigins: map["allowedOrigins"] as! [String],
            type: AppwriteEnums.AnalyticsPropertyType(rawValue: map["type"] as! String)!,
            identifyUsers: map["identifyUsers"] as! Bool,
            accessedAt: map["accessedAt"] as! String,
            firstAccessedAt: map["firstAccessedAt"] as! String
        )
    }
}
