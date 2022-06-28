
/// Database
public class Database {

    /// Database ID.
    public let id: String

    /// Database name.
    public let name: String

    init(
        id: String,
        name: String
    ) {
        self.id = id
        self.name = name
    }

    public static func from(map: [String: Any]) -> Database {
        return Database(
            id: map["$id"] as! String,
            name: map["name"] as! String
        )
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "name": name as Any
        ]
    }
            
}