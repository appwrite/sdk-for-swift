import Foundation
import JSONCodable

/// OAuth2Tradeshift
open class OAuth2Tradeshift: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case enabled = "enabled"
        case oauth2ClientId = "oauth2ClientId"
        case oauth2ClientSecret = "oauth2ClientSecret"
    }

    /// OAuth2 provider ID.
    public let id: String
    /// OAuth2 provider is active and can be used to create sessions.
    public let enabled: Bool
    /// Tradeshift OAuth2 client ID.
    public let oauth2ClientId: String
    /// Tradeshift OAuth2 client secret.
    public let oauth2ClientSecret: String

    init(
        id: String,
        enabled: Bool,
        oauth2ClientId: String,
        oauth2ClientSecret: String
    ) {
        self.id = id
        self.enabled = enabled
        self.oauth2ClientId = oauth2ClientId
        self.oauth2ClientSecret = oauth2ClientSecret
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decode(String.self, forKey: .id)
        self.enabled = try container.decode(Bool.self, forKey: .enabled)
        self.oauth2ClientId = try container.decode(String.self, forKey: .oauth2ClientId)
        self.oauth2ClientSecret = try container.decode(String.self, forKey: .oauth2ClientSecret)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(enabled, forKey: .enabled)
        try container.encode(oauth2ClientId, forKey: .oauth2ClientId)
        try container.encode(oauth2ClientSecret, forKey: .oauth2ClientSecret)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "enabled": enabled as Any,
            "oauth2ClientId": oauth2ClientId as Any,
            "oauth2ClientSecret": oauth2ClientSecret as Any
        ]
    }

    public static func from(map: [String: Any] ) -> OAuth2Tradeshift {
        return OAuth2Tradeshift(
            id: map["$id"] as! String,
            enabled: map["enabled"] as! Bool,
            oauth2ClientId: map["oauth2ClientId"] as! String,
            oauth2ClientSecret: map["oauth2ClientSecret"] as! String
        )
    }
}
