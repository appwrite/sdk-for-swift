import Foundation
import JSONCodable

/// OAuth2X
open class OAuth2X: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case enabled = "enabled"
        case customerKey = "customerKey"
        case secretKey = "secretKey"
    }

    /// OAuth2 provider ID.
    public let id: String
    /// OAuth2 provider is active and can be used to create sessions.
    public let enabled: Bool
    /// X OAuth2 customer key.
    public let customerKey: String
    /// X OAuth2 secret key.
    public let secretKey: String

    init(
        id: String,
        enabled: Bool,
        customerKey: String,
        secretKey: String
    ) {
        self.id = id
        self.enabled = enabled
        self.customerKey = customerKey
        self.secretKey = secretKey
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decode(String.self, forKey: .id)
        self.enabled = try container.decode(Bool.self, forKey: .enabled)
        self.customerKey = try container.decode(String.self, forKey: .customerKey)
        self.secretKey = try container.decode(String.self, forKey: .secretKey)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(enabled, forKey: .enabled)
        try container.encode(customerKey, forKey: .customerKey)
        try container.encode(secretKey, forKey: .secretKey)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "enabled": enabled as Any,
            "customerKey": customerKey as Any,
            "secretKey": secretKey as Any
        ]
    }

    public static func from(map: [String: Any] ) -> OAuth2X {
        return OAuth2X(
            id: map["$id"] as! String,
            enabled: map["enabled"] as! Bool,
            customerKey: map["customerKey"] as! String,
            secretKey: map["secretKey"] as! String
        )
    }
}
