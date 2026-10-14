import AppwriteEnums
import Foundation
import JSONCodable

/// OAuth2Google
open class OAuth2Google: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case enabled = "enabled"
        case clientId = "clientId"
        case clientSecret = "clientSecret"
        case prompt = "prompt"
        case nativeEnabled = "nativeEnabled"
        case nativeClientIds = "nativeClientIds"
    }

    /// OAuth2 provider ID.
    public let id: String
    /// OAuth2 provider is active and can be used to create sessions.
    public let enabled: Bool
    /// Google OAuth2 client ID.
    public let clientId: String
    /// Google OAuth2 client secret.
    public let clientSecret: String
    /// Google OAuth2 prompt values.
    public let prompt: [AppwriteEnums.OAuth2GooglePrompt]
    /// Native Google sign-in is active and can be used to create sessions from an ID token. Independent of enabled, which only controls the browser-based flow.
    public let nativeEnabled: Bool?
    /// Additional OAuth2 client IDs accepted as ID token audiences for native sign-in, next to the client ID.
    public let nativeClientIds: [String]?

    init(
        id: String,
        enabled: Bool,
        clientId: String,
        clientSecret: String,
        prompt: [AppwriteEnums.OAuth2GooglePrompt],
        nativeEnabled: Bool?,
        nativeClientIds: [String]?
    ) {
        self.id = id
        self.enabled = enabled
        self.clientId = clientId
        self.clientSecret = clientSecret
        self.prompt = prompt
        self.nativeEnabled = nativeEnabled
        self.nativeClientIds = nativeClientIds
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decode(String.self, forKey: .id)
        self.enabled = try container.decode(Bool.self, forKey: .enabled)
        self.clientId = try container.decode(String.self, forKey: .clientId)
        self.clientSecret = try container.decode(String.self, forKey: .clientSecret)
        self.prompt = try container.decode([String].self, forKey: .prompt).map { AppwriteEnums.OAuth2GooglePrompt(rawValue: $0)! }
        self.nativeEnabled = try container.decodeIfPresent(Bool.self, forKey: .nativeEnabled)
        self.nativeClientIds = try container.decodeIfPresent([String].self, forKey: .nativeClientIds)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(enabled, forKey: .enabled)
        try container.encode(clientId, forKey: .clientId)
        try container.encode(clientSecret, forKey: .clientSecret)
        try container.encode(prompt.map { $0.rawValue }, forKey: .prompt)
        try container.encodeIfPresent(nativeEnabled, forKey: .nativeEnabled)
        try container.encodeIfPresent(nativeClientIds, forKey: .nativeClientIds)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "enabled": enabled as Any,
            "clientId": clientId as Any,
            "clientSecret": clientSecret as Any,
            "prompt": prompt.map { $0.rawValue } as Any,
            "nativeEnabled": nativeEnabled as Any,
            "nativeClientIds": nativeClientIds as Any,
        ]
    }

    public static func from(map: [String: Any]) -> OAuth2Google {
        return OAuth2Google(
            id: map["$id"] as! String,
            enabled: map["enabled"] as! Bool,
            clientId: map["clientId"] as! String,
            clientSecret: map["clientSecret"] as! String,
            prompt: (map["prompt"] as! [String]).map { AppwriteEnums.OAuth2GooglePrompt(rawValue: $0)! },
            nativeEnabled: map["nativeEnabled"] as? Bool,
            nativeClientIds: map["nativeClientIds"] as? [String]
        )
    }
}
