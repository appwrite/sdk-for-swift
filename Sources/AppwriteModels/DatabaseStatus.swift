import Foundation
import JSONCodable

/// Status
open class DatabaseStatus: Codable {

    enum CodingKeys: String, CodingKey {
        case health = "health"
        case ready = "ready"
        case engine = "engine"
        case version = "version"
        case uptime = "uptime"
        case connections = "connections"
        case replicas = "replicas"
        case volumes = "volumes"
    }

    /// Overall health status: healthy, degraded, or unhealthy.
    public let health: String
    /// Whether the database is ready to accept connections.
    public let ready: Bool
    /// Database engine: postgresql, mysql, mariadb, or mongodb.
    public let engine: String
    /// Database engine version.
    public let version: String
    /// Database uptime in seconds.
    public let uptime: Int
    /// Connection statistics.
    public let connections: DatabaseStatusConnections
    /// List of database replicas and their status.
    public let replicas: [DatabaseStatusReplica]
    /// Storage volume information.
    public let volumes: [DatabaseStatusVolume]

    init(
        health: String,
        ready: Bool,
        engine: String,
        version: String,
        uptime: Int,
        connections: DatabaseStatusConnections,
        replicas: [DatabaseStatusReplica],
        volumes: [DatabaseStatusVolume]
    ) {
        self.health = health
        self.ready = ready
        self.engine = engine
        self.version = version
        self.uptime = uptime
        self.connections = connections
        self.replicas = replicas
        self.volumes = volumes
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.health = try container.decode(String.self, forKey: .health)
        self.ready = try container.decode(Bool.self, forKey: .ready)
        self.engine = try container.decode(String.self, forKey: .engine)
        self.version = try container.decode(String.self, forKey: .version)
        self.uptime = try container.decode(Int.self, forKey: .uptime)
        self.connections = try container.decode(DatabaseStatusConnections.self, forKey: .connections)
        self.replicas = try container.decode([DatabaseStatusReplica].self, forKey: .replicas)
        self.volumes = try container.decode([DatabaseStatusVolume].self, forKey: .volumes)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(health, forKey: .health)
        try container.encode(ready, forKey: .ready)
        try container.encode(engine, forKey: .engine)
        try container.encode(version, forKey: .version)
        try container.encode(uptime, forKey: .uptime)
        try container.encode(connections, forKey: .connections)
        try container.encode(replicas, forKey: .replicas)
        try container.encode(volumes, forKey: .volumes)
    }

    public func toMap() -> [String: Any] {
        return [
            "health": health as Any,
            "ready": ready as Any,
            "engine": engine as Any,
            "version": version as Any,
            "uptime": uptime as Any,
            "connections": connections.toMap() as Any,
            "replicas": replicas.map { $0.toMap() } as Any,
            "volumes": volumes.map { $0.toMap() } as Any
        ]
    }

    public static func from(map: [String: Any] ) -> DatabaseStatus {
        return DatabaseStatus(
            health: map["health"] as! String,
            ready: map["ready"] as! Bool,
            engine: map["engine"] as! String,
            version: map["version"] as! String,
            uptime: map["uptime"] as! Int,
            connections: DatabaseStatusConnections.from(map: map["connections"] as! [String: Any]),
            replicas: (map["replicas"] as! [[String: Any]]).map { DatabaseStatusReplica.from(map: $0) },
            volumes: (map["volumes"] as! [[String: Any]]).map { DatabaseStatusVolume.from(map: $0) }
        )
    }
}
