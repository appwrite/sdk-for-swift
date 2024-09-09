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


    /// Type of deployment.
    public let type: String


    /// Resource ID.
    public let resourceId: String


    /// Resource type.
    public let resourceType: String


    /// The entrypoint file to use to execute the deployment code.
    public let entrypoint: String


    /// The code size in bytes.
    public let size: Int


    /// The build output size in bytes.
    public let buildSize: Int


    /// The current build ID.
    public let buildId: String


    /// Whether the deployment should be automatically activated.
    public let activate: Bool


    /// The deployment status. Possible values are &quot;processing&quot;, &quot;building&quot;, &quot;waiting&quot;, &quot;ready&quot;, and &quot;failed&quot;.
    public let status: String


    /// The build logs.
    public let buildLogs: String


    /// The current build time in seconds.
    public let buildTime: Int


    /// The name of the vcs provider repository
    public let providerRepositoryName: String


    /// The name of the vcs provider repository owner
    public let providerRepositoryOwner: String


    /// The url of the vcs provider repository
    public let providerRepositoryUrl: String


    /// The branch of the vcs repository
    public let providerBranch: String


    /// The commit hash of the vcs commit
    public let providerCommitHash: String


    /// The url of vcs commit author
    public let providerCommitAuthorUrl: String


    /// The name of vcs commit author
    public let providerCommitAuthor: String


    /// The commit message
    public let providerCommitMessage: String


    /// The url of the vcs commit
    public let providerCommitUrl: String


    /// The branch of the vcs repository
    public let providerBranchUrl: String



    init(
        id: String,
        createdAt: String,
        updatedAt: String,
        type: String,
        resourceId: String,
        resourceType: String,
        entrypoint: String,
        size: Int,
        buildSize: Int,
        buildId: String,
        activate: Bool,
        status: String,
        buildLogs: String,
        buildTime: Int,
        providerRepositoryName: String,
        providerRepositoryOwner: String,
        providerRepositoryUrl: String,
        providerBranch: String,
        providerCommitHash: String,
        providerCommitAuthorUrl: String,
        providerCommitAuthor: String,
        providerCommitMessage: String,
        providerCommitUrl: String,
        providerBranchUrl: String
    ) {
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.type = type
        self.resourceId = resourceId
        self.resourceType = resourceType
        self.entrypoint = entrypoint
        self.size = size
        self.buildSize = buildSize
        self.buildId = buildId
        self.activate = activate
        self.status = status
        self.buildLogs = buildLogs
        self.buildTime = buildTime
        self.providerRepositoryName = providerRepositoryName
        self.providerRepositoryOwner = providerRepositoryOwner
        self.providerRepositoryUrl = providerRepositoryUrl
        self.providerBranch = providerBranch
        self.providerCommitHash = providerCommitHash
        self.providerCommitAuthorUrl = providerCommitAuthorUrl
        self.providerCommitAuthor = providerCommitAuthor
        self.providerCommitMessage = providerCommitMessage
        self.providerCommitUrl = providerCommitUrl
        self.providerBranchUrl = providerBranchUrl
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "$createdAt": createdAt as Any,
            "$updatedAt": updatedAt as Any,
            "type": type as Any,
            "resourceId": resourceId as Any,
            "resourceType": resourceType as Any,
            "entrypoint": entrypoint as Any,
            "size": size as Any,
            "buildSize": buildSize as Any,
            "buildId": buildId as Any,
            "activate": activate as Any,
            "status": status as Any,
            "buildLogs": buildLogs as Any,
            "buildTime": buildTime as Any,
            "providerRepositoryName": providerRepositoryName as Any,
            "providerRepositoryOwner": providerRepositoryOwner as Any,
            "providerRepositoryUrl": providerRepositoryUrl as Any,
            "providerBranch": providerBranch as Any,
            "providerCommitHash": providerCommitHash as Any,
            "providerCommitAuthorUrl": providerCommitAuthorUrl as Any,
            "providerCommitAuthor": providerCommitAuthor as Any,
            "providerCommitMessage": providerCommitMessage as Any,
            "providerCommitUrl": providerCommitUrl as Any,
            "providerBranchUrl": providerBranchUrl as Any
        ]
    }

    public static func from(map: [String: Any] ) -> Deployment {
        return Deployment(
            id: map["$id"] as! String,
            createdAt: map["$createdAt"] as! String,
            updatedAt: map["$updatedAt"] as! String,
            type: map["type"] as! String,
            resourceId: map["resourceId"] as! String,
            resourceType: map["resourceType"] as! String,
            entrypoint: map["entrypoint"] as! String,
            size: map["size"] as! Int,
            buildSize: map["buildSize"] as! Int,
            buildId: map["buildId"] as! String,
            activate: map["activate"] as! Bool,
            status: map["status"] as! String,
            buildLogs: map["buildLogs"] as! String,
            buildTime: map["buildTime"] as! Int,
            providerRepositoryName: map["providerRepositoryName"] as! String,
            providerRepositoryOwner: map["providerRepositoryOwner"] as! String,
            providerRepositoryUrl: map["providerRepositoryUrl"] as! String,
            providerBranch: map["providerBranch"] as! String,
            providerCommitHash: map["providerCommitHash"] as! String,
            providerCommitAuthorUrl: map["providerCommitAuthorUrl"] as! String,
            providerCommitAuthor: map["providerCommitAuthor"] as! String,
            providerCommitMessage: map["providerCommitMessage"] as! String,
            providerCommitUrl: map["providerCommitUrl"] as! String,
            providerBranchUrl: map["providerBranchUrl"] as! String
        )
    }
}
