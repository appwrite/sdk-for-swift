import Foundation
import JSONCodable

/// Policy Deny Corporate Email
open class PolicyDenyCorporateEmail: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case enabled = "enabled"
    }

    /// Policy ID.
    public let id: String
    /// Whether the deny non-corporate email policy is enabled.
    public let enabled: Bool

    init(
        id: String,
        enabled: Bool
    ) {
        self.id = id
        self.enabled = enabled
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decode(String.self, forKey: .id)
        self.enabled = try container.decode(Bool.self, forKey: .enabled)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(enabled, forKey: .enabled)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "enabled": enabled as Any
        ]
    }

    public static func from(map: [String: Any] ) -> PolicyDenyCorporateEmail {
        return PolicyDenyCorporateEmail(
            id: map["$id"] as! String,
            enabled: map["enabled"] as! Bool
        )
    }
}
