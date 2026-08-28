import Foundation
import JSONCodable

/// ExecutionColumn
open class DedicatedDatabaseExecutionColumn: Codable {

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case type = "type"
    }

    /// Column name as returned by the database.
    public let name: String
    /// Engine-specific column type (e.g. int4, text, timestamptz).
    public let type: String

    init(
        name: String,
        type: String
    ) {
        self.name = name
        self.type = type
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.name = try container.decode(String.self, forKey: .name)
        self.type = try container.decode(String.self, forKey: .type)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(name, forKey: .name)
        try container.encode(type, forKey: .type)
    }

    public func toMap() -> [String: Any] {
        return [
            "name": name as Any,
            "type": type as Any,
        ]
    }

    public static func from(map: [String: Any]) -> DedicatedDatabaseExecutionColumn {
        return DedicatedDatabaseExecutionColumn(
            name: map["name"] as! String,
            type: map["type"] as! String
        )
    }
}
