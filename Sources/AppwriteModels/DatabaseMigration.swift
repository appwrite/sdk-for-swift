import Foundation
import JSONCodable

/// Database Migration
open class DatabaseMigration: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case createdAt = "$createdAt"
        case updatedAt = "$updatedAt"
        case projectId = "projectId"
        case databaseId = "databaseId"
        case specification = "specification"
        case phase = "phase"
        case attempt = "attempt"
        case lastError = "lastError"
        case lagDocuments = "lagDocuments"
        case verifiedAt = "verifiedAt"
        case cutoverAt = "cutoverAt"
        case soakUntil = "soakUntil"
        case autoCutover = "autoCutover"
        case cutoverRequested = "cutoverRequested"
        case paused = "paused"
    }

    /// Database migration ID.
    public let id: String
    /// Migration creation time in ISO 8601 format.
    public let createdAt: String
    /// Migration update time in ISO 8601 format.
    public let updatedAt: String
    /// Project ID that owns the migrating database.
    public let projectId: String
    /// Logical database ID being migrated.
    public let databaseId: String
    /// Dedicated compute specification provisioned for the migration target.
    public let specification: String
    /// Migration phase. Possible values: pending, provisioned, capturing, backfilling, catching_up, verifying, ready_to_cutover, cutover, soaking, done, failed, rolled_back.
    public let phase: String
    /// Number of times a migration step has failed and been recorded.
    public let attempt: Int
    /// Reason the most recent migration step failed, empty while none has.
    public let lastError: String
    /// Number of documents still pending replication to the target.
    public let lagDocuments: Int
    /// Time the migrated data was verified against the source in ISO 8601 format.
    public let verifiedAt: String
    /// Time routing was flipped to the target in ISO 8601 format.
    public let cutoverAt: String
    /// Time the post-cutover soak window ends in ISO 8601 format.
    public let soakUntil: String
    /// Whether the migration cuts over automatically once ready. Set when the migration is created and never changed afterwards, so it always reports what was asked for.
    public let autoCutover: Bool
    /// Whether a cutover has been requested and not yet attempted. Set by the cutover endpoint and cleared when the attempt is made, so a cutover that fails a check parks the migration again rather than retrying on its own.
    public let cutoverRequested: Bool
    /// Whether the migration is paused.
    public let paused: Bool

    init(
        id: String,
        createdAt: String,
        updatedAt: String,
        projectId: String,
        databaseId: String,
        specification: String,
        phase: String,
        attempt: Int,
        lastError: String,
        lagDocuments: Int,
        verifiedAt: String,
        cutoverAt: String,
        soakUntil: String,
        autoCutover: Bool,
        cutoverRequested: Bool,
        paused: Bool
    ) {
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.projectId = projectId
        self.databaseId = databaseId
        self.specification = specification
        self.phase = phase
        self.attempt = attempt
        self.lastError = lastError
        self.lagDocuments = lagDocuments
        self.verifiedAt = verifiedAt
        self.cutoverAt = cutoverAt
        self.soakUntil = soakUntil
        self.autoCutover = autoCutover
        self.cutoverRequested = cutoverRequested
        self.paused = paused
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decode(String.self, forKey: .id)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
        self.projectId = try container.decode(String.self, forKey: .projectId)
        self.databaseId = try container.decode(String.self, forKey: .databaseId)
        self.specification = try container.decode(String.self, forKey: .specification)
        self.phase = try container.decode(String.self, forKey: .phase)
        self.attempt = try container.decode(Int.self, forKey: .attempt)
        self.lastError = try container.decode(String.self, forKey: .lastError)
        self.lagDocuments = try container.decode(Int.self, forKey: .lagDocuments)
        self.verifiedAt = try container.decode(String.self, forKey: .verifiedAt)
        self.cutoverAt = try container.decode(String.self, forKey: .cutoverAt)
        self.soakUntil = try container.decode(String.self, forKey: .soakUntil)
        self.autoCutover = try container.decode(Bool.self, forKey: .autoCutover)
        self.cutoverRequested = try container.decode(Bool.self, forKey: .cutoverRequested)
        self.paused = try container.decode(Bool.self, forKey: .paused)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(updatedAt, forKey: .updatedAt)
        try container.encode(projectId, forKey: .projectId)
        try container.encode(databaseId, forKey: .databaseId)
        try container.encode(specification, forKey: .specification)
        try container.encode(phase, forKey: .phase)
        try container.encode(attempt, forKey: .attempt)
        try container.encode(lastError, forKey: .lastError)
        try container.encode(lagDocuments, forKey: .lagDocuments)
        try container.encode(verifiedAt, forKey: .verifiedAt)
        try container.encode(cutoverAt, forKey: .cutoverAt)
        try container.encode(soakUntil, forKey: .soakUntil)
        try container.encode(autoCutover, forKey: .autoCutover)
        try container.encode(cutoverRequested, forKey: .cutoverRequested)
        try container.encode(paused, forKey: .paused)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "$createdAt": createdAt as Any,
            "$updatedAt": updatedAt as Any,
            "projectId": projectId as Any,
            "databaseId": databaseId as Any,
            "specification": specification as Any,
            "phase": phase as Any,
            "attempt": attempt as Any,
            "lastError": lastError as Any,
            "lagDocuments": lagDocuments as Any,
            "verifiedAt": verifiedAt as Any,
            "cutoverAt": cutoverAt as Any,
            "soakUntil": soakUntil as Any,
            "autoCutover": autoCutover as Any,
            "cutoverRequested": cutoverRequested as Any,
            "paused": paused as Any
        ]
    }

    public static func from(map: [String: Any] ) -> DatabaseMigration {
        return DatabaseMigration(
            id: map["$id"] as! String,
            createdAt: map["$createdAt"] as! String,
            updatedAt: map["$updatedAt"] as! String,
            projectId: map["projectId"] as! String,
            databaseId: map["databaseId"] as! String,
            specification: map["specification"] as! String,
            phase: map["phase"] as! String,
            attempt: map["attempt"] as! Int,
            lastError: map["lastError"] as! String,
            lagDocuments: map["lagDocuments"] as! Int,
            verifiedAt: map["verifiedAt"] as! String,
            cutoverAt: map["cutoverAt"] as! String,
            soakUntil: map["soakUntil"] as! String,
            autoCutover: map["autoCutover"] as! Bool,
            cutoverRequested: map["cutoverRequested"] as! Bool,
            paused: map["paused"] as! Bool
        )
    }
}
