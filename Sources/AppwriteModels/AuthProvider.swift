import Foundation
import JSONCodable

/// AuthProvider
open class AuthProvider: Codable {

    enum CodingKeys: String, CodingKey {
        case key = "key"
        case name = "name"
        case appId = "appId"
        case secret = "secret"
        case enabled = "enabled"
    }

    /// Auth Provider.
    public let key: String
    /// Auth Provider name.
    public let name: String
    /// OAuth 2.0 application ID.
    public let appId: String
    /// OAuth 2.0 application secret. Might be JSON string if provider requires extra configuration.
    public let secret: String
    /// Auth Provider is active and can be used to create session.
    public let enabled: Bool

    init(
        key: String,
        name: String,
        appId: String,
        secret: String,
        enabled: Bool
    ) {
        self.key = key
        self.name = name
        self.appId = appId
        self.secret = secret
        self.enabled = enabled
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.key = try container.decode(String.self, forKey: .key)
        self.name = try container.decode(String.self, forKey: .name)
        self.appId = try container.decode(String.self, forKey: .appId)
        self.secret = try container.decode(String.self, forKey: .secret)
        self.enabled = try container.decode(Bool.self, forKey: .enabled)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(key, forKey: .key)
        try container.encode(name, forKey: .name)
        try container.encode(appId, forKey: .appId)
        try container.encode(secret, forKey: .secret)
        try container.encode(enabled, forKey: .enabled)
    }

    public func toMap() -> [String: Any] {
        return [
            "key": key as Any,
            "name": name as Any,
            "appId": appId as Any,
            "secret": secret as Any,
            "enabled": enabled as Any
        ]
    }

    public static func from(map: [String: Any] ) -> AuthProvider {
        return AuthProvider(
            key: map["key"] as! String,
            name: map["name"] as! String,
            appId: map["appId"] as! String,
            secret: map["secret"] as! String,
            enabled: map["enabled"] as! Bool
        )
    }
}
