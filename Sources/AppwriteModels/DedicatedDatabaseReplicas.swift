import Foundation
import JSONCodable

/// Replicas
open class DedicatedDatabaseReplicas: Codable {

    enum CodingKeys: String, CodingKey {
        case replicas = "replicas"
        case syncMode = "syncMode"
        case effectiveSyncMode = "effectiveSyncMode"
        case syncDegraded = "syncDegraded"
        case syncAcknowledgements = "syncAcknowledgements"
        case syncStandbyCount = "syncStandbyCount"
        case syncStateConfirmed = "syncStateConfirmed"
        case members = "members"
    }

    /// Number of configured replicas. Zero means high availability is disabled.
    public let replicas: Int
    /// Requested replication sync mode. Possible values: async (asynchronous, fastest), sync (synchronous, strong consistency), quorum (quorum-based, majority of replicas must confirm). This is what was asked for; compare it with effectiveSyncMode for what the primary is enforcing.
    public let syncMode: String
    /// Replication sync mode the primary is actually enforcing. Null when high availability is disabled or the state could not be read. A value below the requested syncMode means writes are being acknowledged with weaker durability than configured.
    public let effectiveSyncMode: String?
    /// Whether the enforced replication is weaker than the requested syncMode.
    public let syncDegraded: Bool
    /// Number of standby acknowledgements the primary waits for before a write is committed. Zero means writes are acknowledged locally.
    public let syncAcknowledgements: Int
    /// Number of standbys registered with the primary for synchronous replication.
    public let syncStandbyCount: Int
    /// Whether the other sync fields are an engine reading rather than a recorded estimate. True when the primary answered what it is enforcing, including when that answer contradicted the record, in which case the contradicted values are replaced by the ones the engine reports. False when the reading could not be taken: the probe did not answer, there was no engine to ask, or the values describe a configuration change just applied rather than anything measured. Absent when no engine was asked at all, so an unprobed database is distinguishable from an unconfirmed one. False never means a standby was found lagging, because it is the absence of a reading rather than a negative one, so draw no conclusion about replication health from it or from a response that omits it.
    public let syncStateConfirmed: Bool?
    /// Per-pod statuses for the primary and every replica.
    public let members: [DedicatedDatabaseMember]

    init(
        replicas: Int,
        syncMode: String,
        effectiveSyncMode: String?,
        syncDegraded: Bool,
        syncAcknowledgements: Int,
        syncStandbyCount: Int,
        syncStateConfirmed: Bool?,
        members: [DedicatedDatabaseMember]
    ) {
        self.replicas = replicas
        self.syncMode = syncMode
        self.effectiveSyncMode = effectiveSyncMode
        self.syncDegraded = syncDegraded
        self.syncAcknowledgements = syncAcknowledgements
        self.syncStandbyCount = syncStandbyCount
        self.syncStateConfirmed = syncStateConfirmed
        self.members = members
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.replicas = try container.decode(Int.self, forKey: .replicas)
        self.syncMode = try container.decode(String.self, forKey: .syncMode)
        self.effectiveSyncMode = try container.decodeIfPresent(String.self, forKey: .effectiveSyncMode)
        self.syncDegraded = try container.decode(Bool.self, forKey: .syncDegraded)
        self.syncAcknowledgements = try container.decode(Int.self, forKey: .syncAcknowledgements)
        self.syncStandbyCount = try container.decode(Int.self, forKey: .syncStandbyCount)
        self.syncStateConfirmed = try container.decodeIfPresent(Bool.self, forKey: .syncStateConfirmed)
        self.members = try container.decode([DedicatedDatabaseMember].self, forKey: .members)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(replicas, forKey: .replicas)
        try container.encode(syncMode, forKey: .syncMode)
        try container.encodeIfPresent(effectiveSyncMode, forKey: .effectiveSyncMode)
        try container.encode(syncDegraded, forKey: .syncDegraded)
        try container.encode(syncAcknowledgements, forKey: .syncAcknowledgements)
        try container.encode(syncStandbyCount, forKey: .syncStandbyCount)
        try container.encodeIfPresent(syncStateConfirmed, forKey: .syncStateConfirmed)
        try container.encode(members, forKey: .members)
    }

    public func toMap() -> [String: Any] {
        return [
            "replicas": replicas as Any,
            "syncMode": syncMode as Any,
            "effectiveSyncMode": effectiveSyncMode as Any,
            "syncDegraded": syncDegraded as Any,
            "syncAcknowledgements": syncAcknowledgements as Any,
            "syncStandbyCount": syncStandbyCount as Any,
            "syncStateConfirmed": syncStateConfirmed as Any,
            "members": members.map { $0.toMap() } as Any
        ]
    }

    public static func from(map: [String: Any] ) -> DedicatedDatabaseReplicas {
        return DedicatedDatabaseReplicas(
            replicas: map["replicas"] as! Int,
            syncMode: map["syncMode"] as! String,
            effectiveSyncMode: map["effectiveSyncMode"] as? String,
            syncDegraded: map["syncDegraded"] as! Bool,
            syncAcknowledgements: map["syncAcknowledgements"] as! Int,
            syncStandbyCount: map["syncStandbyCount"] as! Int,
            syncStateConfirmed: map["syncStateConfirmed"] as? Bool,
            members: (map["members"] as! [[String: Any]]).map { DedicatedDatabaseMember.from(map: $0) }
        )
    }
}
