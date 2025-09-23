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
        case sourceSize = "sourceSize"
        case buildSize = "buildSize"
        case totalSize = "totalSize"
        case buildId = "buildId"
        case activate = "activate"
        case screenshotLight = "screenshotLight"
        case screenshotDark = "screenshotDark"
        case status = "status"
        case buildLogs = "buildLogs"
        case buildDuration = "buildDuration"
        case providerRepositoryName = "providerRepositoryName"
        case providerRepositoryOwner = "providerRepositoryOwner"
        case providerRepositoryUrl = "providerRepositoryUrl"
        case providerCommitHash = "providerCommitHash"
        case providerCommitAuthorUrl = "providerCommitAuthorUrl"
        case providerCommitAuthor = "providerCommitAuthor"
        case providerCommitMessage = "providerCommitMessage"
        case providerCommitUrl = "providerCommitUrl"
        case providerBranch = "providerBranch"
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
    public let sourceSize: Int

    /// The build output size in bytes.
    public let buildSize: Int

    /// The total size in bytes (source and build output).
    public let totalSize: Int

    /// The current build ID.
    public let buildId: String

    /// Whether the deployment should be automatically activated.
    public let activate: Bool

    /// Screenshot with light theme preference file ID.
    public let screenshotLight: String

    /// Screenshot with dark theme preference file ID.
    public let screenshotDark: String

    /// The deployment status. Possible values are &quot;waiting&quot;, &quot;processing&quot;, &quot;building&quot;, &quot;ready&quot;, and &quot;failed&quot;.
    public let status: String

    /// The build logs.
    public let buildLogs: String

    /// The current build time in seconds.
    public let buildDuration: Int

    /// The name of the vcs provider repository
    public let providerRepositoryName: String

    /// The name of the vcs provider repository owner
    public let providerRepositoryOwner: String

    /// The url of the vcs provider repository
    public let providerRepositoryUrl: String

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
    public let providerBranch: String

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
        sourceSize: Int,
        buildSize: Int,
        totalSize: Int,
        buildId: String,
        activate: Bool,
        screenshotLight: String,
        screenshotDark: String,
        status: String,
        buildLogs: String,
        buildDuration: Int,
        providerRepositoryName: String,
        providerRepositoryOwner: String,
        providerRepositoryUrl: String,
        providerCommitHash: String,
        providerCommitAuthorUrl: String,
        providerCommitAuthor: String,
        providerCommitMessage: String,
        providerCommitUrl: String,
        providerBranch: String,
        providerBranchUrl: String
    ) {
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.type = type
        self.resourceId = resourceId
        self.resourceType = resourceType
        self.entrypoint = entrypoint
        self.sourceSize = sourceSize
        self.buildSize = buildSize
        self.totalSize = totalSize
        self.buildId = buildId
        self.activate = activate
        self.screenshotLight = screenshotLight
        self.screenshotDark = screenshotDark
        self.status = status
        self.buildLogs = buildLogs
        self.buildDuration = buildDuration
        self.providerRepositoryName = providerRepositoryName
        self.providerRepositoryOwner = providerRepositoryOwner
        self.providerRepositoryUrl = providerRepositoryUrl
        self.providerCommitHash = providerCommitHash
        self.providerCommitAuthorUrl = providerCommitAuthorUrl
        self.providerCommitAuthor = providerCommitAuthor
        self.providerCommitMessage = providerCommitMessage
        self.providerCommitUrl = providerCommitUrl
        self.providerBranch = providerBranch
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
        self.sourceSize = try container.decode(Int.self, forKey: .sourceSize)
        self.buildSize = try container.decode(Int.self, forKey: .buildSize)
        self.totalSize = try container.decode(Int.self, forKey: .totalSize)
        self.buildId = try container.decode(String.self, forKey: .buildId)
        self.activate = try container.decode(Bool.self, forKey: .activate)
        self.screenshotLight = try container.decode(String.self, forKey: .screenshotLight)
        self.screenshotDark = try container.decode(String.self, forKey: .screenshotDark)
        self.status = try container.decode(String.self, forKey: .status)
        self.buildLogs = try container.decode(String.self, forKey: .buildLogs)
        self.buildDuration = try container.decode(Int.self, forKey: .buildDuration)
        self.providerRepositoryName = try container.decode(String.self, forKey: .providerRepositoryName)
        self.providerRepositoryOwner = try container.decode(String.self, forKey: .providerRepositoryOwner)
        self.providerRepositoryUrl = try container.decode(String.self, forKey: .providerRepositoryUrl)
        self.providerCommitHash = try container.decode(String.self, forKey: .providerCommitHash)
        self.providerCommitAuthorUrl = try container.decode(String.self, forKey: .providerCommitAuthorUrl)
        self.providerCommitAuthor = try container.decode(String.self, forKey: .providerCommitAuthor)
        self.providerCommitMessage = try container.decode(String.self, forKey: .providerCommitMessage)
        self.providerCommitUrl = try container.decode(String.self, forKey: .providerCommitUrl)
        self.providerBranch = try container.decode(String.self, forKey: .providerBranch)
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
        try container.encode(sourceSize, forKey: .sourceSize)
        try container.encode(buildSize, forKey: .buildSize)
        try container.encode(totalSize, forKey: .totalSize)
        try container.encode(buildId, forKey: .buildId)
        try container.encode(activate, forKey: .activate)
        try container.encode(screenshotLight, forKey: .screenshotLight)
        try container.encode(screenshotDark, forKey: .screenshotDark)
        try container.encode(status, forKey: .status)
        try container.encode(buildLogs, forKey: .buildLogs)
        try container.encode(buildDuration, forKey: .buildDuration)
        try container.encode(providerRepositoryName, forKey: .providerRepositoryName)
        try container.encode(providerRepositoryOwner, forKey: .providerRepositoryOwner)
        try container.encode(providerRepositoryUrl, forKey: .providerRepositoryUrl)
        try container.encode(providerCommitHash, forKey: .providerCommitHash)
        try container.encode(providerCommitAuthorUrl, forKey: .providerCommitAuthorUrl)
        try container.encode(providerCommitAuthor, forKey: .providerCommitAuthor)
        try container.encode(providerCommitMessage, forKey: .providerCommitMessage)
        try container.encode(providerCommitUrl, forKey: .providerCommitUrl)
        try container.encode(providerBranch, forKey: .providerBranch)
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
            "sourceSize": sourceSize as Any,
            "buildSize": buildSize as Any,
            "totalSize": totalSize as Any,
            "buildId": buildId as Any,
            "activate": activate as Any,
            "screenshotLight": screenshotLight as Any,
            "screenshotDark": screenshotDark as Any,
            "status": status as Any,
            "buildLogs": buildLogs as Any,
            "buildDuration": buildDuration as Any,
            "providerRepositoryName": providerRepositoryName as Any,
            "providerRepositoryOwner": providerRepositoryOwner as Any,
            "providerRepositoryUrl": providerRepositoryUrl as Any,
            "providerCommitHash": providerCommitHash as Any,
            "providerCommitAuthorUrl": providerCommitAuthorUrl as Any,
            "providerCommitAuthor": providerCommitAuthor as Any,
            "providerCommitMessage": providerCommitMessage as Any,
            "providerCommitUrl": providerCommitUrl as Any,
            "providerBranch": providerBranch as Any,
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
            sourceSize: map["sourceSize"] as! Int,
            buildSize: map["buildSize"] as! Int,
            totalSize: map["totalSize"] as! Int,
            buildId: map["buildId"] as! String,
            activate: map["activate"] as! Bool,
            screenshotLight: map["screenshotLight"] as! String,
            screenshotDark: map["screenshotDark"] as! String,
            status: map["status"] as! String,
            buildLogs: map["buildLogs"] as! String,
            buildDuration: map["buildDuration"] as! Int,
            providerRepositoryName: map["providerRepositoryName"] as! String,
            providerRepositoryOwner: map["providerRepositoryOwner"] as! String,
            providerRepositoryUrl: map["providerRepositoryUrl"] as! String,
            providerCommitHash: map["providerCommitHash"] as! String,
            providerCommitAuthorUrl: map["providerCommitAuthorUrl"] as! String,
            providerCommitAuthor: map["providerCommitAuthor"] as! String,
            providerCommitMessage: map["providerCommitMessage"] as! String,
            providerCommitUrl: map["providerCommitUrl"] as! String,
            providerBranch: map["providerBranch"] as! String,
            providerBranchUrl: map["providerBranchUrl"] as! String
        )
    }
}
