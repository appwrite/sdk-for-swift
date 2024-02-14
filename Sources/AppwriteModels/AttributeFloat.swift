import Foundation
import JSONCodable

/// AttributeFloat
public class AttributeFloat {

    /// Attribute Key.
    public let key: String

    /// Attribute type.
    public let type: String

    /// Attribute status. Possible values: `available`, `processing`, `deleting`, `stuck`, or `failed`
    public let status: String

    /// Error message. Displays error generated on failure of creating or deleting an attribute.
    public let error: String

    /// Is attribute required?
    public let xrequired: Bool

    /// Is attribute an array?
    public let array: Bool??

    /// Minimum value to enforce for new documents.
    public let min: Double??

    /// Maximum value to enforce for new documents.
    public let max: Double??

    /// Default value for attribute when not provided. Cannot be set when attribute is required.
    public let xdefault: Double??


    init(
        key: String,
        type: String,
        status: String,
        error: String,
        xrequired: Bool,
        array: Bool??,
        min: Double??,
        max: Double??,
        xdefault: Double??
    ) {
        self.key = key
        self.type = type
        self.status = status
        self.error = error
        self.xrequired = xrequired
        self.array = array
        self.min = min
        self.max = max
        self.xdefault = xdefault
    }

    public func toMap() -> [String: Any] {
        return [
            "key": key as Any,
            "type": type as Any,
            "status": status as Any,
            "error": error as Any,
            "xrequired": xrequired as Any,
            "array": array as Any,
            "min": min as Any,
            "max": max as Any,
            "xdefault": xdefault as Any
        ]
    }

    public static func from(map: [String: Any] ) -> AttributeFloat {
        return AttributeFloat(
            key: map["key"] as! String,
            type: map["type"] as! String,
            status: map["status"] as! String,
            error: map["error"] as! String,
            xrequired: map["required"] as! Bool,
            array: map["array"] as? Bool?,
            min: map["min"] as? Double?,
            max: map["max"] as? Double?,
            xdefault: map["default"] as? Double?
        )
    }
}
