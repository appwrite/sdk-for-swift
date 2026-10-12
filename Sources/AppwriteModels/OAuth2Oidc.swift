import AppwriteEnums
import Foundation
import JSONCodable

/// OAuth2Oidc
open class OAuth2Oidc: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case enabled = "enabled"
        case clientId = "clientId"
        case clientSecret = "clientSecret"
        case prompt = "prompt"
        case wellKnownURL = "wellKnownURL"
        case authorizationURL = "authorizationURL"
        case tokenURL = "tokenURL"
        case userInfoURL = "userInfoURL"
        case maxAge = "maxAge"
    }

    /// OAuth2 provider ID.
    public let id: String
    /// OAuth2 provider is active and can be used to create sessions.
    public let enabled: Bool
    /// OpenID Connect OAuth2 client ID.
    public let clientId: String
    /// OpenID Connect OAuth2 client secret.
    public let clientSecret: String
    /// OpenID Connect prompt values controlling the authentication and consent screens.
    public let prompt: [AppwriteEnums.OAuth2OidcPrompt]
    /// OpenID Connect well-known configuration URL. When set, authorization, token, and user info endpoints can be discovered automatically.
    public let wellKnownURL: String
    /// OpenID Connect authorization endpoint URL.
    public let authorizationURL: String
    /// OpenID Connect token endpoint URL.
    public let tokenURL: String
    /// OpenID Connect user info endpoint URL.
    public let userInfoURL: String
    /// Maximum authentication age in seconds. When set, the user must have authenticated within this many seconds.
    public let maxAge: Int?

    init(
        id: String,
        enabled: Bool,
        clientId: String,
        clientSecret: String,
        prompt: [AppwriteEnums.OAuth2OidcPrompt],
        wellKnownURL: String,
        authorizationURL: String,
        tokenURL: String,
        userInfoURL: String,
        maxAge: Int?
    ) {
        self.id = id
        self.enabled = enabled
        self.clientId = clientId
        self.clientSecret = clientSecret
        self.prompt = prompt
        self.wellKnownURL = wellKnownURL
        self.authorizationURL = authorizationURL
        self.tokenURL = tokenURL
        self.userInfoURL = userInfoURL
        self.maxAge = maxAge
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.contains(.id) ? container.decode(String.self, forKey: .id) : ""
        self.enabled = try container.contains(.enabled) ? container.decode(Bool.self, forKey: .enabled) : false
        self.clientId = try container.contains(.clientId) ? container.decode(String.self, forKey: .clientId) : ""
        self.clientSecret = try container.contains(.clientSecret) ? container.decode(String.self, forKey: .clientSecret) : ""
        self.prompt = (try container.contains(.prompt) ? container.decode([String].self, forKey: .prompt) : []).map { AppwriteEnums.OAuth2OidcPrompt(rawValue: $0)! }
        self.wellKnownURL = try container.contains(.wellKnownURL) ? container.decode(String.self, forKey: .wellKnownURL) : ""
        self.authorizationURL = try container.contains(.authorizationURL) ? container.decode(String.self, forKey: .authorizationURL) : ""
        self.tokenURL = try container.contains(.tokenURL) ? container.decode(String.self, forKey: .tokenURL) : ""
        self.userInfoURL = try container.contains(.userInfoURL) ? container.decode(String.self, forKey: .userInfoURL) : ""
        self.maxAge = try container.decodeIfPresent(Int.self, forKey: .maxAge)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(enabled, forKey: .enabled)
        try container.encode(clientId, forKey: .clientId)
        try container.encode(clientSecret, forKey: .clientSecret)
        try container.encode(prompt.map { $0.rawValue }, forKey: .prompt)
        try container.encode(wellKnownURL, forKey: .wellKnownURL)
        try container.encode(authorizationURL, forKey: .authorizationURL)
        try container.encode(tokenURL, forKey: .tokenURL)
        try container.encode(userInfoURL, forKey: .userInfoURL)
        try container.encodeIfPresent(maxAge, forKey: .maxAge)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "enabled": enabled as Any,
            "clientId": clientId as Any,
            "clientSecret": clientSecret as Any,
            "prompt": prompt.map { $0.rawValue } as Any,
            "wellKnownURL": wellKnownURL as Any,
            "authorizationURL": authorizationURL as Any,
            "tokenURL": tokenURL as Any,
            "userInfoURL": userInfoURL as Any,
            "maxAge": maxAge as Any,
        ]
    }

    public static func from(map: [String: Any]) -> OAuth2Oidc {
        let defaults: [String: Any] = [
            "$id": "",
            "enabled": false,
            "clientId": "",
            "clientSecret": "",
            "prompt": [Any](),
            "wellKnownURL": "",
            "authorizationURL": "",
            "tokenURL": "",
            "userInfoURL": "",
        ]
        let map = defaults.merging(map) { _, new in new }

        return OAuth2Oidc(
            id: map["$id"] as! String,
            enabled: map["enabled"] as! Bool,
            clientId: map["clientId"] as! String,
            clientSecret: map["clientSecret"] as! String,
            prompt: (map["prompt"] as! [String]).map { AppwriteEnums.OAuth2OidcPrompt(rawValue: $0)! },
            wellKnownURL: map["wellKnownURL"] as! String,
            authorizationURL: map["authorizationURL"] as! String,
            tokenURL: map["tokenURL"] as! String,
            userInfoURL: map["userInfoURL"] as! String,
            maxAge: map["maxAge"] as? Int
        )
    }
}
