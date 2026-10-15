import Foundation
import JSONCodable

/// Backup policy list
open class BackupPolicyList: Codable {

    enum CodingKeys: String, CodingKey {
        case total = "total"
        case policies = "policies"
    }

    /// Total number of policies that matched your query.
    public let total: Int
    /// List of policies.
    public let policies: [BackupPolicy]

    init(
        total: Int,
        policies: [BackupPolicy]
    ) {
        self.total = total
        self.policies = policies
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.total = try container.contains(.total) ? container.decode(Int.self, forKey: .total) : 0
        self.policies = try container.contains(.policies) ? container.decode([BackupPolicy].self, forKey: .policies) : []
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(total, forKey: .total)
        try container.encode(policies, forKey: .policies)
    }

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "policies": policies.map { $0.toMap() } as Any,
        ]
    }

    public static func from(map: [String: Any]) -> BackupPolicyList {
        let defaults: [String: Any] = [
            "total": 0,
            "policies": [Any](),
        ]
        let map = defaults.merging(map) { _, new in new }

        return BackupPolicyList(
            total: map["total"] as! Int,
            policies: (map["policies"] as! [[String: Any]]).map { BackupPolicy.from(map: $0) }
        )
    }
}
