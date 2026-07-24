import Foundation
import JSONCodable

/// Replica
open class DatabaseStatusReplica: Codable {

    enum CodingKeys: String, CodingKey {
        case index = "index"
        case role = "role"
        case healthy = "healthy"
        case lagSeconds = "lagSeconds"
    }

    /// StatefulSet pod index (0 = primary, 1+ = replicas).
    public let index: Int
    /// Replica role: primary or replica.
    public let role: String
    /// Whether the replica is healthy.
    public let healthy: Bool
    /// Replication lag in seconds (null for primary).
    public let lagSeconds: Double?

    init(
        index: Int,
        role: String,
        healthy: Bool,
        lagSeconds: Double?
    ) {
        self.index = index
        self.role = role
        self.healthy = healthy
        self.lagSeconds = lagSeconds
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.index = try container.decode(Int.self, forKey: .index)
        self.role = try container.decode(String.self, forKey: .role)
        self.healthy = try container.decode(Bool.self, forKey: .healthy)
        self.lagSeconds = try container.decodeIfPresent(Double.self, forKey: .lagSeconds)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(index, forKey: .index)
        try container.encode(role, forKey: .role)
        try container.encode(healthy, forKey: .healthy)
        try container.encodeIfPresent(lagSeconds, forKey: .lagSeconds)
    }

    public func toMap() -> [String: Any] {
        return [
            "index": index as Any,
            "role": role as Any,
            "healthy": healthy as Any,
            "lagSeconds": lagSeconds as Any
        ]
    }

    public static func from(map: [String: Any] ) -> DatabaseStatusReplica {
        return DatabaseStatusReplica(
            index: map["index"] as! Int,
            role: map["role"] as! String,
            healthy: map["healthy"] as! Bool,
            lagSeconds: map["lagSeconds"] as? Double
        )
    }
}
