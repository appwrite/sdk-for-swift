import Foundation
import JSONCodable
import AppwriteEnums

/// ColumnRelationship
open class ColumnRelationship: Codable {

    enum CodingKeys: String, CodingKey {
        case key = "key"
        case type = "type"
        case status = "status"
        case error = "error"
        case `required` = "required"
        case array = "array"
        case createdAt = "$createdAt"
        case updatedAt = "$updatedAt"
        case relatedTable = "relatedTable"
        case relationType = "relationType"
        case twoWay = "twoWay"
        case twoWayKey = "twoWayKey"
        case onDelete = "onDelete"
        case side = "side"
    }

    /// Column Key.
    public let key: String

    /// Column type.
    public let type: String

    /// Column status. Possible values: `available`, `processing`, `deleting`, `stuck`, or `failed`
    public let status: AppwriteEnums.ColumnStatus

    /// Error message. Displays error generated on failure of creating or deleting an column.
    public let error: String

    /// Is column required?
    public let `required`: Bool

    /// Is column an array?
    public let array: Bool?

    /// Column creation date in ISO 8601 format.
    public let createdAt: String

    /// Column update date in ISO 8601 format.
    public let updatedAt: String

    /// The ID of the related table.
    public let relatedTable: String

    /// The type of the relationship.
    public let relationType: String

    /// Is the relationship two-way?
    public let twoWay: Bool

    /// The key of the two-way relationship.
    public let twoWayKey: String

    /// How deleting the parent document will propagate to child documents.
    public let onDelete: String

    /// Whether this is the parent or child side of the relationship
    public let side: String


    init(
        key: String,
        type: String,
        status: AppwriteEnums.ColumnStatus,
        error: String,
        `required`: Bool,
        array: Bool?,
        createdAt: String,
        updatedAt: String,
        relatedTable: String,
        relationType: String,
        twoWay: Bool,
        twoWayKey: String,
        onDelete: String,
        side: String
    ) {
        self.key = key
        self.type = type
        self.status = status
        self.error = error
        self.`required` = `required`
        self.array = array
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.relatedTable = relatedTable
        self.relationType = relationType
        self.twoWay = twoWay
        self.twoWayKey = twoWayKey
        self.onDelete = onDelete
        self.side = side
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.key = try container.decode(String.self, forKey: .key)
        self.type = try container.decode(String.self, forKey: .type)
        self.status = AppwriteEnums.ColumnStatus(rawValue: try container.decode(String.self, forKey: .status))!
        self.error = try container.decode(String.self, forKey: .error)
        self.`required` = try container.decode(Bool.self, forKey: .`required`)
        self.array = try container.decodeIfPresent(Bool.self, forKey: .array)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
        self.relatedTable = try container.decode(String.self, forKey: .relatedTable)
        self.relationType = try container.decode(String.self, forKey: .relationType)
        self.twoWay = try container.decode(Bool.self, forKey: .twoWay)
        self.twoWayKey = try container.decode(String.self, forKey: .twoWayKey)
        self.onDelete = try container.decode(String.self, forKey: .onDelete)
        self.side = try container.decode(String.self, forKey: .side)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(key, forKey: .key)
        try container.encode(type, forKey: .type)
        try container.encode(status.rawValue, forKey: .status)
        try container.encode(error, forKey: .error)
        try container.encode(`required`, forKey: .`required`)
        try container.encodeIfPresent(array, forKey: .array)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(updatedAt, forKey: .updatedAt)
        try container.encode(relatedTable, forKey: .relatedTable)
        try container.encode(relationType, forKey: .relationType)
        try container.encode(twoWay, forKey: .twoWay)
        try container.encode(twoWayKey, forKey: .twoWayKey)
        try container.encode(onDelete, forKey: .onDelete)
        try container.encode(side, forKey: .side)
    }

    public func toMap() -> [String: Any] {
        return [
            "key": key as Any,
            "type": type as Any,
            "status": status.rawValue as Any,
            "error": error as Any,
            "required": `required` as Any,
            "array": array as Any,
            "$createdAt": createdAt as Any,
            "$updatedAt": updatedAt as Any,
            "relatedTable": relatedTable as Any,
            "relationType": relationType as Any,
            "twoWay": twoWay as Any,
            "twoWayKey": twoWayKey as Any,
            "onDelete": onDelete as Any,
            "side": side as Any
        ]
    }

    public static func from(map: [String: Any] ) -> ColumnRelationship {
        return ColumnRelationship(
            key: map["key"] as! String,
            type: map["type"] as! String,
            status: ColumnStatus(rawValue: map["status"] as! String)!,
            error: map["error"] as! String,
            required: map["required"] as! Bool,
            array: map["array"] as? Bool,
            createdAt: map["$createdAt"] as! String,
            updatedAt: map["$updatedAt"] as! String,
            relatedTable: map["relatedTable"] as! String,
            relationType: map["relationType"] as! String,
            twoWay: map["twoWay"] as! Bool,
            twoWayKey: map["twoWayKey"] as! String,
            onDelete: map["onDelete"] as! String,
            side: map["side"] as! String
        )
    }
}
