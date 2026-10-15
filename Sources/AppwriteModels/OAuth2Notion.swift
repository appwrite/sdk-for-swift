import Foundation
import JSONCodable

/// OAuth2Notion
open class OAuth2Notion: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case enabled = "enabled"
        case oauthClientId = "oauthClientId"
        case oauthClientSecret = "oauthClientSecret"
    }

    /// OAuth2 provider ID.
    public let id: String
    /// OAuth2 provider is active and can be used to create sessions.
    public let enabled: Bool
    /// Notion OAuth2 client ID.
    public let oauthClientId: String
    /// Notion OAuth2 client secret.
    public let oauthClientSecret: String

    init(
        id: String,
        enabled: Bool,
        oauthClientId: String,
        oauthClientSecret: String
    ) {
        self.id = id
        self.enabled = enabled
        self.oauthClientId = oauthClientId
        self.oauthClientSecret = oauthClientSecret
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.contains(.id) ? container.decode(String.self, forKey: .id) : ""
        self.enabled = try container.contains(.enabled) ? container.decode(Bool.self, forKey: .enabled) : false
        self.oauthClientId = try container.contains(.oauthClientId) ? container.decode(String.self, forKey: .oauthClientId) : ""
        self.oauthClientSecret = try container.contains(.oauthClientSecret) ? container.decode(String.self, forKey: .oauthClientSecret) : ""
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(enabled, forKey: .enabled)
        try container.encode(oauthClientId, forKey: .oauthClientId)
        try container.encode(oauthClientSecret, forKey: .oauthClientSecret)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "enabled": enabled as Any,
            "oauthClientId": oauthClientId as Any,
            "oauthClientSecret": oauthClientSecret as Any,
        ]
    }

    public static func from(map: [String: Any]) -> OAuth2Notion {
        let defaults: [String: Any] = [
            "$id": "",
            "enabled": false,
            "oauthClientId": "",
            "oauthClientSecret": "",
        ]
        let map = defaults.merging(map) { _, new in new }

        return OAuth2Notion(
            id: map["$id"] as! String,
            enabled: map["enabled"] as! Bool,
            oauthClientId: map["oauthClientId"] as! String,
            oauthClientSecret: map["oauthClientSecret"] as! String
        )
    }
}
