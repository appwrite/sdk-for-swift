import Foundation
import JSONCodable

/// Operation
open class DedicatedDatabaseOperation: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case createdAt = "$createdAt"
        case databaseId = "databaseId"
        case type = "type"
        case status = "status"
        case attempts = "attempts"
        case requestedAt = "requestedAt"
        case startedAt = "startedAt"
        case completedAt = "completedAt"
        case errorCode = "errorCode"
        case errorMessage = "errorMessage"
    }

    /// Operation ID.
    public let id: String
    /// Operation creation time in ISO 8601 format.
    public let createdAt: String
    /// Database ID the operation ran against.
    public let databaseId: String
    /// Operation type, such as provision, update, restore, pausing, resuming, failover, backup-create or cross-region-enable.
    public let type: String
    /// Operation status. Possible values: queued (accepted and waiting to resume), running (in progress), completed (finished successfully), failed (ended in an error).
    public let status: String
    /// Number of times this operation has been attempted.
    public let attempts: Int
    /// Time the operation was requested, in ISO 8601 format.
    public let requestedAt: String?
    /// Time the operation started, in ISO 8601 format.
    public let startedAt: String?
    /// Time the operation reached a terminal state, in ISO 8601 format.
    public let completedAt: String?
    /// Machine-readable failure code. `Interrupted` marks an attempt that ended before its outcome could be confirmed.
    public let errorCode: String
    /// Failure message if the operation failed.
    public let errorMessage: String

    init(
        id: String,
        createdAt: String,
        databaseId: String,
        type: String,
        status: String,
        attempts: Int,
        requestedAt: String?,
        startedAt: String?,
        completedAt: String?,
        errorCode: String,
        errorMessage: String
    ) {
        self.id = id
        self.createdAt = createdAt
        self.databaseId = databaseId
        self.type = type
        self.status = status
        self.attempts = attempts
        self.requestedAt = requestedAt
        self.startedAt = startedAt
        self.completedAt = completedAt
        self.errorCode = errorCode
        self.errorMessage = errorMessage
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decode(String.self, forKey: .id)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.databaseId = try container.decode(String.self, forKey: .databaseId)
        self.type = try container.decode(String.self, forKey: .type)
        self.status = try container.decode(String.self, forKey: .status)
        self.attempts = try container.decode(Int.self, forKey: .attempts)
        self.requestedAt = try container.decodeIfPresent(String.self, forKey: .requestedAt)
        self.startedAt = try container.decodeIfPresent(String.self, forKey: .startedAt)
        self.completedAt = try container.decodeIfPresent(String.self, forKey: .completedAt)
        self.errorCode = try container.decode(String.self, forKey: .errorCode)
        self.errorMessage = try container.decode(String.self, forKey: .errorMessage)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(databaseId, forKey: .databaseId)
        try container.encode(type, forKey: .type)
        try container.encode(status, forKey: .status)
        try container.encode(attempts, forKey: .attempts)
        try container.encodeIfPresent(requestedAt, forKey: .requestedAt)
        try container.encodeIfPresent(startedAt, forKey: .startedAt)
        try container.encodeIfPresent(completedAt, forKey: .completedAt)
        try container.encode(errorCode, forKey: .errorCode)
        try container.encode(errorMessage, forKey: .errorMessage)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "$createdAt": createdAt as Any,
            "databaseId": databaseId as Any,
            "type": type as Any,
            "status": status as Any,
            "attempts": attempts as Any,
            "requestedAt": requestedAt as Any,
            "startedAt": startedAt as Any,
            "completedAt": completedAt as Any,
            "errorCode": errorCode as Any,
            "errorMessage": errorMessage as Any,
        ]
    }

    public static func from(map: [String: Any]) -> DedicatedDatabaseOperation {
        return DedicatedDatabaseOperation(
            id: map["$id"] as! String,
            createdAt: map["$createdAt"] as! String,
            databaseId: map["databaseId"] as! String,
            type: map["type"] as! String,
            status: map["status"] as! String,
            attempts: map["attempts"] as! Int,
            requestedAt: map["requestedAt"] as? String,
            startedAt: map["startedAt"] as? String,
            completedAt: map["completedAt"] as? String,
            errorCode: map["errorCode"] as! String,
            errorMessage: map["errorMessage"] as! String
        )
    }
}
