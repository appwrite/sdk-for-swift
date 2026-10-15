import AppwriteEnums
import Foundation
import JSONCodable

/// OAuth2Okta
open class OAuth2Okta: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case enabled = "enabled"
        case clientId = "clientId"
        case clientSecret = "clientSecret"
        case prompt = "prompt"
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
    /// Okta OAuth2 prompt values.
    public let prompt: [AppwriteEnums.OAuth2OktaPrompt]
    /// Okta OAuth2 domain.
    public let domain: String
    /// Okta OAuth2 authorization server ID.
    public let authorizationServerId: String

    init(
        id: String,
        enabled: Bool,
        clientId: String,
        clientSecret: String,
        prompt: [AppwriteEnums.OAuth2OktaPrompt],
        domain: String,
        authorizationServerId: String
    ) {
        self.id = id
        self.enabled = enabled
        self.clientId = clientId
        self.clientSecret = clientSecret
        self.prompt = prompt
        self.domain = domain
        self.authorizationServerId = authorizationServerId
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.contains(.id) ? container.decode(String.self, forKey: .id) : ""
        self.enabled = try container.contains(.enabled) ? container.decode(Bool.self, forKey: .enabled) : false
        self.clientId = try container.contains(.clientId) ? container.decode(String.self, forKey: .clientId) : ""
        self.clientSecret = try container.contains(.clientSecret) ? container.decode(String.self, forKey: .clientSecret) : ""
        self.prompt = (try container.contains(.prompt) ? container.decode([String].self, forKey: .prompt) : []).map { AppwriteEnums.OAuth2OktaPrompt(rawValue: $0)! }
        self.domain = try container.contains(.domain) ? container.decode(String.self, forKey: .domain) : ""
        self.authorizationServerId = try container.contains(.authorizationServerId) ? container.decode(String.self, forKey: .authorizationServerId) : ""
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(enabled, forKey: .enabled)
        try container.encode(clientId, forKey: .clientId)
        try container.encode(clientSecret, forKey: .clientSecret)
        try container.encode(prompt.map { $0.rawValue }, forKey: .prompt)
        try container.encode(domain, forKey: .domain)
        try container.encode(authorizationServerId, forKey: .authorizationServerId)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "enabled": enabled as Any,
            "clientId": clientId as Any,
            "clientSecret": clientSecret as Any,
            "prompt": prompt.map { $0.rawValue } as Any,
            "domain": domain as Any,
            "authorizationServerId": authorizationServerId as Any,
        ]
    }

    public static func from(map: [String: Any]) -> OAuth2Okta {
        let defaults: [String: Any] = [
            "$id": "",
            "enabled": false,
            "clientId": "",
            "clientSecret": "",
            "prompt": [Any](),
            "domain": "",
            "authorizationServerId": "",
        ]
        let map = defaults.merging(map) { _, new in new }

        return OAuth2Okta(
            id: map["$id"] as! String,
            enabled: map["enabled"] as! Bool,
            clientId: map["clientId"] as! String,
            clientSecret: map["clientSecret"] as! String,
            prompt: (map["prompt"] as! [String]).map { AppwriteEnums.OAuth2OktaPrompt(rawValue: $0)! },
            domain: map["domain"] as! String,
            authorizationServerId: map["authorizationServerId"] as! String
        )
    }
}
