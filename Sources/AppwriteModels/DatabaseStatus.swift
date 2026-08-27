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
        case syncMode = "syncMode"
        case effectiveSyncMode = "effectiveSyncMode"
        case syncDegraded = "syncDegraded"
        case syncAcknowledgements = "syncAcknowledgements"
        case syncStandbyCount = "syncStandbyCount"
        case syncStateConfirmed = "syncStateConfirmed"
        case replicas = "replicas"
        case volumes = "volumes"
    }

    /// Overall health status: healthy, degraded, unhealthy, or unknown when nothing could be measured.
    public let health: String
    /// Whether the database is ready to accept connections.
    public let ready: Bool
    /// Database engine: postgresql, mysql, or mongodb.
    public let engine: String
    /// Database engine version.
    public let version: String
    /// Database uptime in seconds.
    public let uptime: Int
    /// Connection statistics.
    public let connections: DatabaseStatusConnections
    /// Requested replication sync mode. Possible values: async, sync, quorum. Compare with effectiveSyncMode for what the primary is enforcing.
    public let syncMode: String
    /// Replication sync mode the primary is actually enforcing. Null when high availability is disabled or the state could not be read.
    public let effectiveSyncMode: String?
    /// Whether the enforced replication is weaker than the requested syncMode.
    public let syncDegraded: Bool
    /// Number of standby acknowledgements the primary waits for before a write is committed.
    public let syncAcknowledgements: Int
    /// Number of standbys registered with the primary for synchronous replication.
    public let syncStandbyCount: Int
    /// Whether the other sync fields are an engine reading rather than a recorded estimate. True when the primary answered what it is enforcing, including when that answer contradicted the record, in which case the contradicted values are replaced by the ones the engine reports. False when the reading could not be taken: the probe did not answer, there was no engine to ask, or the values describe a configuration change just applied rather than anything measured. Absent when no engine was asked at all, so an unprobed database is distinguishable from an unconfirmed one. False never means a standby was found lagging, because it is the absence of a reading rather than a negative one, so draw no conclusion about replication health from it or from a response that omits it.
    public let syncStateConfirmed: Bool?
    /// List of database replicas and their status. Every configured member appears, including one the backend has not brought up, which is reported as not healthy.
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
        syncMode: String,
        effectiveSyncMode: String?,
        syncDegraded: Bool,
        syncAcknowledgements: Int,
        syncStandbyCount: Int,
        syncStateConfirmed: Bool?,
        replicas: [DatabaseStatusReplica],
        volumes: [DatabaseStatusVolume]
    ) {
        self.health = health
        self.ready = ready
        self.engine = engine
        self.version = version
        self.uptime = uptime
        self.connections = connections
        self.syncMode = syncMode
        self.effectiveSyncMode = effectiveSyncMode
        self.syncDegraded = syncDegraded
        self.syncAcknowledgements = syncAcknowledgements
        self.syncStandbyCount = syncStandbyCount
        self.syncStateConfirmed = syncStateConfirmed
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
        self.syncMode = try container.decode(String.self, forKey: .syncMode)
        self.effectiveSyncMode = try container.decodeIfPresent(String.self, forKey: .effectiveSyncMode)
        self.syncDegraded = try container.decode(Bool.self, forKey: .syncDegraded)
        self.syncAcknowledgements = try container.decode(Int.self, forKey: .syncAcknowledgements)
        self.syncStandbyCount = try container.decode(Int.self, forKey: .syncStandbyCount)
        self.syncStateConfirmed = try container.decodeIfPresent(Bool.self, forKey: .syncStateConfirmed)
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
        try container.encode(syncMode, forKey: .syncMode)
        try container.encodeIfPresent(effectiveSyncMode, forKey: .effectiveSyncMode)
        try container.encode(syncDegraded, forKey: .syncDegraded)
        try container.encode(syncAcknowledgements, forKey: .syncAcknowledgements)
        try container.encode(syncStandbyCount, forKey: .syncStandbyCount)
        try container.encodeIfPresent(syncStateConfirmed, forKey: .syncStateConfirmed)
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
            "syncMode": syncMode as Any,
            "effectiveSyncMode": effectiveSyncMode as Any,
            "syncDegraded": syncDegraded as Any,
            "syncAcknowledgements": syncAcknowledgements as Any,
            "syncStandbyCount": syncStandbyCount as Any,
            "syncStateConfirmed": syncStateConfirmed as Any,
            "replicas": replicas.map { $0.toMap() } as Any,
            "volumes": volumes.map { $0.toMap() } as Any,
        ]
    }

    public static func from(map: [String: Any]) -> DatabaseStatus {
        return DatabaseStatus(
            health: map["health"] as! String,
            ready: map["ready"] as! Bool,
            engine: map["engine"] as! String,
            version: map["version"] as! String,
            uptime: map["uptime"] as! Int,
            connections: DatabaseStatusConnections.from(map: map["connections"] as! [String: Any]),
            syncMode: map["syncMode"] as! String,
            effectiveSyncMode: map["effectiveSyncMode"] as? String,
            syncDegraded: map["syncDegraded"] as! Bool,
            syncAcknowledgements: map["syncAcknowledgements"] as! Int,
            syncStandbyCount: map["syncStandbyCount"] as! Int,
            syncStateConfirmed: map["syncStateConfirmed"] as? Bool,
            replicas: (map["replicas"] as! [[String: Any]]).map { DatabaseStatusReplica.from(map: $0) },
            volumes: (map["volumes"] as! [[String: Any]]).map { DatabaseStatusVolume.from(map: $0) }
        )
    }
}
