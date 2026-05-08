import Foundation
import JSONCodable

/// OAuth2Okta
open class OAuth2Okta: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case enabled = "enabled"
        case clientId = "clientId"
        case clientSecret = "clientSecret"
        case domain = "domain"
        case authorizationServerId = "authorizationServerId"
    }

    /// OAuth2 provider ID.
    public let id: String
    /// OAuth2 provider is active and can be used to create sessions.
    public let enabled: Bool
    /// Okta OAuth2 client ID.
    public let clientId: String
    /// Okta OAuth2 client secret.
    public let clientSecret: String
    /// Okta OAuth2 domain.
    public let domain: String
    /// Okta OAuth2 authorization server ID.
    public let authorizationServerId: String

    init(
        id: String,
        enabled: Bool,
        clientId: String,
        clientSecret: String,
        domain: String,
        authorizationServerId: String
    ) {
        self.id = id
        self.enabled = enabled
        self.clientId = clientId
        self.clientSecret = clientSecret
        self.domain = domain
        self.authorizationServerId = authorizationServerId
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decode(String.self, forKey: .id)
        self.enabled = try container.decode(Bool.self, forKey: .enabled)
        self.clientId = try container.decode(String.self, forKey: .clientId)
        self.clientSecret = try container.decode(String.self, forKey: .clientSecret)
        self.domain = try container.decode(String.self, forKey: .domain)
        self.authorizationServerId = try container.decode(String.self, forKey: .authorizationServerId)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(enabled, forKey: .enabled)
        try container.encode(clientId, forKey: .clientId)
        try container.encode(clientSecret, forKey: .clientSecret)
        try container.encode(domain, forKey: .domain)
        try container.encode(authorizationServerId, forKey: .authorizationServerId)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "enabled": enabled as Any,
            "clientId": clientId as Any,
            "clientSecret": clientSecret as Any,
            "domain": domain as Any,
            "authorizationServerId": authorizationServerId as Any
        ]
    }

    public static func from(map: [String: Any] ) -> OAuth2Okta {
        return OAuth2Okta(
            id: map["$id"] as! String,
            enabled: map["enabled"] as! Bool,
            clientId: map["clientId"] as! String,
            clientSecret: map["clientSecret"] as! String,
            domain: map["domain"] as! String,
            authorizationServerId: map["authorizationServerId"] as! String
        )
    }
}
