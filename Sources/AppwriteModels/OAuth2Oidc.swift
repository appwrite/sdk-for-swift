import Foundation
import JSONCodable

/// OAuth2Oidc
open class OAuth2Oidc: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case enabled = "enabled"
        case clientId = "clientId"
        case clientSecret = "clientSecret"
        case wellKnownURL = "wellKnownURL"
        case authorizationURL = "authorizationURL"
        case tokenURL = "tokenURL"
        case userInfoURL = "userInfoURL"
    }

    /// OAuth2 provider ID.
    public let id: String
    /// OAuth2 provider is active and can be used to create sessions.
    public let enabled: Bool
    /// OpenID Connect OAuth2 client ID.
    public let clientId: String
    /// OpenID Connect OAuth2 client secret.
    public let clientSecret: String
    /// OpenID Connect well-known configuration URL. When set, authorization, token, and user info endpoints can be discovered automatically.
    public let wellKnownURL: String
    /// OpenID Connect authorization endpoint URL.
    public let authorizationURL: String
    /// OpenID Connect token endpoint URL.
    public let tokenURL: String
    /// OpenID Connect user info endpoint URL.
    public let userInfoURL: String

    init(
        id: String,
        enabled: Bool,
        clientId: String,
        clientSecret: String,
        wellKnownURL: String,
        authorizationURL: String,
        tokenURL: String,
        userInfoURL: String
    ) {
        self.id = id
        self.enabled = enabled
        self.clientId = clientId
        self.clientSecret = clientSecret
        self.wellKnownURL = wellKnownURL
        self.authorizationURL = authorizationURL
        self.tokenURL = tokenURL
        self.userInfoURL = userInfoURL
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decode(String.self, forKey: .id)
        self.enabled = try container.decode(Bool.self, forKey: .enabled)
        self.clientId = try container.decode(String.self, forKey: .clientId)
        self.clientSecret = try container.decode(String.self, forKey: .clientSecret)
        self.wellKnownURL = try container.decode(String.self, forKey: .wellKnownURL)
        self.authorizationURL = try container.decode(String.self, forKey: .authorizationURL)
        self.tokenURL = try container.decode(String.self, forKey: .tokenURL)
        self.userInfoURL = try container.decode(String.self, forKey: .userInfoURL)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(enabled, forKey: .enabled)
        try container.encode(clientId, forKey: .clientId)
        try container.encode(clientSecret, forKey: .clientSecret)
        try container.encode(wellKnownURL, forKey: .wellKnownURL)
        try container.encode(authorizationURL, forKey: .authorizationURL)
        try container.encode(tokenURL, forKey: .tokenURL)
        try container.encode(userInfoURL, forKey: .userInfoURL)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "enabled": enabled as Any,
            "clientId": clientId as Any,
            "clientSecret": clientSecret as Any,
            "wellKnownURL": wellKnownURL as Any,
            "authorizationURL": authorizationURL as Any,
            "tokenURL": tokenURL as Any,
            "userInfoURL": userInfoURL as Any
        ]
    }

    public static func from(map: [String: Any] ) -> OAuth2Oidc {
        return OAuth2Oidc(
            id: map["$id"] as! String,
            enabled: map["enabled"] as! Bool,
            clientId: map["clientId"] as! String,
            clientSecret: map["clientSecret"] as! String,
            wellKnownURL: map["wellKnownURL"] as! String,
            authorizationURL: map["authorizationURL"] as! String,
            tokenURL: map["tokenURL"] as! String,
            userInfoURL: map["userInfoURL"] as! String
        )
    }
}
