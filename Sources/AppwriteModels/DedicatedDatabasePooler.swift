import Foundation
import JSONCodable

/// PoolerConfig
open class DedicatedDatabasePooler: Codable {

    enum CodingKeys: String, CodingKey {
        case enabled = "enabled"
        case mode = "mode"
        case maxConnections = "maxConnections"
        case defaultPoolSize = "defaultPoolSize"
        case port = "port"
        case readWriteSplitting = "readWriteSplitting"
        case poolerCpuRequest = "poolerCpuRequest"
        case poolerCpuLimit = "poolerCpuLimit"
        case poolerMemoryRequest = "poolerMemoryRequest"
        case poolerMemoryLimit = "poolerMemoryLimit"
    }

    /// Whether connection pooling is enabled.
    public let enabled: Bool
    /// Connection pool mode. Possible values: transaction (releases connections back to pool after each transaction), session (holds connections for the entire client session).
    public let mode: String
    /// Client-connection ceiling the pooler accepts. Enforced on MySQL and MariaDB; on PostgreSQL the pooler has no client cap, so this reports the database&#039;s advertised networkMaxConnections and cannot be set here.
    public let maxConnections: Int
    /// Default pool size per user.
    public let defaultPoolSize: Int
    /// Pooler listening port.
    public let port: Int
    /// Whether SELECTs are routed to HA replicas while writes and locked reads stay on the primary. Active only when HA is enabled.
    public let readWriteSplitting: Bool
    /// Effective CPU request applied to the pooler sidecar container (Kubernetes quantity). Returns the proportional default (5% of DB CPU, floor 100m) unless overridden.
    public let poolerCpuRequest: String
    /// Effective CPU limit applied to the pooler sidecar container (Kubernetes quantity). Returns the proportional default (10% of DB CPU, floor 200m) unless overridden.
    public let poolerCpuLimit: String
    /// Effective memory request applied to the pooler sidecar container (Kubernetes quantity). Returns the proportional default (7.5% of DB memory, floor 64Mi) unless overridden.
    public let poolerMemoryRequest: String
    /// Effective memory limit applied to the pooler sidecar container (Kubernetes quantity). Returns the proportional default (15% of DB memory, floor 128Mi) unless overridden.
    public let poolerMemoryLimit: String

    init(
        enabled: Bool,
        mode: String,
        maxConnections: Int,
        defaultPoolSize: Int,
        port: Int,
        readWriteSplitting: Bool,
        poolerCpuRequest: String,
        poolerCpuLimit: String,
        poolerMemoryRequest: String,
        poolerMemoryLimit: String
    ) {
        self.enabled = enabled
        self.mode = mode
        self.maxConnections = maxConnections
        self.defaultPoolSize = defaultPoolSize
        self.port = port
        self.readWriteSplitting = readWriteSplitting
        self.poolerCpuRequest = poolerCpuRequest
        self.poolerCpuLimit = poolerCpuLimit
        self.poolerMemoryRequest = poolerMemoryRequest
        self.poolerMemoryLimit = poolerMemoryLimit
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.enabled = try container.decode(Bool.self, forKey: .enabled)
        self.mode = try container.decode(String.self, forKey: .mode)
        self.maxConnections = try container.decode(Int.self, forKey: .maxConnections)
        self.defaultPoolSize = try container.decode(Int.self, forKey: .defaultPoolSize)
        self.port = try container.decode(Int.self, forKey: .port)
        self.readWriteSplitting = try container.decode(Bool.self, forKey: .readWriteSplitting)
        self.poolerCpuRequest = try container.decode(String.self, forKey: .poolerCpuRequest)
        self.poolerCpuLimit = try container.decode(String.self, forKey: .poolerCpuLimit)
        self.poolerMemoryRequest = try container.decode(String.self, forKey: .poolerMemoryRequest)
        self.poolerMemoryLimit = try container.decode(String.self, forKey: .poolerMemoryLimit)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(enabled, forKey: .enabled)
        try container.encode(mode, forKey: .mode)
        try container.encode(maxConnections, forKey: .maxConnections)
        try container.encode(defaultPoolSize, forKey: .defaultPoolSize)
        try container.encode(port, forKey: .port)
        try container.encode(readWriteSplitting, forKey: .readWriteSplitting)
        try container.encode(poolerCpuRequest, forKey: .poolerCpuRequest)
        try container.encode(poolerCpuLimit, forKey: .poolerCpuLimit)
        try container.encode(poolerMemoryRequest, forKey: .poolerMemoryRequest)
        try container.encode(poolerMemoryLimit, forKey: .poolerMemoryLimit)
    }

    public func toMap() -> [String: Any] {
        return [
            "enabled": enabled as Any,
            "mode": mode as Any,
            "maxConnections": maxConnections as Any,
            "defaultPoolSize": defaultPoolSize as Any,
            "port": port as Any,
            "readWriteSplitting": readWriteSplitting as Any,
            "poolerCpuRequest": poolerCpuRequest as Any,
            "poolerCpuLimit": poolerCpuLimit as Any,
            "poolerMemoryRequest": poolerMemoryRequest as Any,
            "poolerMemoryLimit": poolerMemoryLimit as Any,
        ]
    }

    public static func from(map: [String: Any]) -> DedicatedDatabasePooler {
        return DedicatedDatabasePooler(
            enabled: map["enabled"] as! Bool,
            mode: map["mode"] as! String,
            maxConnections: map["maxConnections"] as! Int,
            defaultPoolSize: map["defaultPoolSize"] as! Int,
            port: map["port"] as! Int,
            readWriteSplitting: map["readWriteSplitting"] as! Bool,
            poolerCpuRequest: map["poolerCpuRequest"] as! String,
            poolerCpuLimit: map["poolerCpuLimit"] as! String,
            poolerMemoryRequest: map["poolerMemoryRequest"] as! String,
            poolerMemoryLimit: map["poolerMemoryLimit"] as! String
        )
    }
}
