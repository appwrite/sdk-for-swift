import Foundation
import JSONCodable

/// Member
open class DedicatedDatabaseMember: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case role = "role"
        case status = "status"
        case lagSeconds = "lagSeconds"
    }

    /// Member identifier.
    public let id: String
    /// Member role. Possible values: primary (accepts reads and writes), replica (read-only follower), unknown (placement not established; reported while a transition is moving or restarting the topology and this member has not been probed, so no member can be named the write target).
    public let role: String
    /// Member pod status. Possible values: pending (configured but absent from the backend topology, so nothing is bringing it up), provisioning (pod missing or Pending), starting (Running but not Ready), active (Running and Ready), failed (Failed phase or CrashLoopBackOff container), or the lowercased pod phase reported by the cluster.
    public let status: String
    /// Replication lag in seconds. Null when the lag is not known: a primary has none to report, and a member the backend has not probed has none yet.
    public let lagSeconds: Double?

    init(
        id: String,
        role: String,
        status: String,
        lagSeconds: Double?
    ) {
        self.id = id
        self.role = role
        self.status = status
        self.lagSeconds = lagSeconds
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decode(String.self, forKey: .id)
        self.role = try container.decode(String.self, forKey: .role)
        self.status = try container.decode(String.self, forKey: .status)
        self.lagSeconds = try container.decodeIfPresent(Double.self, forKey: .lagSeconds)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(role, forKey: .role)
        try container.encode(status, forKey: .status)
        try container.encodeIfPresent(lagSeconds, forKey: .lagSeconds)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "role": role as Any,
            "status": status as Any,
            "lagSeconds": lagSeconds as Any
        ]
    }

    public static func from(map: [String: Any] ) -> DedicatedDatabaseMember {
        return DedicatedDatabaseMember(
            id: map["$id"] as! String,
            role: map["role"] as! String,
            status: map["status"] as! String,
            lagSeconds: map["lagSeconds"] as? Double
        )
    }
}
