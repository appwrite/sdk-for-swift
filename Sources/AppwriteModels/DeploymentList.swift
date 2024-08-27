import Foundation
import JSONCodable

/// Deployments List
public class DeploymentList {

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

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "deployments": deployments.map { $0.toMap() } as Any
        ]
    }

    public static func from(map: [String: Any] ) -> DeploymentList {
        return DeploymentList(
            total: map["total"] as! Int,
            deployments: (map["deployments"] as! [[String: Any]]).map { Deployment.from(map: $0) }
        )
    }
}
