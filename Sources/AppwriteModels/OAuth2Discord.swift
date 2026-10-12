import AppwriteEnums
import Foundation
import JSONCodable

/// OAuth2Discord
open class OAuth2Discord: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case enabled = "enabled"
        case clientId = "clientId"
        case clientSecret = "clientSecret"
        case prompt = "prompt"
    }

    /// OAuth2 provider ID.
    public let id: String
    /// OAuth2 provider is active and can be used to create sessions.
    public let enabled: Bool
    /// Discord OAuth2 client ID.
    public let clientId: String
    /// Discord OAuth2 client secret.
    public let clientSecret: String
    /// Discord OAuth2 prompt values.
    public let prompt: [AppwriteEnums.OAuth2DiscordPrompt]

    init(
        id: String,
        enabled: Bool,
        clientId: String,
        clientSecret: String,
        prompt: [AppwriteEnums.OAuth2DiscordPrompt]
    ) {
        self.id = id
        self.enabled = enabled
        self.clientId = clientId
        self.clientSecret = clientSecret
        self.prompt = prompt
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.contains(.id) ? container.decode(String.self, forKey: .id) : ""
        self.enabled = try container.contains(.enabled) ? container.decode(Bool.self, forKey: .enabled) : false
        self.clientId = try container.contains(.clientId) ? container.decode(String.self, forKey: .clientId) : ""
        self.clientSecret = try container.contains(.clientSecret) ? container.decode(String.self, forKey: .clientSecret) : ""
        self.prompt = (try container.contains(.prompt) ? container.decode([String].self, forKey: .prompt) : []).map { AppwriteEnums.OAuth2DiscordPrompt(rawValue: $0)! }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(enabled, forKey: .enabled)
        try container.encode(clientId, forKey: .clientId)
        try container.encode(clientSecret, forKey: .clientSecret)
        try container.encode(prompt.map { $0.rawValue }, forKey: .prompt)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "enabled": enabled as Any,
            "clientId": clientId as Any,
            "clientSecret": clientSecret as Any,
            "prompt": prompt.map { $0.rawValue } as Any,
        ]
    }

    public static func from(map: [String: Any]) -> OAuth2Discord {
        let defaults: [String: Any] = [
            "$id": "",
            "enabled": false,
            "clientId": "",
            "clientSecret": "",
            "prompt": [Any](),
        ]
        let map = defaults.merging(map) { _, new in new }

        return OAuth2Discord(
            id: map["$id"] as! String,
            enabled: map["enabled"] as! Bool,
            clientId: map["clientId"] as! String,
            clientSecret: map["clientSecret"] as! String,
            prompt: (map["prompt"] as! [String]).map { AppwriteEnums.OAuth2DiscordPrompt(rawValue: $0)! }
        )
    }
}
