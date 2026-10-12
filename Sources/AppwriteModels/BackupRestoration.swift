import Foundation
import JSONCodable

/// Restoration
open class BackupRestoration: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case createdAt = "$createdAt"
        case updatedAt = "$updatedAt"
        case archiveId = "archiveId"
        case policyId = "policyId"
        case status = "status"
        case startedAt = "startedAt"
        case migrationId = "migrationId"
        case services = "services"
        case resources = "resources"
        case options = "options"
    }

    /// Restoration ID.
    public let id: String
    /// Restoration creation time in ISO 8601 format.
    public let createdAt: String
    /// Restoration update date in ISO 8601 format.
    public let updatedAt: String
    /// Backup archive ID.
    public let archiveId: String
    /// Backup policy ID.
    public let policyId: String
    /// The status of the restoration. Possible values: pending, downloading, processing, completed, failed.
    public let status: String
    /// The restoration start time. Null until the restoration starts.
    public let startedAt: String?
    /// Migration ID.
    public let migrationId: String
    /// The services that are backed up by this policy.
    public let services: [String]
    /// The resources that are backed up by this policy.
    public let resources: [String]
    /// Restoration options as a key-value object.
    public let options: [String: AnyCodable]

    init(
        id: String,
        createdAt: String,
        updatedAt: String,
        archiveId: String,
        policyId: String,
        status: String,
        startedAt: String?,
        migrationId: String,
        services: [String],
        resources: [String],
        options: [String: AnyCodable]
    ) {
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.archiveId = archiveId
        self.policyId = policyId
        self.status = status
        self.startedAt = startedAt
        self.migrationId = migrationId
        self.services = services
        self.resources = resources
        self.options = options
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.contains(.id) ? container.decode(String.self, forKey: .id) : ""
        self.createdAt = try container.contains(.createdAt) ? container.decode(String.self, forKey: .createdAt) : ""
        self.updatedAt = try container.contains(.updatedAt) ? container.decode(String.self, forKey: .updatedAt) : ""
        self.archiveId = try container.contains(.archiveId) ? container.decode(String.self, forKey: .archiveId) : ""
        self.policyId = try container.contains(.policyId) ? container.decode(String.self, forKey: .policyId) : ""
        self.status = try container.contains(.status) ? container.decode(String.self, forKey: .status) : ""
        self.startedAt = try container.decodeIfPresent(String.self, forKey: .startedAt)
        self.migrationId = try container.contains(.migrationId) ? container.decode(String.self, forKey: .migrationId) : ""
        self.services = try container.decode([String].self, forKey: .services)
        self.resources = try container.decode([String].self, forKey: .resources)
        self.options = try container.contains(.options) ? container.decode([String: AnyCodable].self, forKey: .options) : ([String: Any]()).mapValues { AnyCodable($0) }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(updatedAt, forKey: .updatedAt)
        try container.encode(archiveId, forKey: .archiveId)
        try container.encode(policyId, forKey: .policyId)
        try container.encode(status, forKey: .status)
        try container.encodeIfPresent(startedAt, forKey: .startedAt)
        try container.encode(migrationId, forKey: .migrationId)
        try container.encode(services, forKey: .services)
        try container.encode(resources, forKey: .resources)
        try container.encode(options, forKey: .options)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "$createdAt": createdAt as Any,
            "$updatedAt": updatedAt as Any,
            "archiveId": archiveId as Any,
            "policyId": policyId as Any,
            "status": status as Any,
            "startedAt": startedAt as Any,
            "migrationId": migrationId as Any,
            "services": services as Any,
            "resources": resources as Any,
            "options": options as Any,
        ]
    }

    public static func from(map: [String: Any]) -> BackupRestoration {
        let defaults: [String: Any] = [
            "$id": "",
            "$createdAt": "",
            "$updatedAt": "",
            "archiveId": "",
            "policyId": "",
            "status": "",
            "migrationId": "",
            "options": [String: Any](),
        ]
        let map = defaults.merging(map) { _, new in new }

        return BackupRestoration(
            id: map["$id"] as! String,
            createdAt: map["$createdAt"] as! String,
            updatedAt: map["$updatedAt"] as! String,
            archiveId: map["archiveId"] as! String,
            policyId: map["policyId"] as! String,
            status: map["status"] as! String,
            startedAt: map["startedAt"] as? String,
            migrationId: map["migrationId"] as! String,
            services: map["services"] as! [String],
            resources: map["resources"] as! [String],
            options: (map["options"] as! [String: Any]).mapValues { AnyCodable($0) }
        )
    }
}
