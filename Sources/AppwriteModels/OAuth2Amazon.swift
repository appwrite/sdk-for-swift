import Foundation
import JSONCodable

/// OAuth2Amazon
open class OAuth2Amazon: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case enabled = "enabled"
        case clientId = "clientId"
        case clientSecret = "clientSecret"
    }

    /// OAuth2 provider ID.
    public let id: String
    /// OAuth2 provider is active and can be used to create sessions.
    public let enabled: Bool
    /// Amazon OAuth2 client ID.
    public let clientId: String
    /// Amazon OAuth2 client secret.
    public let clientSecret: String

    init(
        id: String,
        enabled: Bool,
        clientId: String,
        clientSecret: String
    ) {
        self.id = id
        self.enabled = enabled
        self.clientId = clientId
        self.clientSecret = clientSecret
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.contains(.id) ? container.decode(String.self, forKey: .id) : ""
        self.enabled = try container.contains(.enabled) ? container.decode(Bool.self, forKey: .enabled) : false
        self.clientId = try container.contains(.clientId) ? container.decode(String.self, forKey: .clientId) : ""
        self.clientSecret = try container.contains(.clientSecret) ? container.decode(String.self, forKey: .clientSecret) : ""
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(enabled, forKey: .enabled)
        try container.encode(clientId, forKey: .clientId)
        try container.encode(clientSecret, forKey: .clientSecret)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "enabled": enabled as Any,
            "clientId": clientId as Any,
            "clientSecret": clientSecret as Any,
        ]
    }

    public static func from(map: [String: Any]) -> OAuth2Amazon {
        let defaults: [String: Any] = [
            "$id": "",
            "enabled": false,
            "clientId": "",
            "clientSecret": "",
        ]
        let map = defaults.merging(map) { _, new in new }

        return OAuth2Amazon(
            id: map["$id"] as! String,
            enabled: map["enabled"] as! Bool,
            clientId: map["clientId"] as! String,
            clientSecret: map["clientSecret"] as! String
        )
    }
}
