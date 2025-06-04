import Foundation
import JSONCodable

/// Database
open class Database: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case name = "name"
        case createdAt = "$createdAt"
        case updatedAt = "$updatedAt"
        case enabled = "enabled"
    }

    /// Database ID.
    public let id: String

    /// Database name.
    public let name: String

    /// Database creation date in ISO 8601 format.
    public let createdAt: String

    /// Database update date in ISO 8601 format.
    public let updatedAt: String

    /// If database is enabled. Can be &#039;enabled&#039; or &#039;disabled&#039;. When disabled, the database is inaccessible to users, but remains accessible to Server SDKs using API keys.
    public let enabled: Bool


    init(
        id: String,
        name: String,
        createdAt: String,
        updatedAt: String,
        enabled: Bool
    ) {
        self.id = id
        self.name = name
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.enabled = enabled
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
        self.enabled = try container.decode(Bool.self, forKey: .enabled)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(updatedAt, forKey: .updatedAt)
        try container.encode(enabled, forKey: .enabled)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "name": name as Any,
            "$createdAt": createdAt as Any,
            "$updatedAt": updatedAt as Any,
            "enabled": enabled as Any
        ]
    }

    public static func from(map: [String: Any] ) -> Database {
        return Database(
            id: map["$id"] as? String ?? "",
            name: map["name"] as? String ?? "",
            createdAt: map["$createdAt"] as? String ?? "",
            updatedAt: map["$updatedAt"] as? String ?? "",
            enabled: map["enabled"] as? Bool ?? false
        )
    }
}
