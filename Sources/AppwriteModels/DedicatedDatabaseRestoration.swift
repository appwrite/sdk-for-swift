import Foundation
import JSONCodable

/// Restoration
open class DedicatedDatabaseRestoration: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case createdAt = "$createdAt"
        case databaseId = "databaseId"
        case sourceDatabaseId = "sourceDatabaseId"
        case projectId = "projectId"
        case backupId = "backupId"
        case type = "type"
        case restoreMode = "restoreMode"
        case status = "status"
        case targetTime = "targetTime"
        case startedAt = "startedAt"
        case completedAt = "completedAt"
        case error = "error"
    }

    /// Restoration ID.
    public let id: String
    /// Restoration creation time in ISO 8601 format.
    public let createdAt: String
    /// Database ID being restored into.
    public let databaseId: String
    /// Source database ID when restoring a backup into another database.
    public let sourceDatabaseId: String?
    /// Project ID.
    public let projectId: String
    /// Backup ID used for restoration (null for PITR).
    public let backupId: String?
    /// Restoration type. Possible values: backup (restore from a specific backup snapshot), pitr (point-in-time recovery to a specific timestamp).
    public let type: String
    /// Where the backup was restored. Possible values: in_place (replayed over the database that took the backup), clone (recovered onto a second workload beside the database, which keeps serving until the clone is promoted onto its endpoint), copy (recovered onto a separate database with its own endpoint).
    public let restoreMode: String
    /// Restoration status. Possible values: pending (queued for processing), running (currently in progress), completed (successfully finished), failed (encountered an error).
    public let status: String
    /// Target time for PITR restoration in ISO 8601 format.
    public let targetTime: String?
    /// Restoration start time in ISO 8601 format.
    public let startedAt: String?
    /// Restoration completion time in ISO 8601 format.
    public let completedAt: String?
    /// Error message if restoration failed.
    public let error: String

    init(
        id: String,
        createdAt: String,
        databaseId: String,
        sourceDatabaseId: String?,
        projectId: String,
        backupId: String?,
        type: String,
        restoreMode: String,
        status: String,
        targetTime: String?,
        startedAt: String?,
        completedAt: String?,
        error: String
    ) {
        self.id = id
        self.createdAt = createdAt
        self.databaseId = databaseId
        self.sourceDatabaseId = sourceDatabaseId
        self.projectId = projectId
        self.backupId = backupId
        self.type = type
        self.restoreMode = restoreMode
        self.status = status
        self.targetTime = targetTime
        self.startedAt = startedAt
        self.completedAt = completedAt
        self.error = error
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.contains(.id) ? container.decode(String.self, forKey: .id) : ""
        self.createdAt = try container.contains(.createdAt) ? container.decode(String.self, forKey: .createdAt) : ""
        self.databaseId = try container.contains(.databaseId) ? container.decode(String.self, forKey: .databaseId) : ""
        self.sourceDatabaseId = try container.decodeIfPresent(String.self, forKey: .sourceDatabaseId)
        self.projectId = try container.contains(.projectId) ? container.decode(String.self, forKey: .projectId) : ""
        self.backupId = try container.decodeIfPresent(String.self, forKey: .backupId)
        self.type = try container.contains(.type) ? container.decode(String.self, forKey: .type) : "backup"
        self.restoreMode = try container.contains(.restoreMode) ? container.decode(String.self, forKey: .restoreMode) : "in_place"
        self.status = try container.contains(.status) ? container.decode(String.self, forKey: .status) : "pending"
        self.targetTime = try container.decodeIfPresent(String.self, forKey: .targetTime)
        self.startedAt = try container.decodeIfPresent(String.self, forKey: .startedAt)
        self.completedAt = try container.decodeIfPresent(String.self, forKey: .completedAt)
        self.error = try container.contains(.error) ? container.decode(String.self, forKey: .error) : ""
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(databaseId, forKey: .databaseId)
        try container.encodeIfPresent(sourceDatabaseId, forKey: .sourceDatabaseId)
        try container.encode(projectId, forKey: .projectId)
        try container.encodeIfPresent(backupId, forKey: .backupId)
        try container.encode(type, forKey: .type)
        try container.encode(restoreMode, forKey: .restoreMode)
        try container.encode(status, forKey: .status)
        try container.encodeIfPresent(targetTime, forKey: .targetTime)
        try container.encodeIfPresent(startedAt, forKey: .startedAt)
        try container.encodeIfPresent(completedAt, forKey: .completedAt)
        try container.encode(error, forKey: .error)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "$createdAt": createdAt as Any,
            "databaseId": databaseId as Any,
            "sourceDatabaseId": sourceDatabaseId as Any,
            "projectId": projectId as Any,
            "backupId": backupId as Any,
            "type": type as Any,
            "restoreMode": restoreMode as Any,
            "status": status as Any,
            "targetTime": targetTime as Any,
            "startedAt": startedAt as Any,
            "completedAt": completedAt as Any,
            "error": error as Any,
        ]
    }

    public static func from(map: [String: Any]) -> DedicatedDatabaseRestoration {
        let defaults: [String: Any] = [
            "$id": "",
            "$createdAt": "",
            "databaseId": "",
            "projectId": "",
            "type": "backup",
            "restoreMode": "in_place",
            "status": "pending",
            "error": "",
        ]
        let map = defaults.merging(map) { _, new in new }

        return DedicatedDatabaseRestoration(
            id: map["$id"] as! String,
            createdAt: map["$createdAt"] as! String,
            databaseId: map["databaseId"] as! String,
            sourceDatabaseId: map["sourceDatabaseId"] as? String,
            projectId: map["projectId"] as! String,
            backupId: map["backupId"] as? String,
            type: map["type"] as! String,
            restoreMode: map["restoreMode"] as! String,
            status: map["status"] as! String,
            targetTime: map["targetTime"] as? String,
            startedAt: map["startedAt"] as? String,
            completedAt: map["completedAt"] as? String,
            error: map["error"] as! String
        )
    }
}
