import Foundation
import JSONCodable

/// Index
open class Index: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case createdAt = "$createdAt"
        case updatedAt = "$updatedAt"
        case key = "key"
        case type = "type"
        case status = "status"
        case error = "error"
        case attributes = "attributes"
        case lengths = "lengths"
        case orders = "orders"
    }

    /// Index ID.
    public let id: String

    /// Index creation date in ISO 8601 format.
    public let createdAt: String

    /// Index update date in ISO 8601 format.
    public let updatedAt: String

    /// Index key.
    public let key: String

    /// Index type.
    public let type: String

    /// Index status. Possible values: `available`, `processing`, `deleting`, `stuck`, or `failed`
    public let status: String

    /// Error message. Displays error generated on failure of creating or deleting an index.
    public let error: String

    /// Index attributes.
    public let attributes: [String]

    /// Index attributes length.
    public let lengths: [Int]

    /// Index orders.
    public let orders: [String]?


    init(
        id: String,
        createdAt: String,
        updatedAt: String,
        key: String,
        type: String,
        status: String,
        error: String,
        attributes: [String],
        lengths: [Int],
        orders: [String]?
    ) {
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.key = key
        self.type = type
        self.status = status
        self.error = error
        self.attributes = attributes
        self.lengths = lengths
        self.orders = orders
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decode(String.self, forKey: .id)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
        self.key = try container.decode(String.self, forKey: .key)
        self.type = try container.decode(String.self, forKey: .type)
        self.status = try container.decode(String.self, forKey: .status)
        self.error = try container.decode(String.self, forKey: .error)
        self.attributes = try container.decode([String].self, forKey: .attributes)
        self.lengths = try container.decode([Int].self, forKey: .lengths)
        self.orders = try container.decodeIfPresent([String].self, forKey: .orders)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(updatedAt, forKey: .updatedAt)
        try container.encode(key, forKey: .key)
        try container.encode(type, forKey: .type)
        try container.encode(status, forKey: .status)
        try container.encode(error, forKey: .error)
        try container.encode(attributes, forKey: .attributes)
        try container.encode(lengths, forKey: .lengths)
        try container.encodeIfPresent(orders, forKey: .orders)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "$createdAt": createdAt as Any,
            "$updatedAt": updatedAt as Any,
            "key": key as Any,
            "type": type as Any,
            "status": status as Any,
            "error": error as Any,
            "attributes": attributes as Any,
            "lengths": lengths as Any,
            "orders": orders as Any
        ]
    }

    public static func from(map: [String: Any] ) -> Index {
        return Index(
            id: map["$id"] as! String,
            createdAt: map["$createdAt"] as! String,
            updatedAt: map["$updatedAt"] as! String,
            key: map["key"] as! String,
            type: map["type"] as! String,
            status: map["status"] as! String,
            error: map["error"] as! String,
            attributes: map["attributes"] as! [String],
            lengths: map["lengths"] as! [Int],
            orders: map["orders"] as? [String]
        )
    }
}
