import Foundation
import JSONCodable

/// OAuth2Dailymotion
open class OAuth2Dailymotion: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case enabled = "enabled"
        case apiKey = "apiKey"
        case apiSecret = "apiSecret"
    }

    /// OAuth2 provider ID.
    public let id: String
    /// OAuth2 provider is active and can be used to create sessions.
    public let enabled: Bool
    /// Dailymotion OAuth2 API key.
    public let apiKey: String
    /// Dailymotion OAuth2 API secret.
    public let apiSecret: String

    init(
        id: String,
        enabled: Bool,
        apiKey: String,
        apiSecret: String
    ) {
        self.id = id
        self.enabled = enabled
        self.apiKey = apiKey
        self.apiSecret = apiSecret
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decode(String.self, forKey: .id)
        self.enabled = try container.decode(Bool.self, forKey: .enabled)
        self.apiKey = try container.decode(String.self, forKey: .apiKey)
        self.apiSecret = try container.decode(String.self, forKey: .apiSecret)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(enabled, forKey: .enabled)
        try container.encode(apiKey, forKey: .apiKey)
        try container.encode(apiSecret, forKey: .apiSecret)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "enabled": enabled as Any,
            "apiKey": apiKey as Any,
            "apiSecret": apiSecret as Any
        ]
    }

    public static func from(map: [String: Any] ) -> OAuth2Dailymotion {
        return OAuth2Dailymotion(
            id: map["$id"] as! String,
            enabled: map["enabled"] as! Bool,
            apiKey: map["apiKey"] as! String,
            apiSecret: map["apiSecret"] as! String
        )
    }
}
