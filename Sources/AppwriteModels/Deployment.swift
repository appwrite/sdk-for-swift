
/// Deployment
public class Deployment {

    /// Deployment ID.
    public let id: String

    /// Resource ID.
    public let resourceId: String

    /// Resource type.
    public let resourceType: String

    /// The deployment creation date in Unix timestamp.
    public let dateCreated: Int

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
        resourceId: String,
        resourceType: String,
        dateCreated: Int,
        entrypoint: String,
        size: Int,
        buildId: String,
        activate: Bool,
        status: String,
        buildStdout: String,
        buildStderr: String
    ) {
        self.id = id
        self.resourceId = resourceId
        self.resourceType = resourceType
        self.dateCreated = dateCreated
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
            resourceId: map["resourceId"] as! String,
            resourceType: map["resourceType"] as! String,
            dateCreated: map["dateCreated"] as! Int,
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
            "resourceId": resourceId as Any,
            "resourceType": resourceType as Any,
            "dateCreated": dateCreated as Any,
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