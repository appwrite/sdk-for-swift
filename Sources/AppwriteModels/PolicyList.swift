import Foundation
import JSONCodable

/// Policies List
open class PolicyList: Codable {

    enum CodingKeys: String, CodingKey {
        case total = "total"
        case policies = "policies"
    }

    /// Total number of policies in the given project.
    public let total: Int
    /// List of policies.
    public let policies: [AnyCodable]

    init(
        total: Int,
        policies: [AnyCodable]
    ) {
        self.total = total
        self.policies = policies
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.total = try container.contains(.total) ? container.decode(Int.self, forKey: .total) : 0
        self.policies = try container.decode([AnyCodable].self, forKey: .policies)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(total, forKey: .total)
        try container.encode(policies, forKey: .policies)
    }

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "policies": policies as Any,
        ]
    }

    public static func from(map: [String: Any]) -> PolicyList {
        let defaults: [String: Any] = [
            "total": 0,
        ]
        let map = defaults.merging(map) { _, new in new }

        return PolicyList(
            total: map["total"] as! Int,
            policies: (map["policies"] as! [Any]).map { AnyCodable($0) }
        )
    }
}
