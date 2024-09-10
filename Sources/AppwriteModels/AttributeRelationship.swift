import Foundation
import JSONCodable

/// AttributeRelationship
public class AttributeRelationship {

    /// Attribute Key.
    public let key: String

    /// Attribute type.
    public let type: String

    /// Attribute status. Possible values: `available`, `processing`, `deleting`, `stuck`, or `failed`
    public let status: String

    /// Error message. Displays error generated on failure of creating or deleting an attribute.
    public let error: String

    /// Is attribute required?
    public let `required`: Bool

    /// Is attribute an array?
    public let array: Bool?

    /// The ID of the related collection.
    public let relatedCollection: String

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
        status: String,
        error: String,
        `required`: Bool,
        array: Bool?,
        relatedCollection: String,
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
        self.relatedCollection = relatedCollection
        self.relationType = relationType
        self.twoWay = twoWay
        self.twoWayKey = twoWayKey
        self.onDelete = onDelete
        self.side = side
    }

    public func toMap() -> [String: Any] {
        return [
            "key": key as Any,
            "type": type as Any,
            "status": status as Any,
            "error": error as Any,
            "`required`": `required` as Any,
            "array": array as Any,
            "relatedCollection": relatedCollection as Any,
            "relationType": relationType as Any,
            "twoWay": twoWay as Any,
            "twoWayKey": twoWayKey as Any,
            "onDelete": onDelete as Any,
            "side": side as Any
        ]
    }

    public static func from(map: [String: Any] ) -> AttributeRelationship {
        return AttributeRelationship(
            key: map["key"] as! String,
            type: map["type"] as! String,
            status: map["status"] as! String,
            error: map["error"] as! String,
            `required`: map["required"] as! Bool,
            array: map["array"] as? Bool,
            relatedCollection: map["relatedCollection"] as! String,
            relationType: map["relationType"] as! String,
            twoWay: map["twoWay"] as! Bool,
            twoWayKey: map["twoWayKey"] as! String,
            onDelete: map["onDelete"] as! String,
            side: map["side"] as! String
        )
    }
}
