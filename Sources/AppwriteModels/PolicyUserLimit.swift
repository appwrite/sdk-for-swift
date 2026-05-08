import Foundation
import JSONCodable

/// Policy User Limit
open class PolicyUserLimit: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case total = "total"
    }

    /// Policy ID.
    public let id: String
    /// Maximum number of users allowed in the project. A value of 0 means the policy is disabled.
    public let total: Int

    init(
        id: String,
        total: Int
    ) {
        self.id = id
        self.total = total
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decode(String.self, forKey: .id)
        self.total = try container.decode(Int.self, forKey: .total)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(total, forKey: .total)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "total": total as Any
        ]
    }

    public static func from(map: [String: Any] ) -> PolicyUserLimit {
        return PolicyUserLimit(
            id: map["$id"] as! String,
            total: map["total"] as! Int
        )
    }
}
