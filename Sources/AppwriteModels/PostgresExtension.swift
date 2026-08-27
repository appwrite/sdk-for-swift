import Foundation
import JSONCodable

/// Postgres extension
open class PostgresExtension: Codable {

    enum CodingKeys: String, CodingKey {
        case key = "key"
        case name = "name"
        case description = "description"
        case category = "category"
    }

    /// Extension key used with CREATE EXTENSION.
    public let key: String
    /// Human-readable extension name.
    public let name: String
    /// Short description of what the extension provides.
    public let description: String
    /// Category the extension belongs to.
    public let category: String

    init(
        key: String,
        name: String,
        description: String,
        category: String
    ) {
        self.key = key
        self.name = name
        self.description = description
        self.category = category
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.key = try container.decode(String.self, forKey: .key)
        self.name = try container.decode(String.self, forKey: .name)
        self.description = try container.decode(String.self, forKey: .description)
        self.category = try container.decode(String.self, forKey: .category)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(key, forKey: .key)
        try container.encode(name, forKey: .name)
        try container.encode(description, forKey: .description)
        try container.encode(category, forKey: .category)
    }

    public func toMap() -> [String: Any] {
        return [
            "key": key as Any,
            "name": name as Any,
            "description": description as Any,
            "category": category as Any,
        ]
    }

    public static func from(map: [String: Any]) -> PostgresExtension {
        return PostgresExtension(
            key: map["key"] as! String,
            name: map["name"] as! String,
            description: map["description"] as! String,
            category: map["category"] as! String
        )
    }
}
