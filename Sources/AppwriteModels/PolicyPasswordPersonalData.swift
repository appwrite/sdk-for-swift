import Foundation
import JSONCodable

/// Policy Password Personal Data
open class PolicyPasswordPersonalData: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case enabled = "enabled"
        case denyList = "denyList"
    }

    /// Policy ID.
    public let id: String
    /// Whether password personal data policy is enabled.
    public let enabled: Bool
    /// Custom terms blocked by case-insensitive substring matching when enabled.
    public let denyList: [String]

    init(
        id: String,
        enabled: Bool,
        denyList: [String]
    ) {
        self.id = id
        self.enabled = enabled
        self.denyList = denyList
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.contains(.id) ? container.decode(String.self, forKey: .id) : ""
        self.enabled = try container.contains(.enabled) ? container.decode(Bool.self, forKey: .enabled) : false
        self.denyList = try container.contains(.denyList) ? container.decode([String].self, forKey: .denyList) : []
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(enabled, forKey: .enabled)
        try container.encode(denyList, forKey: .denyList)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "enabled": enabled as Any,
            "denyList": denyList as Any,
        ]
    }

    public static func from(map: [String: Any]) -> PolicyPasswordPersonalData {
        let defaults: [String: Any] = [
            "$id": "",
            "enabled": false,
            "denyList": [Any](),
        ]
        let map = defaults.merging(map) { _, new in new }

        return PolicyPasswordPersonalData(
            id: map["$id"] as! String,
            enabled: map["enabled"] as! Bool,
            denyList: map["denyList"] as! [String]
        )
    }
}
