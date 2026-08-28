import Foundation
import JSONCodable

/// Backup
open class DedicatedDatabaseBackup: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case createdAt = "$createdAt"
        case databaseId = "databaseId"
        case projectId = "projectId"
        case policyId = "policyId"
        case trigger = "trigger"
        case type = "type"
        case requestedType = "requestedType"
        case fallbackReason = "fallbackReason"
        case status = "status"
        case sizeBytes = "sizeBytes"
        case startedAt = "startedAt"
        case completedAt = "completedAt"
        case verifiedAt = "verifiedAt"
        case expiresAt = "expiresAt"
        case logPosition = "logPosition"
        case error = "error"
    }

    /// Backup ID.
    public let id: String
    /// Backup creation time in ISO 8601 format.
    public let createdAt: String
    /// Database ID this backup belongs to.
    public let databaseId: String
    /// Project ID.
    public let projectId: String
    /// Backup policy ID when the backup was created by a schedule.
    public let policyId: String
    /// Backup trigger. Possible values: manual, schedule.
    public let trigger: String
    /// Backup type. Possible values: full (complete database snapshot), incremental (changes since last backup), wal (write-ahead log continuous archival).
    public let type: String
    /// Backup type that was requested. Differs from `type` when the backend could not run the requested type and took a different one instead, in which case `fallbackReason` explains why. Empty for backups taken before the requested type was recorded.
    public let requestedType: String
    /// Why the backend ran a different backup type than the one requested. Empty when the backup ran as requested.
    public let fallbackReason: String
    /// Backup status. Possible values: pending (queued for processing), running (currently in progress), completed (successfully finished), failed (encountered an error), verified (integrity check passed).
    public let status: String
    /// Backup size in bytes.
    public let sizeBytes: Int
    /// Backup start time in ISO 8601 format.
    public let startedAt: String?
    /// Backup completion time in ISO 8601 format.
    public let completedAt: String?
    /// Backup verification time in ISO 8601 format.
    public let verifiedAt: String?
    /// Backup expiration time in ISO 8601 format.
    public let expiresAt: String?
    /// Transaction-log position the backup anchors at, in the engine&#039;s own notation: PostgreSQL `{walSegment}|{lsn}`, MySQL and MariaDB `{binlogFile}|{offset}`, MongoDB `{seconds}|{increment}`. Empty when the backup recorded no position, which is the case for backup types that carry none.
    public let logPosition: String?
    /// Error message if backup failed.
    public let error: String

    init(
        id: String,
        createdAt: String,
        databaseId: String,
        projectId: String,
        policyId: String,
        trigger: String,
        type: String,
        requestedType: String,
        fallbackReason: String,
        status: String,
        sizeBytes: Int,
        startedAt: String?,
        completedAt: String?,
        verifiedAt: String?,
        expiresAt: String?,
        logPosition: String?,
        error: String
    ) {
        self.id = id
        self.createdAt = createdAt
        self.databaseId = databaseId
        self.projectId = projectId
        self.policyId = policyId
        self.trigger = trigger
        self.type = type
        self.requestedType = requestedType
        self.fallbackReason = fallbackReason
        self.status = status
        self.sizeBytes = sizeBytes
        self.startedAt = startedAt
        self.completedAt = completedAt
        self.verifiedAt = verifiedAt
        self.expiresAt = expiresAt
        self.logPosition = logPosition
        self.error = error
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decode(String.self, forKey: .id)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.databaseId = try container.decode(String.self, forKey: .databaseId)
        self.projectId = try container.decode(String.self, forKey: .projectId)
        self.policyId = try container.decode(String.self, forKey: .policyId)
        self.trigger = try container.decode(String.self, forKey: .trigger)
        self.type = try container.decode(String.self, forKey: .type)
        self.requestedType = try container.decode(String.self, forKey: .requestedType)
        self.fallbackReason = try container.decode(String.self, forKey: .fallbackReason)
        self.status = try container.decode(String.self, forKey: .status)
        self.sizeBytes = try container.decode(Int.self, forKey: .sizeBytes)
        self.startedAt = try container.decodeIfPresent(String.self, forKey: .startedAt)
        self.completedAt = try container.decodeIfPresent(String.self, forKey: .completedAt)
        self.verifiedAt = try container.decodeIfPresent(String.self, forKey: .verifiedAt)
        self.expiresAt = try container.decodeIfPresent(String.self, forKey: .expiresAt)
        self.logPosition = try container.decodeIfPresent(String.self, forKey: .logPosition)
        self.error = try container.decode(String.self, forKey: .error)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(databaseId, forKey: .databaseId)
        try container.encode(projectId, forKey: .projectId)
        try container.encode(policyId, forKey: .policyId)
        try container.encode(trigger, forKey: .trigger)
        try container.encode(type, forKey: .type)
        try container.encode(requestedType, forKey: .requestedType)
        try container.encode(fallbackReason, forKey: .fallbackReason)
        try container.encode(status, forKey: .status)
        try container.encode(sizeBytes, forKey: .sizeBytes)
        try container.encodeIfPresent(startedAt, forKey: .startedAt)
        try container.encodeIfPresent(completedAt, forKey: .completedAt)
        try container.encodeIfPresent(verifiedAt, forKey: .verifiedAt)
        try container.encodeIfPresent(expiresAt, forKey: .expiresAt)
        try container.encodeIfPresent(logPosition, forKey: .logPosition)
        try container.encode(error, forKey: .error)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "$createdAt": createdAt as Any,
            "databaseId": databaseId as Any,
            "projectId": projectId as Any,
            "policyId": policyId as Any,
            "trigger": trigger as Any,
            "type": type as Any,
            "requestedType": requestedType as Any,
            "fallbackReason": fallbackReason as Any,
            "status": status as Any,
            "sizeBytes": sizeBytes as Any,
            "startedAt": startedAt as Any,
            "completedAt": completedAt as Any,
            "verifiedAt": verifiedAt as Any,
            "expiresAt": expiresAt as Any,
            "logPosition": logPosition as Any,
            "error": error as Any,
        ]
    }

    public static func from(map: [String: Any]) -> DedicatedDatabaseBackup {
        return DedicatedDatabaseBackup(
            id: map["$id"] as! String,
            createdAt: map["$createdAt"] as! String,
            databaseId: map["databaseId"] as! String,
            projectId: map["projectId"] as! String,
            policyId: map["policyId"] as! String,
            trigger: map["trigger"] as! String,
            type: map["type"] as! String,
            requestedType: map["requestedType"] as! String,
            fallbackReason: map["fallbackReason"] as! String,
            status: map["status"] as! String,
            sizeBytes: map["sizeBytes"] as! Int,
            startedAt: map["startedAt"] as? String,
            completedAt: map["completedAt"] as? String,
            verifiedAt: map["verifiedAt"] as? String,
            expiresAt: map["expiresAt"] as? String,
            logPosition: map["logPosition"] as? String,
            error: map["error"] as! String
        )
    }
}
