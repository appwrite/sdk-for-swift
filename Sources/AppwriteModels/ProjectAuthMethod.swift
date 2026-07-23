import Foundation
import JSONCodable
import AppwriteEnums

/// ProjectAuthMethod
open class ProjectAuthMethod: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case enabled = "enabled"
    }

    /// Auth method ID.
    public let id: AppwriteEnums.ProjectAuthMethodId
    /// Auth method status.
    public let enabled: Bool

    init(
        id: AppwriteEnums.ProjectAuthMethodId,
        enabled: Bool
    ) {
        self.id = id
        self.enabled = enabled
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = AppwriteEnums.ProjectAuthMethodId(rawValue: try container.decode(String.self, forKey: .id))!
        self.enabled = try container.decode(Bool.self, forKey: .enabled)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id.rawValue, forKey: .id)
        try container.encode(enabled, forKey: .enabled)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id.rawValue as Any,
            "enabled": enabled as Any
        ]
    }

    public static func from(map: [String: Any] ) -> ProjectAuthMethod {
        return ProjectAuthMethod(
            id: AppwriteEnums.ProjectAuthMethodId(rawValue: map["$id"] as! String)!,
            enabled: map["enabled"] as! Bool
        )
    }
}
