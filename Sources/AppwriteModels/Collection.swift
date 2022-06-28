
/// Collection
public class Collection {

    /// Collection ID.
    public let id: String

    /// Collection creation date in Unix timestamp.
    public let createdAt: Int

    /// Collection update date in Unix timestamp.
    public let updatedAt: Int

    /// Collection read permissions.
    public let read: [Any]

    /// Collection write permissions.
    public let write: [Any]

    /// Database ID.
    public let databaseId: String

    /// Collection name.
    public let name: String

    /// Collection enabled.
    public let enabled: Bool

    /// Collection permission model. Possible values: `document` or `collection`
    public let permission: String

    /// Collection attributes.
    public let attributes: [Any]

    /// Collection indexes.
    public let indexes: [Index]

    init(
        id: String,
        createdAt: Int,
        updatedAt: Int,
        read: [Any],
        write: [Any],
        databaseId: String,
        name: String,
        enabled: Bool,
        permission: String,
        attributes: [Any],
        indexes: [Index]
    ) {
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.read = read
        self.write = write
        self.databaseId = databaseId
        self.name = name
        self.enabled = enabled
        self.permission = permission
        self.attributes = attributes
        self.indexes = indexes
    }

    public static func from(map: [String: Any]) -> Collection {
        return Collection(
            id: map["$id"] as! String,
            createdAt: map["$createdAt"] as! Int,
            updatedAt: map["$updatedAt"] as! Int,
            read: map["$read"] as! [Any],
            write: map["$write"] as! [Any],
            databaseId: map["databaseId"] as! String,
            name: map["name"] as! String,
            enabled: map["enabled"] as! Bool,
            permission: map["permission"] as! String,
            attributes: map["attributes"] as! [Any],
            indexes: (map["indexes"] as! [[String: Any]]).map { Index.from(map: $0) }
        )
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "$createdAt": createdAt as Any,
            "$updatedAt": updatedAt as Any,
            "$read": read as Any,
            "$write": write as Any,
            "databaseId": databaseId as Any,
            "name": name as Any,
            "enabled": enabled as Any,
            "permission": permission as Any,
            "attributes": attributes as Any,
            "indexes": indexes.map { $0.toMap() } as Any
        ]
    }
                                                                                                                                                                                                                                                                                    
}