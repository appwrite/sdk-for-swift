import Foundation
import JSONCodable

/// Collection
public class Collection {

    /// Collection ID.
    public let id: String

    /// Collection creation date in ISO 8601 format.
    public let createdAt: String

    /// Collection update date in ISO 8601 format.
    public let updatedAt: String

    /// Collection permissions. [Learn more about permissions](/docs/permissions).
    public let permissions: [Any]

    /// Database ID.
    public let databaseId: String

    /// Collection name.
    public let name: String

    /// Collection enabled.
    public let enabled: Bool

    /// Whether document-level permissions are enabled. [Learn more about permissions](/docs/permissions).
    public let documentSecurity: Bool

    /// Collection attributes.
    public let attributes: [Any]

    /// Collection indexes.
    public let indexes: [Index]


    init(
        id: String,
        createdAt: String,
        updatedAt: String,
        permissions: [Any],
        databaseId: String,
        name: String,
        enabled: Bool,
        documentSecurity: Bool,
        attributes: [Any],
        indexes: [Index]
    ) {
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.permissions = permissions
        self.databaseId = databaseId
        self.name = name
        self.enabled = enabled
        self.documentSecurity = documentSecurity
        self.attributes = attributes
        self.indexes = indexes
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "$createdAt": createdAt as Any,
            "$updatedAt": updatedAt as Any,
            "$permissions": permissions as Any,
            "databaseId": databaseId as Any,
            "name": name as Any,
            "enabled": enabled as Any,
            "documentSecurity": documentSecurity as Any,
            "attributes": attributes as Any,
            "indexes": indexes.map { $0.toMap() } as Any
        ]
    }

    public static func from(map: [String: Any] ) -> Collection {
        return Collection(
            id: map["$id"] as! String,
            createdAt: map["$createdAt"] as! String,
            updatedAt: map["$updatedAt"] as! String,
            permissions: map["$permissions"] as! [Any],
            databaseId: map["databaseId"] as! String,
            name: map["name"] as! String,
            enabled: map["enabled"] as! Bool,
            documentSecurity: map["documentSecurity"] as! Bool,
            attributes: map["attributes"] as! [Any],
            indexes: (map["indexes"] as! [[String: Any]]).map { Index.from(map: $0) }
        )
    }
}
