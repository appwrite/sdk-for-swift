import Foundation
import JSONCodable

/// OAuth2Bitbucket
open class OAuth2Bitbucket: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case enabled = "enabled"
        case key = "key"
        case secret = "secret"
    }

    /// OAuth2 provider ID.
    public let id: String
    /// OAuth2 provider is active and can be used to create sessions.
    public let enabled: Bool
    /// Bitbucket OAuth2 key.
    public let key: String
    /// Bitbucket OAuth2 secret.
    public let secret: String

    init(
        id: String,
        enabled: Bool,
        key: String,
        secret: String
    ) {
        self.id = id
        self.enabled = enabled
        self.key = key
        self.secret = secret
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decode(String.self, forKey: .id)
        self.enabled = try container.decode(Bool.self, forKey: .enabled)
        self.key = try container.decode(String.self, forKey: .key)
        self.secret = try container.decode(String.self, forKey: .secret)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(enabled, forKey: .enabled)
        try container.encode(key, forKey: .key)
        try container.encode(secret, forKey: .secret)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "enabled": enabled as Any,
            "key": key as Any,
            "secret": secret as Any
        ]
    }

    public static func from(map: [String: Any] ) -> OAuth2Bitbucket {
        return OAuth2Bitbucket(
            id: map["$id"] as! String,
            enabled: map["enabled"] as! Bool,
            key: map["key"] as! String,
            secret: map["secret"] as! String
        )
    }
}
