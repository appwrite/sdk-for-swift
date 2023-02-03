import Foundation
import JSONCodable

/// Deployment
public class Deployment {

    /// Deployment ID.
    public let id: String

    /// Deployment creation date in ISO 8601 format.
    public let createdAt: String

    /// Deployment update date in ISO 8601 format.
    public let updatedAt: String

    /// Resource ID.
    public let resourceId: String

    /// Resource type.
    public let resourceType: String

    /// The entrypoint file to use to execute the deployment code.
    public let entrypoint: String

    /// The code size in bytes.
    public let size: Int

    /// The current build ID.
    public let buildId: String

    /// Whether the deployment should be automatically activated.
    public let activate: Bool

    /// The deployment status. Possible values are &quot;processing&quot;, &quot;building&quot;, &quot;pending&quot;, &quot;ready&quot;, and &quot;failed&quot;.
    public let status: String

    /// The build stdout.
    public let buildStdout: String

    /// The build stderr.
    public let buildStderr: String

    /// The current build time in seconds.
    public let buildTime: Int


    init(
        id: String,
        createdAt: String,
        updatedAt: String,
        resourceId: String,
        resourceType: String,
        entrypoint: String,
        size: Int,
        buildId: String,
        activate: Bool,
        status: String,
        buildStdout: String,
        buildStderr: String,
        buildTime: Int
    ) {
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.resourceId = resourceId
        self.resourceType = resourceType
        self.entrypoint = entrypoint
        self.size = size
        self.buildId = buildId
        self.activate = activate
        self.status = status
        self.buildStdout = buildStdout
        self.buildStderr = buildStderr
        self.buildTime = buildTime
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "$createdAt": createdAt as Any,
            "$updatedAt": updatedAt as Any,
            "resourceId": resourceId as Any,
            "resourceType": resourceType as Any,
            "entrypoint": entrypoint as Any,
            "size": size as Any,
            "buildId": buildId as Any,
            "activate": activate as Any,
            "status": status as Any,
            "buildStdout": buildStdout as Any,
            "buildStderr": buildStderr as Any,
            "buildTime": buildTime as Any
        ]
    }

    public static func from(map: [String: Any] ) -> Deployment {
        return Deployment(
            id: map["$id"] as! String,
            createdAt: map["$createdAt"] as! String,
            updatedAt: map["$updatedAt"] as! String,
            resourceId: map["resourceId"] as! String,
            resourceType: map["resourceType"] as! String,
            entrypoint: map["entrypoint"] as! String,
            size: map["size"] as! Int,
            buildId: map["buildId"] as! String,
            activate: map["activate"] as! Bool,
            status: map["status"] as! String,
            buildStdout: map["buildStdout"] as! String,
            buildStderr: map["buildStderr"] as! String,
            buildTime: map["buildTime"] as! Int
        )
    }
}
