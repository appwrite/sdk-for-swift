import Foundation
import JSONCodable

/// Collection
open class Collection: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case createdAt = "$createdAt"
        case updatedAt = "$updatedAt"
        case permissions = "$permissions"
        case databaseId = "databaseId"
        case name = "name"
        case enabled = "enabled"
        case documentSecurity = "documentSecurity"
        case attributes = "attributes"
        case indexes = "indexes"
    }

    /// Collection ID.
    public let id: String

    /// Collection creation date in ISO 8601 format.
    public let createdAt: String

    /// Collection update date in ISO 8601 format.
    public let updatedAt: String

    /// Collection permissions. [Learn more about permissions](https://appwrite.io/docs/permissions).
    public let permissions: [String]

    /// Database ID.
    public let databaseId: String

    /// Collection name.
    public let name: String

    /// Collection enabled. Can be &#039;enabled&#039; or &#039;disabled&#039;. When disabled, the collection is inaccessible to users, but remains accessible to Server SDKs using API keys.
    public let enabled: Bool

    /// Whether document-level permissions are enabled. [Learn more about permissions](https://appwrite.io/docs/permissions).
    public let documentSecurity: Bool

    /// Collection attributes.
    public let attributes: [AnyCodable]

    /// Collection indexes.
    public let indexes: [Index]


    init(
        id: String,
        createdAt: String,
        updatedAt: String,
        permissions: [String],
        databaseId: String,
        name: String,
        enabled: Bool,
        documentSecurity: Bool,
        attributes: [AnyCodable],
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

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decode(String.self, forKey: .id)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
        self.permissions = try container.decode([String].self, forKey: .permissions)
        self.databaseId = try container.decode(String.self, forKey: .databaseId)
        self.name = try container.decode(String.self, forKey: .name)
        self.enabled = try container.decode(Bool.self, forKey: .enabled)
        self.documentSecurity = try container.decode(Bool.self, forKey: .documentSecurity)
        self.attributes = try container.decode([AnyCodable].self, forKey: .attributes)
        self.indexes = try container.decode([Index].self, forKey: .indexes)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(updatedAt, forKey: .updatedAt)
        try container.encode(permissions, forKey: .permissions)
        try container.encode(databaseId, forKey: .databaseId)
        try container.encode(name, forKey: .name)
        try container.encode(enabled, forKey: .enabled)
        try container.encode(documentSecurity, forKey: .documentSecurity)
        try container.encode(attributes, forKey: .attributes)
        try container.encode(indexes, forKey: .indexes)
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
            id: map["$id"] as? String ?? "",
            createdAt: map["$createdAt"] as? String ?? "",
            updatedAt: map["$updatedAt"] as? String ?? "",
            permissions: map["$permissions"] as? [String] ?? [],
            databaseId: map["databaseId"] as? String ?? "",
            name: map["name"] as? String ?? "",
            enabled: map["enabled"] as? Bool ?? false,
            documentSecurity: map["documentSecurity"] as? Bool ?? false,
            attributes: (map["attributes"] as? [Any] ?? []).map { AnyCodable($0) },
            indexes: (map["indexes"] as? [[String: Any]] ?? []).map { Index.from(map: $0) }
        )
    }
}
