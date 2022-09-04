
/// Database
public class Database {

    /// Database ID.
    public let id: String

    /// Database name.
    public let name: String

    /// Database creation date in ISO 8601 format.
    public let createdAt: String

    /// Database update date in ISO 8601 format.
    public let updatedAt: String

    init(
        id: String,
        name: String,
        createdAt: String,
        updatedAt: String
    ) {
        self.id = id
        self.name = name
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }

    public static func from(map: [String: Any]) -> Database {
        return Database(
            id: map["$id"] as! String,
            name: map["name"] as! String,
            createdAt: map["$createdAt"] as! String,
            updatedAt: map["$updatedAt"] as! String
        )
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "name": name as Any,
            "$createdAt": createdAt as Any,
            "$updatedAt": updatedAt as Any
        ]
    }
                    
}