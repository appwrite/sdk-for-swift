import Foundation
import JSONCodable

/// OAuth2Stripe
open class OAuth2Stripe: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case enabled = "enabled"
        case clientId = "clientId"
        case apiSecretKey = "apiSecretKey"
    }

    /// OAuth2 provider ID.
    public let id: String
    /// OAuth2 provider is active and can be used to create sessions.
    public let enabled: Bool
    /// Stripe OAuth2 client ID.
    public let clientId: String
    /// Stripe OAuth2 API secret key.
    public let apiSecretKey: String

    init(
        id: String,
        enabled: Bool,
        clientId: String,
        apiSecretKey: String
    ) {
        self.id = id
        self.enabled = enabled
        self.clientId = clientId
        self.apiSecretKey = apiSecretKey
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decode(String.self, forKey: .id)
        self.enabled = try container.decode(Bool.self, forKey: .enabled)
        self.clientId = try container.decode(String.self, forKey: .clientId)
        self.apiSecretKey = try container.decode(String.self, forKey: .apiSecretKey)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(enabled, forKey: .enabled)
        try container.encode(clientId, forKey: .clientId)
        try container.encode(apiSecretKey, forKey: .apiSecretKey)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "enabled": enabled as Any,
            "clientId": clientId as Any,
            "apiSecretKey": apiSecretKey as Any
        ]
    }

    public static func from(map: [String: Any] ) -> OAuth2Stripe {
        return OAuth2Stripe(
            id: map["$id"] as! String,
            enabled: map["enabled"] as! Bool,
            clientId: map["clientId"] as! String,
            apiSecretKey: map["apiSecretKey"] as! String
        )
    }
}
