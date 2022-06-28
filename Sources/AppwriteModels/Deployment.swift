
/// Deployment
public class Deployment {

    /// Deployment ID.
    public let id: String

    /// Deployment creation date in Unix timestamp.
    public let createdAt: Int

    /// Deployment update date in Unix timestamp.
    public let updatedAt: Int

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

    /// The deployment status.
    public let status: String

    /// The build stdout.
    public let buildStdout: String

    /// The build stderr.
    public let buildStderr: String

    init(
        id: String,
        createdAt: Int,
        updatedAt: Int,
        resourceId: String,
        resourceType: String,
        entrypoint: String,
        size: Int,
        buildId: String,
        activate: Bool,
        status: String,
        buildStdout: String,
        buildStderr: String
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
    }

    public static func from(map: [String: Any]) -> Deployment {
        return Deployment(
            id: map["$id"] as! String,
            createdAt: map["$createdAt"] as! Int,
            updatedAt: map["$updatedAt"] as! Int,
            resourceId: map["resourceId"] as! String,
            resourceType: map["resourceType"] as! String,
            entrypoint: map["entrypoint"] as! String,
            size: map["size"] as! Int,
            buildId: map["buildId"] as! String,
            activate: map["activate"] as! Bool,
            status: map["status"] as! String,
            buildStdout: map["buildStdout"] as! String,
            buildStderr: map["buildStderr"] as! String
        )
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
            "buildStderr": buildStderr as Any
        ]
    }
                                                    
}