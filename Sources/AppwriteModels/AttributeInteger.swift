import Foundation
import JSONCodable

/// AttributeInteger
public class AttributeInteger {

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

    /// Minimum value to enforce for new documents.
    public let min: Int?

    /// Maximum value to enforce for new documents.
    public let max: Int?

    /// Default value for attribute when not provided. Cannot be set when attribute is required.
    public let `default`: Int?


    init(
        key: String,
        type: String,
        status: String,
        error: String,
        `required`: Bool,
        array: Bool?,
        min: Int?,
        max: Int?,
        `default`: Int?
    ) {
        self.key = key
        self.type = type
        self.status = status
        self.error = error
        self.`required` = `required`
        self.array = array
        self.min = min
        self.max = max
        self.`default` = `default`
    }

    public func toMap() -> [String: Any] {
        return [
            "key": key as Any,
            "type": type as Any,
            "status": status as Any,
            "error": error as Any,
            "`required`": `required` as Any,
            "array": array as Any,
            "min": min as Any,
            "max": max as Any,
            "`default`": `default` as Any
        ]
    }

    public static func from(map: [String: Any] ) -> AttributeInteger {
        return AttributeInteger(
            key: map["key"] as! String,
            type: map["type"] as! String,
            status: map["status"] as! String,
            error: map["error"] as! String,
            `required`: map["required"] as! Bool,
            array: map["array"] as? Bool,
            min: map["min"] as? Int,
            max: map["max"] as? Int,
            `default`: map["default"] as? Int
        )
    }
}
