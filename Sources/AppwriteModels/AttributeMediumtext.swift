import Foundation
import JSONCodable
import AppwriteEnums

/// AttributeMediumtext
open class AttributeMediumtext: Codable {

    enum CodingKeys: String, CodingKey {
        case key = "key"
        case type = "type"
        case status = "status"
        case error = "error"
        case `required` = "required"
        case array = "array"
        case createdAt = "$createdAt"
        case updatedAt = "$updatedAt"
        case `default` = "default"
        case encrypt = "encrypt"
    }

    /// Attribute Key.
    public let key: String
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
    /// Default value for attribute when not provided. Cannot be set when attribute is required.
    public let `default`: String?
    /// Defines whether this attribute is encrypted or not.
    public let encrypt: Bool?

    init(
        key: String,
        type: String,
        status: AppwriteEnums.AttributeStatus,
        error: String,
        `required`: Bool,
        array: Bool?,
        createdAt: String,
        updatedAt: String,
        `default`: String?,
        encrypt: Bool?
    ) {
        self.key = key
        self.type = type
        self.status = status
        self.error = error
        self.`required` = `required`
        self.array = array
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.`default` = `default`
        self.encrypt = encrypt
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.key = try container.decode(String.self, forKey: .key)
        self.type = try container.decode(String.self, forKey: .type)
        self.status = AppwriteEnums.AttributeStatus(rawValue: try container.decode(String.self, forKey: .status))!
        self.error = try container.decode(String.self, forKey: .error)
        self.`required` = try container.decode(Bool.self, forKey: .`required`)
        self.array = try container.decodeIfPresent(Bool.self, forKey: .array)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
        self.`default` = try container.decodeIfPresent(String.self, forKey: .`default`)
        self.encrypt = try container.decodeIfPresent(Bool.self, forKey: .encrypt)
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
        try container.encodeIfPresent(`default`, forKey: .`default`)
        try container.encodeIfPresent(encrypt, forKey: .encrypt)
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
            "default": `default` as Any,
            "encrypt": encrypt as Any
        ]
    }

    public static func from(map: [String: Any] ) -> AttributeMediumtext {
        return AttributeMediumtext(
            key: map["key"] as! String,
            type: map["type"] as! String,
            status: AttributeStatus(rawValue: map["status"] as! String)!,
            error: map["error"] as! String,
            required: map["required"] as! Bool,
            array: map["array"] as? Bool,
            createdAt: map["$createdAt"] as! String,
            updatedAt: map["$updatedAt"] as! String,
            default: map["default"] as? String,
            encrypt: map["encrypt"] as? Bool
        )
    }
}
