import Foundation
import JSONCodable

/// OAuth2Paypal
open class OAuth2Paypal: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case enabled = "enabled"
        case clientId = "clientId"
        case secretKey = "secretKey"
    }

    /// OAuth2 provider ID.
    public let id: String
    /// OAuth2 provider is active and can be used to create sessions.
    public let enabled: Bool
    /// PayPal OAuth2 client ID.
    public let clientId: String
    /// PayPal OAuth2 secret key.
    public let secretKey: String

    init(
        id: String,
        enabled: Bool,
        clientId: String,
        secretKey: String
    ) {
        self.id = id
        self.enabled = enabled
        self.clientId = clientId
        self.secretKey = secretKey
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decode(String.self, forKey: .id)
        self.enabled = try container.decode(Bool.self, forKey: .enabled)
        self.clientId = try container.decode(String.self, forKey: .clientId)
        self.secretKey = try container.decode(String.self, forKey: .secretKey)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(enabled, forKey: .enabled)
        try container.encode(clientId, forKey: .clientId)
        try container.encode(secretKey, forKey: .secretKey)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "enabled": enabled as Any,
            "clientId": clientId as Any,
            "secretKey": secretKey as Any
        ]
    }

    public static func from(map: [String: Any] ) -> OAuth2Paypal {
        return OAuth2Paypal(
            id: map["$id"] as! String,
            enabled: map["enabled"] as! Bool,
            clientId: map["clientId"] as! String,
            secretKey: map["secretKey"] as! String
        )
    }
}
