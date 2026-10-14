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
    public let prompt: [AppwriteEnums.OAuth2DiscordPrompt]?

    init(
        id: String,
        enabled: Bool,
        clientId: String,
        clientSecret: String,
        prompt: [AppwriteEnums.OAuth2DiscordPrompt]?
    ) {
        self.id = id
        self.enabled = enabled
        self.clientId = clientId
        self.clientSecret = clientSecret
        self.prompt = prompt
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decode(String.self, forKey: .id)
        self.enabled = try container.decode(Bool.self, forKey: .enabled)
        self.clientId = try container.decode(String.self, forKey: .clientId)
        self.clientSecret = try container.decode(String.self, forKey: .clientSecret)
        if let promptStrings = try container.decodeIfPresent([String].self, forKey: .prompt) {
            self.prompt = promptStrings.map { AppwriteEnums.OAuth2DiscordPrompt(rawValue: $0)! }
        } else {
            self.prompt = nil
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(enabled, forKey: .enabled)
        try container.encode(clientId, forKey: .clientId)
        try container.encode(clientSecret, forKey: .clientSecret)
        try container.encodeIfPresent(prompt?.map { $0.rawValue }, forKey: .prompt)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "enabled": enabled as Any,
            "clientId": clientId as Any,
            "clientSecret": clientSecret as Any,
            "prompt": prompt?.map { $0.rawValue } as Any,
        ]
    }

    public static func from(map: [String: Any]) -> OAuth2Discord {
        return OAuth2Discord(
            id: map["$id"] as! String,
            enabled: map["enabled"] as! Bool,
            clientId: map["clientId"] as! String,
            clientSecret: map["clientSecret"] as! String,
            prompt: (map["prompt"] as? [String])?.map { AppwriteEnums.OAuth2DiscordPrompt(rawValue: $0)! }
        )
    }
}
