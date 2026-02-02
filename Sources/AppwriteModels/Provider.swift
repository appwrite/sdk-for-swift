import Foundation
import JSONCodable

/// Provider
open class Provider: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case createdAt = "$createdAt"
        case updatedAt = "$updatedAt"
        case name = "name"
        case provider = "provider"
        case enabled = "enabled"
        case type = "type"
        case credentials = "credentials"
        case options = "options"
    }

    /// Provider ID.
    public let id: String
    /// Provider creation time in ISO 8601 format.
    public let createdAt: String
    /// Provider update date in ISO 8601 format.
    public let updatedAt: String
    /// The name for the provider instance.
    public let name: String
    /// The name of the provider service.
    public let provider: String
    /// Is provider enabled?
    public let enabled: Bool
    /// Type of provider.
    public let type: String
    /// Provider credentials.
    public let credentials: [String: AnyCodable]
    /// Provider options.
    public let options: [String: AnyCodable]?

    init(
        id: String,
        createdAt: String,
        updatedAt: String,
        name: String,
        provider: String,
        enabled: Bool,
        type: String,
        credentials: [String: AnyCodable],
        options: [String: AnyCodable]?
    ) {
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.name = name
        self.provider = provider
        self.enabled = enabled
        self.type = type
        self.credentials = credentials
        self.options = options
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decode(String.self, forKey: .id)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
        self.name = try container.decode(String.self, forKey: .name)
        self.provider = try container.decode(String.self, forKey: .provider)
        self.enabled = try container.decode(Bool.self, forKey: .enabled)
        self.type = try container.decode(String.self, forKey: .type)
        self.credentials = try container.decode([String: AnyCodable].self, forKey: .credentials)
        self.options = try container.decodeIfPresent([String: AnyCodable].self, forKey: .options)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(updatedAt, forKey: .updatedAt)
        try container.encode(name, forKey: .name)
        try container.encode(provider, forKey: .provider)
        try container.encode(enabled, forKey: .enabled)
        try container.encode(type, forKey: .type)
        try container.encode(credentials, forKey: .credentials)
        try container.encodeIfPresent(options, forKey: .options)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "$createdAt": createdAt as Any,
            "$updatedAt": updatedAt as Any,
            "name": name as Any,
            "provider": provider as Any,
            "enabled": enabled as Any,
            "type": type as Any,
            "credentials": credentials as Any,
            "options": options as Any
        ]
    }

    public static func from(map: [String: Any] ) -> Provider {
        return Provider(
            id: map["$id"] as! String,
            createdAt: map["$createdAt"] as! String,
            updatedAt: map["$updatedAt"] as! String,
            name: map["name"] as! String,
            provider: map["provider"] as! String,
            enabled: map["enabled"] as! Bool,
            type: map["type"] as! String,
            credentials: map["credentials"] as! [String: AnyCodable],
            options: map["options"] as? [String: AnyCodable]
        )
    }
}
