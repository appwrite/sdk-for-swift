import Foundation
import JSONCodable

/// Index
open class ColumnIndex: Codable {

    enum CodingKeys: String, CodingKey {
        case key = "key"
        case type = "type"
        case status = "status"
        case error = "error"
        case columns = "columns"
        case lengths = "lengths"
        case orders = "orders"
        case createdAt = "$createdAt"
        case updatedAt = "$updatedAt"
    }

    /// Index Key.
    public let key: String

    /// Index type.
    public let type: String

    /// Index status. Possible values: `available`, `processing`, `deleting`, `stuck`, or `failed`
    public let status: String

    /// Error message. Displays error generated on failure of creating or deleting an index.
    public let error: String

    /// Index columns.
    public let columns: [String]

    /// Index columns length.
    public let lengths: [Int]

    /// Index orders.
    public let orders: [String]?

    /// Index creation date in ISO 8601 format.
    public let createdAt: String

    /// Index update date in ISO 8601 format.
    public let updatedAt: String


    init(
        key: String,
        type: String,
        status: String,
        error: String,
        columns: [String],
        lengths: [Int],
        orders: [String]?,
        createdAt: String,
        updatedAt: String
    ) {
        self.key = key
        self.type = type
        self.status = status
        self.error = error
        self.columns = columns
        self.lengths = lengths
        self.orders = orders
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.key = try container.decode(String.self, forKey: .key)
        self.type = try container.decode(String.self, forKey: .type)
        self.status = try container.decode(String.self, forKey: .status)
        self.error = try container.decode(String.self, forKey: .error)
        self.columns = try container.decode([String].self, forKey: .columns)
        self.lengths = try container.decode([Int].self, forKey: .lengths)
        self.orders = try container.decodeIfPresent([String].self, forKey: .orders)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(key, forKey: .key)
        try container.encode(type, forKey: .type)
        try container.encode(status, forKey: .status)
        try container.encode(error, forKey: .error)
        try container.encode(columns, forKey: .columns)
        try container.encode(lengths, forKey: .lengths)
        try container.encodeIfPresent(orders, forKey: .orders)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(updatedAt, forKey: .updatedAt)
    }

    public func toMap() -> [String: Any] {
        return [
            "key": key as Any,
            "type": type as Any,
            "status": status as Any,
            "error": error as Any,
            "columns": columns as Any,
            "lengths": lengths as Any,
            "orders": orders as Any,
            "$createdAt": createdAt as Any,
            "$updatedAt": updatedAt as Any
        ]
    }

    public static func from(map: [String: Any] ) -> ColumnIndex {
        return ColumnIndex(
            key: map["key"] as! String,
            type: map["type"] as! String,
            status: map["status"] as! String,
            error: map["error"] as! String,
            columns: map["columns"] as! [String],
            lengths: map["lengths"] as! [Int],
            orders: map["orders"] as? [String],
            createdAt: map["$createdAt"] as! String,
            updatedAt: map["$updatedAt"] as! String
        )
    }
}
