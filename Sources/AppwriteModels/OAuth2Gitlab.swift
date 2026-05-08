import Foundation
import JSONCodable

/// OAuth2Gitlab
open class OAuth2Gitlab: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case enabled = "enabled"
        case applicationId = "applicationId"
        case secret = "secret"
        case endpoint = "endpoint"
    }

    /// OAuth2 provider ID.
    public let id: String
    /// OAuth2 provider is active and can be used to create sessions.
    public let enabled: Bool
    /// GitLab OAuth2 application ID.
    public let applicationId: String
    /// GitLab OAuth2 secret.
    public let secret: String
    /// GitLab OAuth2 endpoint URL. Defaults to https://gitlab.com for self-hosted instances.
    public let endpoint: String

    init(
        id: String,
        enabled: Bool,
        applicationId: String,
        secret: String,
        endpoint: String
    ) {
        self.id = id
        self.enabled = enabled
        self.applicationId = applicationId
        self.secret = secret
        self.endpoint = endpoint
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decode(String.self, forKey: .id)
        self.enabled = try container.decode(Bool.self, forKey: .enabled)
        self.applicationId = try container.decode(String.self, forKey: .applicationId)
        self.secret = try container.decode(String.self, forKey: .secret)
        self.endpoint = try container.decode(String.self, forKey: .endpoint)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(enabled, forKey: .enabled)
        try container.encode(applicationId, forKey: .applicationId)
        try container.encode(secret, forKey: .secret)
        try container.encode(endpoint, forKey: .endpoint)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "enabled": enabled as Any,
            "applicationId": applicationId as Any,
            "secret": secret as Any,
            "endpoint": endpoint as Any
        ]
    }

    public static func from(map: [String: Any] ) -> OAuth2Gitlab {
        return OAuth2Gitlab(
            id: map["$id"] as! String,
            enabled: map["enabled"] as! Bool,
            applicationId: map["applicationId"] as! String,
            secret: map["secret"] as! String,
            endpoint: map["endpoint"] as! String
        )
    }
}
