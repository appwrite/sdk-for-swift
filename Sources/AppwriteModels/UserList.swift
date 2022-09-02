
/// Users List
public class UserList {

    /// Total number of users documents that matched your query.
    public let total: Int

    /// List of users.
    public let users: [User]

    init(
        total: Int,
        users: [User]
    ) {
        self.total = total
        self.users = users
    }

    public static func from(map: [String: Any]) -> UserList {
        return UserList(
            total: map["total"] as! Int,
            users: (map["users"] as! [[String: Any]]).map { User.from(map: $0) }
        )
    }

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "users": users.map { $0.toMap() } as Any
        ]
    }
                                                                                                                                                                                                                                                                                            
}