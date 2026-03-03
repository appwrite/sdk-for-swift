import Foundation
import JSONCodable

/// Archive
open class BackupArchive: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case createdAt = "$createdAt"
        case updatedAt = "$updatedAt"
        case policyId = "policyId"
        case size = "size"
        case status = "status"
        case startedAt = "startedAt"
        case migrationId = "migrationId"
        case services = "services"
        case resources = "resources"
        case resourceId = "resourceId"
        case resourceType = "resourceType"
    }

    /// Archive ID.
    public let id: String
    /// Archive creation time in ISO 8601 format.
    public let createdAt: String
    /// Archive update date in ISO 8601 format.
    public let updatedAt: String
    /// Archive policy ID.
    public let policyId: String
    /// Archive size in bytes.
    public let size: Int
    /// The status of the archive creation. Possible values: pending, processing, uploading, completed, failed.
    public let status: String
    /// The backup start time.
    public let startedAt: String
    /// Migration ID.
    public let migrationId: String
    /// The services that are backed up by this archive.
    public let services: [String]
    /// The resources that are backed up by this archive.
    public let resources: [String]
    /// The resource ID to backup. Set only if this archive should backup a single resource.
    public let resourceId: String?
    /// The resource type to backup. Set only if this archive should backup a single resource.
    public let resourceType: String?

    init(
        id: String,
        createdAt: String,
        updatedAt: String,
        policyId: String,
        size: Int,
        status: String,
        startedAt: String,
        migrationId: String,
        services: [String],
        resources: [String],
        resourceId: String?,
        resourceType: String?
    ) {
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.policyId = policyId
        self.size = size
        self.status = status
        self.startedAt = startedAt
        self.migrationId = migrationId
        self.services = services
        self.resources = resources
        self.resourceId = resourceId
        self.resourceType = resourceType
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decode(String.self, forKey: .id)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
        self.policyId = try container.decode(String.self, forKey: .policyId)
        self.size = try container.decode(Int.self, forKey: .size)
        self.status = try container.decode(String.self, forKey: .status)
        self.startedAt = try container.decode(String.self, forKey: .startedAt)
        self.migrationId = try container.decode(String.self, forKey: .migrationId)
        self.services = try container.decode([String].self, forKey: .services)
        self.resources = try container.decode([String].self, forKey: .resources)
        self.resourceId = try container.decodeIfPresent(String.self, forKey: .resourceId)
        self.resourceType = try container.decodeIfPresent(String.self, forKey: .resourceType)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(updatedAt, forKey: .updatedAt)
        try container.encode(policyId, forKey: .policyId)
        try container.encode(size, forKey: .size)
        try container.encode(status, forKey: .status)
        try container.encode(startedAt, forKey: .startedAt)
        try container.encode(migrationId, forKey: .migrationId)
        try container.encode(services, forKey: .services)
        try container.encode(resources, forKey: .resources)
        try container.encodeIfPresent(resourceId, forKey: .resourceId)
        try container.encodeIfPresent(resourceType, forKey: .resourceType)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "$createdAt": createdAt as Any,
            "$updatedAt": updatedAt as Any,
            "policyId": policyId as Any,
            "size": size as Any,
            "status": status as Any,
            "startedAt": startedAt as Any,
            "migrationId": migrationId as Any,
            "services": services as Any,
            "resources": resources as Any,
            "resourceId": resourceId as Any,
            "resourceType": resourceType as Any
        ]
    }

    public static func from(map: [String: Any] ) -> BackupArchive {
        return BackupArchive(
            id: map["$id"] as! String,
            createdAt: map["$createdAt"] as! String,
            updatedAt: map["$updatedAt"] as! String,
            policyId: map["policyId"] as! String,
            size: map["size"] as! Int,
            status: map["status"] as! String,
            startedAt: map["startedAt"] as! String,
            migrationId: map["migrationId"] as! String,
            services: map["services"] as! [String],
            resources: map["resources"] as! [String],
            resourceId: map["resourceId"] as? String,
            resourceType: map["resourceType"] as? String
        )
    }
}
