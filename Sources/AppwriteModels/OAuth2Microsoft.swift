import Foundation
import JSONCodable

/// OAuth2Microsoft
open class OAuth2Microsoft: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case enabled = "enabled"
        case applicationId = "applicationId"
        case applicationSecret = "applicationSecret"
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
    /// Microsoft Entra ID tenant identifier. Use &#039;common&#039;, &#039;organizations&#039;, &#039;consumers&#039; or a specific tenant ID.
    public let tenant: String

    init(
        id: String,
        enabled: Bool,
        applicationId: String,
        applicationSecret: String,
        tenant: String
    ) {
        self.id = id
        self.enabled = enabled
        self.applicationId = applicationId
        self.applicationSecret = applicationSecret
        self.tenant = tenant
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decode(String.self, forKey: .id)
        self.enabled = try container.decode(Bool.self, forKey: .enabled)
        self.applicationId = try container.decode(String.self, forKey: .applicationId)
        self.applicationSecret = try container.decode(String.self, forKey: .applicationSecret)
        self.tenant = try container.decode(String.self, forKey: .tenant)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(enabled, forKey: .enabled)
        try container.encode(applicationId, forKey: .applicationId)
        try container.encode(applicationSecret, forKey: .applicationSecret)
        try container.encode(tenant, forKey: .tenant)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "enabled": enabled as Any,
            "applicationId": applicationId as Any,
            "applicationSecret": applicationSecret as Any,
            "tenant": tenant as Any
        ]
    }

    public static func from(map: [String: Any] ) -> OAuth2Microsoft {
        return OAuth2Microsoft(
            id: map["$id"] as! String,
            enabled: map["enabled"] as! Bool,
            applicationId: map["applicationId"] as! String,
            applicationSecret: map["applicationSecret"] as! String,
            tenant: map["tenant"] as! String
        )
    }
}
