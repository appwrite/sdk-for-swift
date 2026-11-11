import Foundation
import JSONCodable

/// Environments list
open class EnvironmentList: Codable {

    enum CodingKeys: String, CodingKey {
        case total = "total"
        case environments = "environments"
    }

    /// Total number of environments that matched your query.
    public let total: Int
    /// List of environments.
    public let environments: [Environment]

    init(
        total: Int,
        environments: [Environment]
    ) {
        self.total = total
        self.environments = environments
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.total = try container.contains(.total) ? container.decode(Int.self, forKey: .total) : 0
        self.environments = try container.contains(.environments) ? container.decode([Environment].self, forKey: .environments) : []
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(total, forKey: .total)
        try container.encode(environments, forKey: .environments)
    }

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "environments": environments.map { $0.toMap() } as Any,
        ]
    }

    public static func from(map: [String: Any]) -> EnvironmentList {
        let defaults: [String: Any] = [
            "total": 0,
            "environments": [Any](),
        ]
        let map = defaults.merging(map) { _, new in new }

        return EnvironmentList(
            total: map["total"] as! Int,
            environments: (map["environments"] as! [[String: Any]]).map { Environment.from(map: $0) }
        )
    }
}
