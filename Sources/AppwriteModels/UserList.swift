import Foundation

/// Users List
public class UserList<T : Codable> {

    /// Total number of users documents that matched your query.
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
