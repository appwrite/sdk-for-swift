import Foundation
import JSONCodable

/// Deployment
open class Deployment: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case createdAt = "$createdAt"
        case updatedAt = "$updatedAt"
        case type = "type"
        case resourceId = "resourceId"
        case resourceType = "resourceType"
        case entrypoint = "entrypoint"
        case size = "size"
        case buildSize = "buildSize"
        case buildId = "buildId"
        case activate = "activate"
        case status = "status"
        case buildLogs = "buildLogs"
        case buildTime = "buildTime"
        case providerRepositoryName = "providerRepositoryName"
        case providerRepositoryOwner = "providerRepositoryOwner"
        case providerRepositoryUrl = "providerRepositoryUrl"
        case providerBranch = "providerBranch"
        case providerCommitHash = "providerCommitHash"
        case providerCommitAuthorUrl = "providerCommitAuthorUrl"
        case providerCommitAuthor = "providerCommitAuthor"
        case providerCommitMessage = "providerCommitMessage"
        case providerCommitUrl = "providerCommitUrl"
        case providerBranchUrl = "providerBranchUrl"
    }

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

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decode(String.self, forKey: .id)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
        self.type = try container.decode(String.self, forKey: .type)
        self.resourceId = try container.decode(String.self, forKey: .resourceId)
        self.resourceType = try container.decode(String.self, forKey: .resourceType)
        self.entrypoint = try container.decode(String.self, forKey: .entrypoint)
        self.size = try container.decode(Int.self, forKey: .size)
        self.buildSize = try container.decode(Int.self, forKey: .buildSize)
        self.buildId = try container.decode(String.self, forKey: .buildId)
        self.activate = try container.decode(Bool.self, forKey: .activate)
        self.status = try container.decode(String.self, forKey: .status)
        self.buildLogs = try container.decode(String.self, forKey: .buildLogs)
        self.buildTime = try container.decode(Int.self, forKey: .buildTime)
        self.providerRepositoryName = try container.decode(String.self, forKey: .providerRepositoryName)
        self.providerRepositoryOwner = try container.decode(String.self, forKey: .providerRepositoryOwner)
        self.providerRepositoryUrl = try container.decode(String.self, forKey: .providerRepositoryUrl)
        self.providerBranch = try container.decode(String.self, forKey: .providerBranch)
        self.providerCommitHash = try container.decode(String.self, forKey: .providerCommitHash)
        self.providerCommitAuthorUrl = try container.decode(String.self, forKey: .providerCommitAuthorUrl)
        self.providerCommitAuthor = try container.decode(String.self, forKey: .providerCommitAuthor)
        self.providerCommitMessage = try container.decode(String.self, forKey: .providerCommitMessage)
        self.providerCommitUrl = try container.decode(String.self, forKey: .providerCommitUrl)
        self.providerBranchUrl = try container.decode(String.self, forKey: .providerBranchUrl)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(updatedAt, forKey: .updatedAt)
        try container.encode(type, forKey: .type)
        try container.encode(resourceId, forKey: .resourceId)
        try container.encode(resourceType, forKey: .resourceType)
        try container.encode(entrypoint, forKey: .entrypoint)
        try container.encode(size, forKey: .size)
        try container.encode(buildSize, forKey: .buildSize)
        try container.encode(buildId, forKey: .buildId)
        try container.encode(activate, forKey: .activate)
        try container.encode(status, forKey: .status)
        try container.encode(buildLogs, forKey: .buildLogs)
        try container.encode(buildTime, forKey: .buildTime)
        try container.encode(providerRepositoryName, forKey: .providerRepositoryName)
        try container.encode(providerRepositoryOwner, forKey: .providerRepositoryOwner)
        try container.encode(providerRepositoryUrl, forKey: .providerRepositoryUrl)
        try container.encode(providerBranch, forKey: .providerBranch)
        try container.encode(providerCommitHash, forKey: .providerCommitHash)
        try container.encode(providerCommitAuthorUrl, forKey: .providerCommitAuthorUrl)
        try container.encode(providerCommitAuthor, forKey: .providerCommitAuthor)
        try container.encode(providerCommitMessage, forKey: .providerCommitMessage)
        try container.encode(providerCommitUrl, forKey: .providerCommitUrl)
        try container.encode(providerBranchUrl, forKey: .providerBranchUrl)
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
