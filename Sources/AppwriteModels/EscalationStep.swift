import Foundation
import JSONCodable

/// Escalation Step
open class EscalationStep: Codable {

    enum CodingKeys: String, CodingKey {
        case delay = "delay"
        case roles = "roles"
        case userIds = "userIds"
    }

    /// Seconds to wait before notifying this step: after the alert fires for the first step, after the previous step for the others.
    public let delay: Int
    /// Organization roles whose confirmed members this step notifies.
    public let roles: [String]
    /// IDs of the organization&#039;s members this step notifies, whatever their role.
    public let userIds: [String]

    init(
        delay: Int,
        roles: [String],
        userIds: [String]
    ) {
        self.delay = delay
        self.roles = roles
        self.userIds = userIds
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.delay = try container.contains(.delay) ? container.decode(Int.self, forKey: .delay) : 0
        self.roles = try container.contains(.roles) ? container.decode([String].self, forKey: .roles) : []
        self.userIds = try container.contains(.userIds) ? container.decode([String].self, forKey: .userIds) : []
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(delay, forKey: .delay)
        try container.encode(roles, forKey: .roles)
        try container.encode(userIds, forKey: .userIds)
    }

    public func toMap() -> [String: Any] {
        return [
            "delay": delay as Any,
            "roles": roles as Any,
            "userIds": userIds as Any,
        ]
    }

    public static func from(map: [String: Any]) -> EscalationStep {
        let defaults: [String: Any] = [
            "delay": 0,
            "roles": [Any](),
            "userIds": [Any](),
        ]
        let map = defaults.merging(map) { _, new in new }

        return EscalationStep(
            delay: map["delay"] as! Int,
            roles: map["roles"] as! [String],
            userIds: map["userIds"] as! [String]
        )
    }
}
