import Foundation
import JSONCodable

/// OAuth2Auth0
open class OAuth2Auth0: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case enabled = "enabled"
        case clientId = "clientId"
        case clientSecret = "clientSecret"
        case endpoint = "endpoint"
    }

    /// OAuth2 provider ID.
    public let id: String
    /// OAuth2 provider is active and can be used to create sessions.
    public let enabled: Bool
    /// Auth0 OAuth2 client ID.
    public let clientId: String
    /// Auth0 OAuth2 client secret.
    public let clientSecret: String
    /// Auth0 OAuth2 endpoint domain.
    public let endpoint: String

    init(
        id: String,
        enabled: Bool,
        clientId: String,
        clientSecret: String,
        endpoint: String
    ) {
        self.id = id
        self.enabled = enabled
        self.clientId = clientId
        self.clientSecret = clientSecret
        self.endpoint = endpoint
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decode(String.self, forKey: .id)
        self.enabled = try container.decode(Bool.self, forKey: .enabled)
        self.clientId = try container.decode(String.self, forKey: .clientId)
        self.clientSecret = try container.decode(String.self, forKey: .clientSecret)
        self.endpoint = try container.decode(String.self, forKey: .endpoint)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(enabled, forKey: .enabled)
        try container.encode(clientId, forKey: .clientId)
        try container.encode(clientSecret, forKey: .clientSecret)
        try container.encode(endpoint, forKey: .endpoint)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "enabled": enabled as Any,
            "clientId": clientId as Any,
            "clientSecret": clientSecret as Any,
            "endpoint": endpoint as Any
        ]
    }

    public static func from(map: [String: Any] ) -> OAuth2Auth0 {
        return OAuth2Auth0(
            id: map["$id"] as! String,
            enabled: map["enabled"] as! Bool,
            clientId: map["clientId"] as! String,
            clientSecret: map["clientSecret"] as! String,
            endpoint: map["endpoint"] as! String
        )
    }
}
