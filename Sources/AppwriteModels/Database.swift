import Foundation
import JSONCodable
import AppwriteEnums

/// Database
open class Database: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case name = "name"
        case createdAt = "$createdAt"
        case updatedAt = "$updatedAt"
        case enabled = "enabled"
        case type = "type"
        case status = "status"
        case policies = "policies"
        case archives = "archives"
    }

    /// Database ID.
    public let id: String
    /// Database name.
    public let name: String
    /// Database creation date in ISO 8601 format.
    public let createdAt: String
    /// Database update date in ISO 8601 format.
    public let updatedAt: String
    /// If database is enabled. Can be &#039;enabled&#039; or &#039;disabled&#039;. When disabled, the database is inaccessible to users, but remains accessible to Server SDKs using API keys.
    public let enabled: Bool
    /// Database type.
    public let type: AppwriteEnums.DatabaseType
    /// Database status. Possible values: `provisioning`, `ready` or `failed`
    public let status: AppwriteEnums.DatabaseStatus?
    /// Database backup policies.
    public let policies: [BackupPolicy]
    /// Database backup archives.
    public let archives: [BackupArchive]

    init(
        id: String,
        name: String,
        createdAt: String,
        updatedAt: String,
        enabled: Bool,
        type: AppwriteEnums.DatabaseType,
        status: AppwriteEnums.DatabaseStatus?,
        policies: [BackupPolicy],
        archives: [BackupArchive]
    ) {
        self.id = id
        self.name = name
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.enabled = enabled
        self.type = type
        self.status = status
        self.policies = policies
        self.archives = archives
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
        self.enabled = try container.decode(Bool.self, forKey: .enabled)
        self.type = AppwriteEnums.DatabaseType(rawValue: try container.decode(String.self, forKey: .type))!
        if let statusString = try container.decodeIfPresent(String.self, forKey: .status) {
            self.status = AppwriteEnums.DatabaseStatus(rawValue: statusString)
        } else {
            self.status = nil
        }
        self.policies = try container.decode([BackupPolicy].self, forKey: .policies)
        self.archives = try container.decode([BackupArchive].self, forKey: .archives)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(updatedAt, forKey: .updatedAt)
        try container.encode(enabled, forKey: .enabled)
        try container.encode(type.rawValue, forKey: .type)
        try container.encodeIfPresent(status?.rawValue, forKey: .status)
        try container.encode(policies, forKey: .policies)
        try container.encode(archives, forKey: .archives)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "name": name as Any,
            "$createdAt": createdAt as Any,
            "$updatedAt": updatedAt as Any,
            "enabled": enabled as Any,
            "type": type.rawValue as Any,
            "status": status?.rawValue as Any,
            "policies": policies.map { $0.toMap() } as Any,
            "archives": archives.map { $0.toMap() } as Any
        ]
    }

    public static func from(map: [String: Any] ) -> Database {
        return Database(
            id: map["$id"] as! String,
            name: map["name"] as! String,
            createdAt: map["$createdAt"] as! String,
            updatedAt: map["$updatedAt"] as! String,
            enabled: map["enabled"] as! Bool,
            type: DatabaseType(rawValue: map["type"] as! String)!,
            status: map["status"] as? String != nil ? DatabaseStatus(rawValue: map["status"] as! String) : nil,
            policies: (map["policies"] as! [[String: Any]]).map { BackupPolicy.from(map: $0) },
            archives: (map["archives"] as! [[String: Any]]).map { BackupArchive.from(map: $0) }
        )
    }
}
