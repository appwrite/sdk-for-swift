import Foundation
import JSONCodable

/// OAuth2Linkedin
open class OAuth2Linkedin: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case enabled = "enabled"
        case clientId = "clientId"
        case primaryClientSecret = "primaryClientSecret"
    }

    /// OAuth2 provider ID.
    public let id: String
    /// OAuth2 provider is active and can be used to create sessions.
    public let enabled: Bool
    /// LinkedIn OAuth2 client ID.
    public let clientId: String
    /// LinkedIn OAuth2 primary client secret.
    public let primaryClientSecret: String

    init(
        id: String,
        enabled: Bool,
        clientId: String,
        primaryClientSecret: String
    ) {
        self.id = id
        self.enabled = enabled
        self.clientId = clientId
        self.primaryClientSecret = primaryClientSecret
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decode(String.self, forKey: .id)
        self.enabled = try container.decode(Bool.self, forKey: .enabled)
        self.clientId = try container.decode(String.self, forKey: .clientId)
        self.primaryClientSecret = try container.decode(String.self, forKey: .primaryClientSecret)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(enabled, forKey: .enabled)
        try container.encode(clientId, forKey: .clientId)
        try container.encode(primaryClientSecret, forKey: .primaryClientSecret)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "enabled": enabled as Any,
            "clientId": clientId as Any,
            "primaryClientSecret": primaryClientSecret as Any
        ]
    }

    public static func from(map: [String: Any] ) -> OAuth2Linkedin {
        return OAuth2Linkedin(
            id: map["$id"] as! String,
            enabled: map["enabled"] as! Bool,
            clientId: map["clientId"] as! String,
            primaryClientSecret: map["primaryClientSecret"] as! String
        )
    }
}
