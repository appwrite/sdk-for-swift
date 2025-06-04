import Foundation
import JSONCodable

/// Deployments List
open class DeploymentList: Codable {

    enum CodingKeys: String, CodingKey {
        case total = "total"
        case deployments = "deployments"
    }

    /// Total number of deployments documents that matched your query.
    public let total: Int

    /// List of deployments.
    public let deployments: [Deployment]


    init(
        total: Int,
        deployments: [Deployment]
    ) {
        self.total = total
        self.deployments = deployments
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.total = try container.decode(Int.self, forKey: .total)
        self.deployments = try container.decode([Deployment].self, forKey: .deployments)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(total, forKey: .total)
        try container.encode(deployments, forKey: .deployments)
    }

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "deployments": deployments.map { $0.toMap() } as Any
        ]
    }

    public static func from(map: [String: Any] ) -> DeploymentList {
        return DeploymentList(
            total: map["total"] as? Int ?? 0,
            deployments: (map["deployments"] as? [[String: Any]] ?? []).map { Deployment.from(map: $0) }
        )
    }
}
