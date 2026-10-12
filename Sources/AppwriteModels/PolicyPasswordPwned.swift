import Foundation
import JSONCodable

/// Policy Password Pwned
open class PolicyPasswordPwned: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case enabled = "enabled"
        case sessions = "sessions"
        case users = "users"
    }

    /// Policy ID.
    public let id: String
    /// Whether passwords are checked against known data breaches and the result recorded on the user.
    public let enabled: Bool
    /// Whether a sign-in with a breached password is refused until the password is reset.
    public let sessions: Bool
    /// Whether a breached password is rejected when a user signs up or sets a new password.
    public let users: Bool

    init(
        id: String,
        enabled: Bool,
        sessions: Bool,
        users: Bool
    ) {
        self.id = id
        self.enabled = enabled
        self.sessions = sessions
        self.users = users
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.contains(.id) ? container.decode(String.self, forKey: .id) : ""
        self.enabled = try container.contains(.enabled) ? container.decode(Bool.self, forKey: .enabled) : true
        self.sessions = try container.contains(.sessions) ? container.decode(Bool.self, forKey: .sessions) : false
        self.users = try container.contains(.users) ? container.decode(Bool.self, forKey: .users) : false
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(enabled, forKey: .enabled)
        try container.encode(sessions, forKey: .sessions)
        try container.encode(users, forKey: .users)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "enabled": enabled as Any,
            "sessions": sessions as Any,
            "users": users as Any,
        ]
    }

    public static func from(map: [String: Any]) -> PolicyPasswordPwned {
        let defaults: [String: Any] = [
            "$id": "",
            "enabled": true,
            "sessions": false,
            "users": false,
        ]
        let map = defaults.merging(map) { _, new in new }

        return PolicyPasswordPwned(
            id: map["$id"] as! String,
            enabled: map["enabled"] as! Bool,
            sessions: map["sessions"] as! Bool,
            users: map["users"] as! Bool
        )
    }
}
