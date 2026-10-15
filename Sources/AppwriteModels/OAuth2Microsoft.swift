import AppwriteEnums
import Foundation
import JSONCodable

/// OAuth2Microsoft
open class OAuth2Microsoft: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case enabled = "enabled"
        case applicationId = "applicationId"
        case applicationSecret = "applicationSecret"
        case prompt = "prompt"
        case tenant = "tenant"
    }

    /// OAuth2 provider ID.
    public let id: String
    /// OAuth2 provider is active and can be used to create sessions.
    public let enabled: Bool
    /// Microsoft OAuth2 application ID.
    public let applicationId: String
    /// Microsoft OAuth2 application secret.
    public let applicationSecret: String
    /// Microsoft OAuth2 prompt values.
    public let prompt: [AppwriteEnums.OAuth2MicrosoftPrompt]
    /// Microsoft Entra ID tenant identifier. Use &#039;common&#039;, &#039;organizations&#039;, &#039;consumers&#039; or a specific tenant ID.
    public let tenant: String

    init(
        id: String,
        enabled: Bool,
        applicationId: String,
        applicationSecret: String,
        prompt: [AppwriteEnums.OAuth2MicrosoftPrompt],
        tenant: String
    ) {
        self.id = id
        self.enabled = enabled
        self.applicationId = applicationId
        self.applicationSecret = applicationSecret
        self.prompt = prompt
        self.tenant = tenant
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.contains(.id) ? container.decode(String.self, forKey: .id) : ""
        self.enabled = try container.contains(.enabled) ? container.decode(Bool.self, forKey: .enabled) : false
        self.applicationId = try container.contains(.applicationId) ? container.decode(String.self, forKey: .applicationId) : ""
        self.applicationSecret = try container.contains(.applicationSecret) ? container.decode(String.self, forKey: .applicationSecret) : ""
        self.prompt = (try container.contains(.prompt) ? container.decode([String].self, forKey: .prompt) : []).map { AppwriteEnums.OAuth2MicrosoftPrompt(rawValue: $0)! }
        self.tenant = try container.contains(.tenant) ? container.decode(String.self, forKey: .tenant) : ""
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(enabled, forKey: .enabled)
        try container.encode(applicationId, forKey: .applicationId)
        try container.encode(applicationSecret, forKey: .applicationSecret)
        try container.encode(prompt.map { $0.rawValue }, forKey: .prompt)
        try container.encode(tenant, forKey: .tenant)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "enabled": enabled as Any,
            "applicationId": applicationId as Any,
            "applicationSecret": applicationSecret as Any,
            "prompt": prompt.map { $0.rawValue } as Any,
            "tenant": tenant as Any,
        ]
    }

    public static func from(map: [String: Any]) -> OAuth2Microsoft {
        let defaults: [String: Any] = [
            "$id": "",
            "enabled": false,
            "applicationId": "",
            "applicationSecret": "",
            "prompt": [Any](),
            "tenant": "",
        ]
        let map = defaults.merging(map) { _, new in new }

        return OAuth2Microsoft(
            id: map["$id"] as! String,
            enabled: map["enabled"] as! Bool,
            applicationId: map["applicationId"] as! String,
            applicationSecret: map["applicationSecret"] as! String,
            prompt: (map["prompt"] as! [String]).map { AppwriteEnums.OAuth2MicrosoftPrompt(rawValue: $0)! },
            tenant: map["tenant"] as! String
        )
    }
}
