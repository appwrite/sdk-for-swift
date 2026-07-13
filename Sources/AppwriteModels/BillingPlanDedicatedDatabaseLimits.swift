import Foundation
import JSONCodable

/// dedicatedDatabaseLimits
open class BillingPlanDedicatedDatabaseLimits: Codable {

    enum CodingKeys: String, CodingKey {
        case minCpu = "minCpu"
        case maxCpu = "maxCpu"
        case minMemoryMb = "minMemoryMb"
        case maxMemoryMb = "maxMemoryMb"
        case minStorageGb = "minStorageGb"
        case maxStorageGb = "maxStorageGb"
        case maxReplicas = "maxReplicas"
        case maxConnections = "maxConnections"
        case maxIpAllowlistSize = "maxIpAllowlistSize"
        case maxExtensions = "maxExtensions"
        case maxBackupRetentionDays = "maxBackupRetentionDays"
        case maxPitrRetentionDays = "maxPitrRetentionDays"
        case maxSqlApiMaxRows = "maxSqlApiMaxRows"
        case maxSqlApiMaxBytes = "maxSqlApiMaxBytes"
        case maxSqlApiTimeoutSeconds = "maxSqlApiTimeoutSeconds"
        case maxSqlApiAllowedStatements = "maxSqlApiAllowedStatements"
        case allowedSqlStatements = "allowedSqlStatements"
        case allowedStorageClasses = "allowedStorageClasses"
        case allowedSyncModes = "allowedSyncModes"
    }

    /// Minimum CPU allocation in millicores.
    public let minCpu: Int?
    /// Maximum CPU allocation in millicores.
    public let maxCpu: Int?
    /// Minimum memory allocation in megabytes.
    public let minMemoryMb: Int?
    /// Maximum memory allocation in megabytes.
    public let maxMemoryMb: Int?
    /// Minimum storage allocation in gigabytes.
    public let minStorageGb: Int?
    /// Maximum storage allocation in gigabytes.
    public let maxStorageGb: Int?
    /// Maximum number of high-availability replicas per dedicated database.
    public let maxReplicas: Int?
    /// Maximum number of client connections.
    public let maxConnections: Int?
    /// Maximum number of entries allowed in the IP allowlist.
    public let maxIpAllowlistSize: Int?
    /// Maximum number of database extensions that can be enabled.
    public let maxExtensions: Int?
    /// Maximum number of days a backup can be retained.
    public let maxBackupRetentionDays: Int?
    /// Maximum number of days of point-in-time recovery data that can be retained.
    public let maxPitrRetentionDays: Int?
    /// Maximum number of rows a single SQL API query can return.
    public let maxSqlApiMaxRows: Int?
    /// Maximum response size in bytes for a single SQL API query.
    public let maxSqlApiMaxBytes: Int?
    /// Maximum execution time in seconds for a single SQL API query.
    public let maxSqlApiTimeoutSeconds: Int?
    /// Maximum number of SQL statement types that can be permitted through the SQL API.
    public let maxSqlApiAllowedStatements: Int?
    /// SQL statement types permitted through the SQL API.
    public let allowedSqlStatements: [String]?
    /// Storage classes available for dedicated databases.
    public let allowedStorageClasses: [String]?
    /// Replica synchronization modes available for dedicated databases.
    public let allowedSyncModes: [String]?

    init(
        minCpu: Int?,
        maxCpu: Int?,
        minMemoryMb: Int?,
        maxMemoryMb: Int?,
        minStorageGb: Int?,
        maxStorageGb: Int?,
        maxReplicas: Int?,
        maxConnections: Int?,
        maxIpAllowlistSize: Int?,
        maxExtensions: Int?,
        maxBackupRetentionDays: Int?,
        maxPitrRetentionDays: Int?,
        maxSqlApiMaxRows: Int?,
        maxSqlApiMaxBytes: Int?,
        maxSqlApiTimeoutSeconds: Int?,
        maxSqlApiAllowedStatements: Int?,
        allowedSqlStatements: [String]?,
        allowedStorageClasses: [String]?,
        allowedSyncModes: [String]?
    ) {
        self.minCpu = minCpu
        self.maxCpu = maxCpu
        self.minMemoryMb = minMemoryMb
        self.maxMemoryMb = maxMemoryMb
        self.minStorageGb = minStorageGb
        self.maxStorageGb = maxStorageGb
        self.maxReplicas = maxReplicas
        self.maxConnections = maxConnections
        self.maxIpAllowlistSize = maxIpAllowlistSize
        self.maxExtensions = maxExtensions
        self.maxBackupRetentionDays = maxBackupRetentionDays
        self.maxPitrRetentionDays = maxPitrRetentionDays
        self.maxSqlApiMaxRows = maxSqlApiMaxRows
        self.maxSqlApiMaxBytes = maxSqlApiMaxBytes
        self.maxSqlApiTimeoutSeconds = maxSqlApiTimeoutSeconds
        self.maxSqlApiAllowedStatements = maxSqlApiAllowedStatements
        self.allowedSqlStatements = allowedSqlStatements
        self.allowedStorageClasses = allowedStorageClasses
        self.allowedSyncModes = allowedSyncModes
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.minCpu = try container.decodeIfPresent(Int.self, forKey: .minCpu)
        self.maxCpu = try container.decodeIfPresent(Int.self, forKey: .maxCpu)
        self.minMemoryMb = try container.decodeIfPresent(Int.self, forKey: .minMemoryMb)
        self.maxMemoryMb = try container.decodeIfPresent(Int.self, forKey: .maxMemoryMb)
        self.minStorageGb = try container.decodeIfPresent(Int.self, forKey: .minStorageGb)
        self.maxStorageGb = try container.decodeIfPresent(Int.self, forKey: .maxStorageGb)
        self.maxReplicas = try container.decodeIfPresent(Int.self, forKey: .maxReplicas)
        self.maxConnections = try container.decodeIfPresent(Int.self, forKey: .maxConnections)
        self.maxIpAllowlistSize = try container.decodeIfPresent(Int.self, forKey: .maxIpAllowlistSize)
        self.maxExtensions = try container.decodeIfPresent(Int.self, forKey: .maxExtensions)
        self.maxBackupRetentionDays = try container.decodeIfPresent(Int.self, forKey: .maxBackupRetentionDays)
        self.maxPitrRetentionDays = try container.decodeIfPresent(Int.self, forKey: .maxPitrRetentionDays)
        self.maxSqlApiMaxRows = try container.decodeIfPresent(Int.self, forKey: .maxSqlApiMaxRows)
        self.maxSqlApiMaxBytes = try container.decodeIfPresent(Int.self, forKey: .maxSqlApiMaxBytes)
        self.maxSqlApiTimeoutSeconds = try container.decodeIfPresent(Int.self, forKey: .maxSqlApiTimeoutSeconds)
        self.maxSqlApiAllowedStatements = try container.decodeIfPresent(Int.self, forKey: .maxSqlApiAllowedStatements)
        self.allowedSqlStatements = try container.decodeIfPresent([String].self, forKey: .allowedSqlStatements)
        self.allowedStorageClasses = try container.decodeIfPresent([String].self, forKey: .allowedStorageClasses)
        self.allowedSyncModes = try container.decodeIfPresent([String].self, forKey: .allowedSyncModes)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(minCpu, forKey: .minCpu)
        try container.encodeIfPresent(maxCpu, forKey: .maxCpu)
        try container.encodeIfPresent(minMemoryMb, forKey: .minMemoryMb)
        try container.encodeIfPresent(maxMemoryMb, forKey: .maxMemoryMb)
        try container.encodeIfPresent(minStorageGb, forKey: .minStorageGb)
        try container.encodeIfPresent(maxStorageGb, forKey: .maxStorageGb)
        try container.encodeIfPresent(maxReplicas, forKey: .maxReplicas)
        try container.encodeIfPresent(maxConnections, forKey: .maxConnections)
        try container.encodeIfPresent(maxIpAllowlistSize, forKey: .maxIpAllowlistSize)
        try container.encodeIfPresent(maxExtensions, forKey: .maxExtensions)
        try container.encodeIfPresent(maxBackupRetentionDays, forKey: .maxBackupRetentionDays)
        try container.encodeIfPresent(maxPitrRetentionDays, forKey: .maxPitrRetentionDays)
        try container.encodeIfPresent(maxSqlApiMaxRows, forKey: .maxSqlApiMaxRows)
        try container.encodeIfPresent(maxSqlApiMaxBytes, forKey: .maxSqlApiMaxBytes)
        try container.encodeIfPresent(maxSqlApiTimeoutSeconds, forKey: .maxSqlApiTimeoutSeconds)
        try container.encodeIfPresent(maxSqlApiAllowedStatements, forKey: .maxSqlApiAllowedStatements)
        try container.encodeIfPresent(allowedSqlStatements, forKey: .allowedSqlStatements)
        try container.encodeIfPresent(allowedStorageClasses, forKey: .allowedStorageClasses)
        try container.encodeIfPresent(allowedSyncModes, forKey: .allowedSyncModes)
    }

    public func toMap() -> [String: Any] {
        return [
            "minCpu": minCpu as Any,
            "maxCpu": maxCpu as Any,
            "minMemoryMb": minMemoryMb as Any,
            "maxMemoryMb": maxMemoryMb as Any,
            "minStorageGb": minStorageGb as Any,
            "maxStorageGb": maxStorageGb as Any,
            "maxReplicas": maxReplicas as Any,
            "maxConnections": maxConnections as Any,
            "maxIpAllowlistSize": maxIpAllowlistSize as Any,
            "maxExtensions": maxExtensions as Any,
            "maxBackupRetentionDays": maxBackupRetentionDays as Any,
            "maxPitrRetentionDays": maxPitrRetentionDays as Any,
            "maxSqlApiMaxRows": maxSqlApiMaxRows as Any,
            "maxSqlApiMaxBytes": maxSqlApiMaxBytes as Any,
            "maxSqlApiTimeoutSeconds": maxSqlApiTimeoutSeconds as Any,
            "maxSqlApiAllowedStatements": maxSqlApiAllowedStatements as Any,
            "allowedSqlStatements": allowedSqlStatements as Any,
            "allowedStorageClasses": allowedStorageClasses as Any,
            "allowedSyncModes": allowedSyncModes as Any
        ]
    }

    public static func from(map: [String: Any] ) -> BillingPlanDedicatedDatabaseLimits {
        return BillingPlanDedicatedDatabaseLimits(
            minCpu: map["minCpu"] as? Int,
            maxCpu: map["maxCpu"] as? Int,
            minMemoryMb: map["minMemoryMb"] as? Int,
            maxMemoryMb: map["maxMemoryMb"] as? Int,
            minStorageGb: map["minStorageGb"] as? Int,
            maxStorageGb: map["maxStorageGb"] as? Int,
            maxReplicas: map["maxReplicas"] as? Int,
            maxConnections: map["maxConnections"] as? Int,
            maxIpAllowlistSize: map["maxIpAllowlistSize"] as? Int,
            maxExtensions: map["maxExtensions"] as? Int,
            maxBackupRetentionDays: map["maxBackupRetentionDays"] as? Int,
            maxPitrRetentionDays: map["maxPitrRetentionDays"] as? Int,
            maxSqlApiMaxRows: map["maxSqlApiMaxRows"] as? Int,
            maxSqlApiMaxBytes: map["maxSqlApiMaxBytes"] as? Int,
            maxSqlApiTimeoutSeconds: map["maxSqlApiTimeoutSeconds"] as? Int,
            maxSqlApiAllowedStatements: map["maxSqlApiAllowedStatements"] as? Int,
            allowedSqlStatements: map["allowedSqlStatements"] as? [String],
            allowedStorageClasses: map["allowedStorageClasses"] as? [String],
            allowedSyncModes: map["allowedSyncModes"] as? [String]
        )
    }
}
