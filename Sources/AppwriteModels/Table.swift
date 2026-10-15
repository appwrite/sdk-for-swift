import Foundation
import JSONCodable

/// Table
open class Table: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case createdAt = "$createdAt"
        case updatedAt = "$updatedAt"
        case permissions = "$permissions"
        case databaseId = "databaseId"
        case name = "name"
        case enabled = "enabled"
        case rowSecurity = "rowSecurity"
        case columns = "columns"
        case indexes = "indexes"
        case bytesMax = "bytesMax"
        case bytesUsed = "bytesUsed"
    }

    /// Table ID.
    public let id: String
    /// Table creation date in ISO 8601 format.
    public let createdAt: String
    /// Table update date in ISO 8601 format.
    public let updatedAt: String
    /// Table permissions. [Learn more about permissions](https://appwrite.io/docs/permissions).
    public let permissions: [String]
    /// Database ID.
    public let databaseId: String
    /// Table name.
    public let name: String
    /// Table enabled. Can be &#039;enabled&#039; or &#039;disabled&#039;. When disabled, the table is inaccessible to users, but remains accessible to Server SDKs using API keys.
    public let enabled: Bool
    /// Whether row-level permissions are enabled. [Learn more about permissions](https://appwrite.io/docs/permissions).
    public let rowSecurity: Bool
    /// Table columns.
    public let columns: [AnyCodable]
    /// Table indexes.
    public let indexes: [ColumnIndex]
    /// Maximum row size in bytes. Returns 0 when no limit applies.
    public let bytesMax: Int
    /// Currently used row size in bytes based on defined columns.
    public let bytesUsed: Int

    init(
        id: String,
        createdAt: String,
        updatedAt: String,
        permissions: [String],
        databaseId: String,
        name: String,
        enabled: Bool,
        rowSecurity: Bool,
        columns: [AnyCodable],
        indexes: [ColumnIndex],
        bytesMax: Int,
        bytesUsed: Int
    ) {
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.permissions = permissions
        self.databaseId = databaseId
        self.name = name
        self.enabled = enabled
        self.rowSecurity = rowSecurity
        self.columns = columns
        self.indexes = indexes
        self.bytesMax = bytesMax
        self.bytesUsed = bytesUsed
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.contains(.id) ? container.decode(String.self, forKey: .id) : ""
        self.createdAt = try container.contains(.createdAt) ? container.decode(String.self, forKey: .createdAt) : ""
        self.updatedAt = try container.contains(.updatedAt) ? container.decode(String.self, forKey: .updatedAt) : ""
        self.permissions = try container.contains(.permissions) ? container.decode([String].self, forKey: .permissions) : []
        self.databaseId = try container.contains(.databaseId) ? container.decode(String.self, forKey: .databaseId) : ""
        self.name = try container.contains(.name) ? container.decode(String.self, forKey: .name) : ""
        self.enabled = try container.contains(.enabled) ? container.decode(Bool.self, forKey: .enabled) : true
        self.rowSecurity = try container.contains(.rowSecurity) ? container.decode(Bool.self, forKey: .rowSecurity) : false
        self.columns = try container.contains(.columns) ? container.decode([AnyCodable].self, forKey: .columns) : []
        self.indexes = try container.contains(.indexes) ? container.decode([ColumnIndex].self, forKey: .indexes) : []
        self.bytesMax = try container.contains(.bytesMax) ? container.decode(Int.self, forKey: .bytesMax) : 0
        self.bytesUsed = try container.contains(.bytesUsed) ? container.decode(Int.self, forKey: .bytesUsed) : 0
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
        try container.encode(rowSecurity, forKey: .rowSecurity)
        try container.encode(columns, forKey: .columns)
        try container.encode(indexes, forKey: .indexes)
        try container.encode(bytesMax, forKey: .bytesMax)
        try container.encode(bytesUsed, forKey: .bytesUsed)
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
            "rowSecurity": rowSecurity as Any,
            "columns": columns as Any,
            "indexes": indexes.map { $0.toMap() } as Any,
            "bytesMax": bytesMax as Any,
            "bytesUsed": bytesUsed as Any,
        ]
    }

    public static func from(map: [String: Any]) -> Table {
        let defaults: [String: Any] = [
            "$id": "",
            "$createdAt": "",
            "$updatedAt": "",
            "$permissions": [Any](),
            "databaseId": "",
            "name": "",
            "enabled": true,
            "rowSecurity": false,
            "columns": [Any](),
            "indexes": [Any](),
            "bytesMax": 0,
            "bytesUsed": 0,
        ]
        let map = defaults.merging(map) { _, new in new }

        return Table(
            id: map["$id"] as! String,
            createdAt: map["$createdAt"] as! String,
            updatedAt: map["$updatedAt"] as! String,
            permissions: map["$permissions"] as! [String],
            databaseId: map["databaseId"] as! String,
            name: map["name"] as! String,
            enabled: map["enabled"] as! Bool,
            rowSecurity: map["rowSecurity"] as! Bool,
            columns: (map["columns"] as! [Any]).map { AnyCodable($0) },
            indexes: (map["indexes"] as! [[String: Any]]).map { ColumnIndex.from(map: $0) },
            bytesMax: map["bytesMax"] as! Int,
            bytesUsed: map["bytesUsed"] as! Int
        )
    }
}
