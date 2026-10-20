import AppwriteEnums
import Foundation
import JSONCodable

/// AttributeString
open class AttributeString: Codable {

    enum CodingKeys: String, CodingKey {
        case key = "key"
        case description = "description"
        case type = "type"
        case status = "status"
        case error = "error"
        case `required` = "required"
        case array = "array"
        case createdAt = "$createdAt"
        case updatedAt = "$updatedAt"
        case size = "size"
        case `default` = "default"
        case encrypt = "encrypt"
    }

    /// Attribute Key.
    public let key: String
    /// Optional description for the attribute.
    public let description: String
    /// Attribute type.
    public let type: String
    /// Attribute status. Possible values: `available`, `processing`, `deleting`, `stuck`, or `failed`
    public let status: AppwriteEnums.AttributeStatus
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
    /// Defines whether this attribute is encrypted or not.
    public let encrypt: Bool?

    init(
        key: String,
        description: String,
        type: String,
        status: AppwriteEnums.AttributeStatus,
        error: String,
        `required`: Bool,
        array: Bool?,
        createdAt: String,
        updatedAt: String,
        size: Int,
        `default`: String?,
        encrypt: Bool?
    ) {
        self.key = key
        self.description = description
        self.type = type
        self.status = status
        self.error = error
        self.`required` = `required`
        self.array = array
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.size = size
        self.`default` = `default`
        self.encrypt = encrypt
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.key = try container.contains(.key) ? container.decode(String.self, forKey: .key) : ""
        self.description = try container.contains(.description) ? container.decode(String.self, forKey: .description) : ""
        self.type = try container.contains(.type) ? container.decode(String.self, forKey: .type) : ""
        self.status = AppwriteEnums.AttributeStatus(rawValue: try container.decode(String.self, forKey: .status))!
        self.error = try container.contains(.error) ? container.decode(String.self, forKey: .error) : ""
        self.`required` = try container.contains(.`required`) ? container.decode(Bool.self, forKey: .`required`) : false
        self.array = try container.decodeIfPresent(Bool.self, forKey: .array)
        self.createdAt = try container.contains(.createdAt) ? container.decode(String.self, forKey: .createdAt) : ""
        self.updatedAt = try container.contains(.updatedAt) ? container.decode(String.self, forKey: .updatedAt) : ""
        self.size = try container.contains(.size) ? container.decode(Int.self, forKey: .size) : 0
        self.`default` = try container.decodeIfPresent(String.self, forKey: .`default`)
        self.encrypt = try container.decodeIfPresent(Bool.self, forKey: .encrypt)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(key, forKey: .key)
        try container.encode(description, forKey: .description)
        try container.encode(type, forKey: .type)
        try container.encode(status.rawValue, forKey: .status)
        try container.encode(error, forKey: .error)
        try container.encode(`required`, forKey: .`required`)
        try container.encodeIfPresent(array, forKey: .array)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(updatedAt, forKey: .updatedAt)
        try container.encode(size, forKey: .size)
        try container.encodeIfPresent(`default`, forKey: .`default`)
        try container.encodeIfPresent(encrypt, forKey: .encrypt)
    }

    public func toMap() -> [String: Any] {
        return [
            "key": key as Any,
            "description": description as Any,
            "type": type as Any,
            "status": status.rawValue as Any,
            "error": error as Any,
            "required": `required` as Any,
            "array": array as Any,
            "$createdAt": createdAt as Any,
            "$updatedAt": updatedAt as Any,
            "size": size as Any,
            "default": `default` as Any,
            "encrypt": encrypt as Any,
        ]
    }

    public static func from(map: [String: Any]) -> AttributeString {
        let defaults: [String: Any] = [
            "key": "",
            "description": "",
            "type": "",
            "error": "",
            "required": false,
            "$createdAt": "",
            "$updatedAt": "",
            "size": 0,
        ]
        let map = defaults.merging(map) { _, new in new }

        return AttributeString(
            key: map["key"] as! String,
            description: map["description"] as! String,
            type: map["type"] as! String,
            status: AppwriteEnums.AttributeStatus(rawValue: map["status"] as! String)!,
            error: map["error"] as! String,
            required: map["required"] as! Bool,
            array: map["array"] as? Bool,
            createdAt: map["$createdAt"] as! String,
            updatedAt: map["$updatedAt"] as! String,
            size: map["size"] as! Int,
            default: map["default"] as? String,
            encrypt: map["encrypt"] as? Bool
        )
    }
}
