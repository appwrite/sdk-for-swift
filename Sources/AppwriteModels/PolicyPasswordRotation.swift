import Foundation
import JSONCodable

/// Policy Password Rotation
open class PolicyPasswordRotation: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case enabled = "enabled"
        case maxAge = "maxAge"
    }

    /// Policy ID.
    public let id: String
    /// Whether expired passwords require a reset before email/password sign-in.
    public let enabled: Bool
    /// Maximum password age in seconds.
    public let maxAge: Int

    init(
        id: String,
        enabled: Bool,
        maxAge: Int
    ) {
        self.id = id
        self.enabled = enabled
        self.maxAge = maxAge
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.contains(.id) ? container.decode(String.self, forKey: .id) : ""
        self.enabled = try container.contains(.enabled) ? container.decode(Bool.self, forKey: .enabled) : false
        self.maxAge = try container.contains(.maxAge) ? container.decode(Int.self, forKey: .maxAge) : 31536000
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(enabled, forKey: .enabled)
        try container.encode(maxAge, forKey: .maxAge)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "enabled": enabled as Any,
            "maxAge": maxAge as Any,
        ]
    }

    public static func from(map: [String: Any]) -> PolicyPasswordRotation {
        let defaults: [String: Any] = [
            "$id": "",
            "enabled": false,
            "maxAge": 31536000,
        ]
        let map = defaults.merging(map) { _, new in new }

        return PolicyPasswordRotation(
            id: map["$id"] as! String,
            enabled: map["enabled"] as! Bool,
            maxAge: map["maxAge"] as! Int
        )
    }
}
