import Foundation
import JSONCodable

/// Replica
open class DatabaseStatusReplica: Codable {

    enum CodingKeys: String, CodingKey {
        case index = "index"
        case role = "role"
        case healthy = "healthy"
        case replicating = "replicating"
        case lagSeconds = "lagSeconds"
    }

    /// Member index within the database. Read `role` for which member accepts writes: a failover moves the primary without renumbering the indexes.
    public let index: Int
    /// Member role. Possible values: primary (accepts reads and writes), replica (read-only follower), unknown (placement not established; reported while a transition is moving or restarting the topology, so no member can be named the write target).
    public let role: String
    /// Whether the replica is healthy.
    public let healthy: Bool
    /// Whether the engine reports this member&#039;s replication stream as up. Null when no reading was taken: a primary has no stream to report, and a member that is not healthy, or whose probe did not answer, has none yet. `healthy` is a reachability probe of the member itself and says nothing about replication, so a healthy member may still not be replicating.
    public let replicating: Bool?
    /// Replication lag in seconds (null for primary). Also null against `replicating: true`, for a member that is streaming but whose engine printed no numeric lag.
    public let lagSeconds: Double?

    init(
        index: Int,
        role: String,
        healthy: Bool,
        replicating: Bool?,
        lagSeconds: Double?
    ) {
        self.index = index
        self.role = role
        self.healthy = healthy
        self.replicating = replicating
        self.lagSeconds = lagSeconds
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.index = try container.decode(Int.self, forKey: .index)
        self.role = try container.decode(String.self, forKey: .role)
        self.healthy = try container.decode(Bool.self, forKey: .healthy)
        self.replicating = try container.decodeIfPresent(Bool.self, forKey: .replicating)
        self.lagSeconds = try container.decodeIfPresent(Double.self, forKey: .lagSeconds)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(index, forKey: .index)
        try container.encode(role, forKey: .role)
        try container.encode(healthy, forKey: .healthy)
        try container.encodeIfPresent(replicating, forKey: .replicating)
        try container.encodeIfPresent(lagSeconds, forKey: .lagSeconds)
    }

    public func toMap() -> [String: Any] {
        return [
            "index": index as Any,
            "role": role as Any,
            "healthy": healthy as Any,
            "replicating": replicating as Any,
            "lagSeconds": lagSeconds as Any,
        ]
    }

    public static func from(map: [String: Any]) -> DatabaseStatusReplica {
        return DatabaseStatusReplica(
            index: map["index"] as! Int,
            role: map["role"] as! String,
            healthy: map["healthy"] as! Bool,
            replicating: map["replicating"] as? Bool,
            lagSeconds: map["lagSeconds"] as? Double
        )
    }
}
