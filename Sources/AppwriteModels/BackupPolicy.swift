import Foundation
import JSONCodable

/// backup
open class BackupPolicy: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case name = "name"
        case createdAt = "$createdAt"
        case updatedAt = "$updatedAt"
        case services = "services"
        case resources = "resources"
        case resourceId = "resourceId"
        case resourceType = "resourceType"
        case retention = "retention"
        case schedule = "schedule"
        case enabled = "enabled"
    }

    /// Backup policy ID.
    public let id: String
    /// Backup policy name.
    public let name: String
    /// Policy creation date in ISO 8601 format.
    public let createdAt: String
    /// Policy update date in ISO 8601 format.
    public let updatedAt: String
    /// The services that are backed up by this policy.
    public let services: [String]
    /// The resources that are backed up by this policy.
    public let resources: [String]
    /// The resource ID to backup. Set only if this policy should backup a single resource.
    public let resourceId: String?
    /// The resource type to backup. Set only if this policy should backup a single resource.
    public let resourceType: String?
    /// How many days to keep the backup before it will be automatically deleted.
    public let retention: Int
    /// Policy backup schedule in CRON format.
    public let schedule: String
    /// Is this policy enabled.
    public let enabled: Bool

    init(
        id: String,
        name: String,
        createdAt: String,
        updatedAt: String,
        services: [String],
        resources: [String],
        resourceId: String?,
        resourceType: String?,
        retention: Int,
        schedule: String,
        enabled: Bool
    ) {
        self.id = id
        self.name = name
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.services = services
        self.resources = resources
        self.resourceId = resourceId
        self.resourceType = resourceType
        self.retention = retention
        self.schedule = schedule
        self.enabled = enabled
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
        self.services = try container.decode([String].self, forKey: .services)
        self.resources = try container.decode([String].self, forKey: .resources)
        self.resourceId = try container.decodeIfPresent(String.self, forKey: .resourceId)
        self.resourceType = try container.decodeIfPresent(String.self, forKey: .resourceType)
        self.retention = try container.decode(Int.self, forKey: .retention)
        self.schedule = try container.decode(String.self, forKey: .schedule)
        self.enabled = try container.decode(Bool.self, forKey: .enabled)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(updatedAt, forKey: .updatedAt)
        try container.encode(services, forKey: .services)
        try container.encode(resources, forKey: .resources)
        try container.encodeIfPresent(resourceId, forKey: .resourceId)
        try container.encodeIfPresent(resourceType, forKey: .resourceType)
        try container.encode(retention, forKey: .retention)
        try container.encode(schedule, forKey: .schedule)
        try container.encode(enabled, forKey: .enabled)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "name": name as Any,
            "$createdAt": createdAt as Any,
            "$updatedAt": updatedAt as Any,
            "services": services as Any,
            "resources": resources as Any,
            "resourceId": resourceId as Any,
            "resourceType": resourceType as Any,
            "retention": retention as Any,
            "schedule": schedule as Any,
            "enabled": enabled as Any
        ]
    }

    public static func from(map: [String: Any] ) -> BackupPolicy {
        return BackupPolicy(
            id: map["$id"] as! String,
            name: map["name"] as! String,
            createdAt: map["$createdAt"] as! String,
            updatedAt: map["$updatedAt"] as! String,
            services: map["services"] as! [String],
            resources: map["resources"] as! [String],
            resourceId: map["resourceId"] as? String,
            resourceType: map["resourceType"] as? String,
            retention: map["retention"] as! Int,
            schedule: map["schedule"] as! String,
            enabled: map["enabled"] as! Bool
        )
    }
}
