import Foundation
import JSONCodable

/// AttributeString
public class AttributeString {

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

    /// Attribute creation date in ISO 8601 format.
    public let createdAt: String

    /// Attribute update date in ISO 8601 format.
    public let updatedAt: String

    /// Attribute size.
    public let size: Int

    /// Default value for attribute when not provided. Cannot be set when attribute is required.
    public let `default`: String?


    init(
        key: String,
        type: String,
        status: String,
        error: String,
        `required`: Bool,
        array: Bool?,
        createdAt: String,
        updatedAt: String,
        size: Int,
        `default`: String?
    ) {
        self.key = key
        self.type = type
        self.status = status
        self.error = error
        self.`required` = `required`
        self.array = array
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.size = size
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
            "$createdAt": createdAt as Any,
            "$updatedAt": updatedAt as Any,
            "size": size as Any,
            "`default`": `default` as Any
        ]
    }

    public static func from(map: [String: Any] ) -> AttributeString {
        return AttributeString(
            key: map["key"] as! String,
            type: map["type"] as! String,
            status: map["status"] as! String,
            error: map["error"] as! String,
            `required`: map["required"] as! Bool,
            array: map["array"] as? Bool,
            createdAt: map["$createdAt"] as! String,
            updatedAt: map["$updatedAt"] as! String,
            size: map["size"] as! Int,
            `default`: map["default"] as? String
        )
    }
}
