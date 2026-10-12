import Foundation
import JSONCodable

/// OAuth2 Introspection
open class Oauth2Introspection: Codable {

    enum CodingKeys: String, CodingKey {
        case active = "active"
        case token_use = "token_use"
        case token_type = "token_type"
        case scope = "scope"
        case client_id = "client_id"
        case sub = "sub"
        case aud = "aud"
        case iss = "iss"
        case exp = "exp"
        case iat = "iat"
        case jti = "jti"
        case authorization_details = "authorization_details"
    }

    /// Whether the token is currently active. An inactive token carries no other claims (RFC 7662).
    public let active: Bool
    /// Kind of token that was introspected. Can be one of: `access_token` or `refresh_token`.
    public let token_use: String?
    /// OAuth2 token type.
    public let token_type: String?
    /// Space-separated scopes granted to the token.
    public let scope: String?
    /// OAuth2 client ID the token was issued to.
    public let client_id: String?
    /// ID of the user who authorized the token.
    public let sub: String?
    /// Audiences the token is intended for. The first entry is the project API base URL; any further entries are the resource indicators requested at authorization time (RFC 8707).
    public let aud: [String]?
    /// Issuer URL of the token.
    public let iss: String?
    /// Expiration time as a Unix timestamp in seconds.
    public let exp: Int?
    /// Issued-at time as a Unix timestamp in seconds.
    public let iat: Int?
    /// Unique identifier of the token.
    public let jti: String?
    /// Granted RFC 9396 authorization details, restricted to what the user can currently access.
    public let authorization_details: [AnyCodable]?

    init(
        active: Bool,
        token_use: String?,
        token_type: String?,
        scope: String?,
        client_id: String?,
        sub: String?,
        aud: [String]?,
        iss: String?,
        exp: Int?,
        iat: Int?,
        jti: String?,
        authorization_details: [AnyCodable]?
    ) {
        self.active = active
        self.token_use = token_use
        self.token_type = token_type
        self.scope = scope
        self.client_id = client_id
        self.sub = sub
        self.aud = aud
        self.iss = iss
        self.exp = exp
        self.iat = iat
        self.jti = jti
        self.authorization_details = authorization_details
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.active = try container.contains(.active) ? container.decode(Bool.self, forKey: .active) : false
        self.token_use = try container.decodeIfPresent(String.self, forKey: .token_use)
        self.token_type = try container.decodeIfPresent(String.self, forKey: .token_type)
        self.scope = try container.decodeIfPresent(String.self, forKey: .scope)
        self.client_id = try container.decodeIfPresent(String.self, forKey: .client_id)
        self.sub = try container.decodeIfPresent(String.self, forKey: .sub)
        self.aud = try container.decodeIfPresent([String].self, forKey: .aud)
        self.iss = try container.decodeIfPresent(String.self, forKey: .iss)
        self.exp = try container.decodeIfPresent(Int.self, forKey: .exp)
        self.iat = try container.decodeIfPresent(Int.self, forKey: .iat)
        self.jti = try container.decodeIfPresent(String.self, forKey: .jti)
        self.authorization_details = try container.decodeIfPresent([AnyCodable].self, forKey: .authorization_details)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(active, forKey: .active)
        try container.encodeIfPresent(token_use, forKey: .token_use)
        try container.encodeIfPresent(token_type, forKey: .token_type)
        try container.encodeIfPresent(scope, forKey: .scope)
        try container.encodeIfPresent(client_id, forKey: .client_id)
        try container.encodeIfPresent(sub, forKey: .sub)
        try container.encodeIfPresent(aud, forKey: .aud)
        try container.encodeIfPresent(iss, forKey: .iss)
        try container.encodeIfPresent(exp, forKey: .exp)
        try container.encodeIfPresent(iat, forKey: .iat)
        try container.encodeIfPresent(jti, forKey: .jti)
        try container.encodeIfPresent(authorization_details, forKey: .authorization_details)
    }

    public func toMap() -> [String: Any] {
        return [
            "active": active as Any,
            "token_use": token_use as Any,
            "token_type": token_type as Any,
            "scope": scope as Any,
            "client_id": client_id as Any,
            "sub": sub as Any,
            "aud": aud as Any,
            "iss": iss as Any,
            "exp": exp as Any,
            "iat": iat as Any,
            "jti": jti as Any,
            "authorization_details": authorization_details as Any,
        ]
    }

    public static func from(map: [String: Any]) -> Oauth2Introspection {
        let defaults: [String: Any] = [
            "active": false,
        ]
        let map = defaults.merging(map) { _, new in new }

        return Oauth2Introspection(
            active: map["active"] as! Bool,
            token_use: map["token_use"] as? String,
            token_type: map["token_type"] as? String,
            scope: map["scope"] as? String,
            client_id: map["client_id"] as? String,
            sub: map["sub"] as? String,
            aud: map["aud"] as? [String],
            iss: map["iss"] as? String,
            exp: map["exp"] as? Int,
            iat: map["iat"] as? Int,
            jti: map["jti"] as? String,
            authorization_details: (map["authorization_details"] as? [Any] ?? []).map { AnyCodable($0) }
        )
    }
}
