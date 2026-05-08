import Foundation
import JSONCodable

/// OAuth2Dropbox
open class OAuth2Dropbox: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case enabled = "enabled"
        case appKey = "appKey"
        case appSecret = "appSecret"
    }

    /// OAuth2 provider ID.
    public let id: String
    /// OAuth2 provider is active and can be used to create sessions.
    public let enabled: Bool
    /// Dropbox OAuth2 app key.
    public let appKey: String
    /// Dropbox OAuth2 app secret.
    public let appSecret: String

    init(
        id: String,
        enabled: Bool,
        appKey: String,
        appSecret: String
    ) {
        self.id = id
        self.enabled = enabled
        self.appKey = appKey
        self.appSecret = appSecret
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decode(String.self, forKey: .id)
        self.enabled = try container.decode(Bool.self, forKey: .enabled)
        self.appKey = try container.decode(String.self, forKey: .appKey)
        self.appSecret = try container.decode(String.self, forKey: .appSecret)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(enabled, forKey: .enabled)
        try container.encode(appKey, forKey: .appKey)
        try container.encode(appSecret, forKey: .appSecret)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "enabled": enabled as Any,
            "appKey": appKey as Any,
            "appSecret": appSecret as Any
        ]
    }

    public static func from(map: [String: Any] ) -> OAuth2Dropbox {
        return OAuth2Dropbox(
            id: map["$id"] as! String,
            enabled: map["enabled"] as! Bool,
            appKey: map["appKey"] as! String,
            appSecret: map["appSecret"] as! String
        )
    }
}
