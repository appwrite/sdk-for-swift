import Foundation
import JSONCodable

/// OAuth2Etsy
open class OAuth2Etsy: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case enabled = "enabled"
        case keyString = "keyString"
        case sharedSecret = "sharedSecret"
    }

    /// OAuth2 provider ID.
    public let id: String
    /// OAuth2 provider is active and can be used to create sessions.
    public let enabled: Bool
    /// Etsy OAuth2 keystring.
    public let keyString: String
    /// Etsy OAuth2 shared secret.
    public let sharedSecret: String

    init(
        id: String,
        enabled: Bool,
        keyString: String,
        sharedSecret: String
    ) {
        self.id = id
        self.enabled = enabled
        self.keyString = keyString
        self.sharedSecret = sharedSecret
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decode(String.self, forKey: .id)
        self.enabled = try container.decode(Bool.self, forKey: .enabled)
        self.keyString = try container.decode(String.self, forKey: .keyString)
        self.sharedSecret = try container.decode(String.self, forKey: .sharedSecret)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(enabled, forKey: .enabled)
        try container.encode(keyString, forKey: .keyString)
        try container.encode(sharedSecret, forKey: .sharedSecret)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "enabled": enabled as Any,
            "keyString": keyString as Any,
            "sharedSecret": sharedSecret as Any
        ]
    }

    public static func from(map: [String: Any] ) -> OAuth2Etsy {
        return OAuth2Etsy(
            id: map["$id"] as! String,
            enabled: map["enabled"] as! Bool,
            keyString: map["keyString"] as! String,
            sharedSecret: map["sharedSecret"] as! String
        )
    }
}
