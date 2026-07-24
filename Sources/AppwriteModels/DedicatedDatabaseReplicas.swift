import Foundation
import JSONCodable

/// Replicas
open class DedicatedDatabaseReplicas: Codable {

    enum CodingKeys: String, CodingKey {
        case replicas = "replicas"
        case syncMode = "syncMode"
        case members = "members"
    }

    /// Number of configured replicas. Zero means high availability is disabled.
    public let replicas: Int
    /// Replication sync mode. Possible values: async (asynchronous, fastest), sync (synchronous, strong consistency), quorum (quorum-based, majority of replicas must confirm).
    public let syncMode: String
    /// Per-pod statuses for the primary and every replica.
    public let members: [DedicatedDatabaseMember]

    init(
        replicas: Int,
        syncMode: String,
        members: [DedicatedDatabaseMember]
    ) {
        self.replicas = replicas
        self.syncMode = syncMode
        self.members = members
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.replicas = try container.decode(Int.self, forKey: .replicas)
        self.syncMode = try container.decode(String.self, forKey: .syncMode)
        self.members = try container.decode([DedicatedDatabaseMember].self, forKey: .members)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(replicas, forKey: .replicas)
        try container.encode(syncMode, forKey: .syncMode)
        try container.encode(members, forKey: .members)
    }

    public func toMap() -> [String: Any] {
        return [
            "replicas": replicas as Any,
            "syncMode": syncMode as Any,
            "members": members.map { $0.toMap() } as Any
        ]
    }

    public static func from(map: [String: Any] ) -> DedicatedDatabaseReplicas {
        return DedicatedDatabaseReplicas(
            replicas: map["replicas"] as! Int,
            syncMode: map["syncMode"] as! String,
            members: (map["members"] as! [[String: Any]]).map { DedicatedDatabaseMember.from(map: $0) }
        )
    }
}
