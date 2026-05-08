import Foundation
import JSONCodable

/// OAuth2Facebook
open class OAuth2Facebook: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case enabled = "enabled"
        case appId = "appId"
        case appSecret = "appSecret"
    }

    /// OAuth2 provider ID.
    public let id: String
    /// OAuth2 provider is active and can be used to create sessions.
    public let enabled: Bool
    /// Facebook OAuth2 app ID.
    public let appId: String
    /// Facebook OAuth2 app secret.
    public let appSecret: String

    init(
        id: String,
        enabled: Bool,
        appId: String,
        appSecret: String
    ) {
        self.id = id
        self.enabled = enabled
        self.appId = appId
        self.appSecret = appSecret
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decode(String.self, forKey: .id)
        self.enabled = try container.decode(Bool.self, forKey: .enabled)
        self.appId = try container.decode(String.self, forKey: .appId)
        self.appSecret = try container.decode(String.self, forKey: .appSecret)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(enabled, forKey: .enabled)
        try container.encode(appId, forKey: .appId)
        try container.encode(appSecret, forKey: .appSecret)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "enabled": enabled as Any,
            "appId": appId as Any,
            "appSecret": appSecret as Any
        ]
    }

    public static func from(map: [String: Any] ) -> OAuth2Facebook {
        return OAuth2Facebook(
            id: map["$id"] as! String,
            enabled: map["enabled"] as! Bool,
            appId: map["appId"] as! String,
            appSecret: map["appSecret"] as! String
        )
    }
}
