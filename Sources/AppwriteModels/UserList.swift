import Foundation
import JSONCodable

/// Users List
open class UserList<T : Codable>: Codable {

    enum CodingKeys: String, CodingKey {
        case total = "total"
        case users = "users"
    }

    /// Total number of users that matched your query.
    public let total: Int

    /// List of users.
    public let users: [User<T>]


    init(
        total: Int,
        users: [User<T>]
    ) {
        self.total = total
        self.users = users
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.total = try container.decode(Int.self, forKey: .total)
        self.users = try container.decode([User<T>].self, forKey: .users)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(total, forKey: .total)
        try container.encode(users, forKey: .users)
    }

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "users": users.map { $0.toMap() } as Any
        ]
    }

    public static func from(map: [String: Any] ) -> UserList {
        return UserList(
            total: map["total"] as! Int,
            users: (map["users"] as! [[String: Any]]).map { User.from(map: $0) }
        )
    }
}
