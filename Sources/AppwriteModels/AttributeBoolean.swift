import Foundation
import JSONCodable

/// AttributeBoolean
public class AttributeBoolean {

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

    /// Default value for attribute when not provided. Cannot be set when attribute is required.
    public let `default`: Bool?


    init(
        key: String,
        type: String,
        status: String,
        error: String,
        `required`: Bool,
        array: Bool?,
        `default`: Bool?
    ) {
        self.key = key
        self.type = type
        self.status = status
        self.error = error
        self.`required` = `required`
        self.array = array
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
            "`default`": `default` as Any
        ]
    }

    public static func from(map: [String: Any] ) -> AttributeBoolean {
        return AttributeBoolean(
            key: map["key"] as! String,
            type: map["type"] as! String,
            status: map["status"] as! String,
            error: map["error"] as! String,
            `required`: map["required"] as! Bool,
            array: map["array"] as? Bool,
            `default`: map["default"] as? Bool
        )
    }
}
