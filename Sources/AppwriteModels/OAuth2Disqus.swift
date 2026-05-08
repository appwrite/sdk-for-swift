import Foundation
import JSONCodable

/// OAuth2Disqus
open class OAuth2Disqus: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case enabled = "enabled"
        case publicKey = "publicKey"
        case secretKey = "secretKey"
    }

    /// OAuth2 provider ID.
    public let id: String
    /// OAuth2 provider is active and can be used to create sessions.
    public let enabled: Bool
    /// Disqus OAuth2 public key.
    public let publicKey: String
    /// Disqus OAuth2 secret key.
    public let secretKey: String

    init(
        id: String,
        enabled: Bool,
        publicKey: String,
        secretKey: String
    ) {
        self.id = id
        self.enabled = enabled
        self.publicKey = publicKey
        self.secretKey = secretKey
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decode(String.self, forKey: .id)
        self.enabled = try container.decode(Bool.self, forKey: .enabled)
        self.publicKey = try container.decode(String.self, forKey: .publicKey)
        self.secretKey = try container.decode(String.self, forKey: .secretKey)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(enabled, forKey: .enabled)
        try container.encode(publicKey, forKey: .publicKey)
        try container.encode(secretKey, forKey: .secretKey)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "enabled": enabled as Any,
            "publicKey": publicKey as Any,
            "secretKey": secretKey as Any
        ]
    }

    public static func from(map: [String: Any] ) -> OAuth2Disqus {
        return OAuth2Disqus(
            id: map["$id"] as! String,
            enabled: map["enabled"] as! Bool,
            publicKey: map["publicKey"] as! String,
            secretKey: map["secretKey"] as! String
        )
    }
}
