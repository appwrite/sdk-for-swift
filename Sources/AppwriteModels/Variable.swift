import Foundation
import JSONCodable

/// Variable
open class Variable: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case createdAt = "$createdAt"
        case updatedAt = "$updatedAt"
        case key = "key"
        case value = "value"
        case secret = "secret"
        case resourceType = "resourceType"
        case resourceId = "resourceId"
    }

    /// Variable ID.
    public let id: String
    /// Variable creation date in ISO 8601 format.
    public let createdAt: String
    /// Variable creation date in ISO 8601 format.
    public let updatedAt: String
    /// Variable key.
    public let key: String
    /// Variable value.
    public let value: String
    /// Variable secret flag. Secret variables can only be updated or deleted, but never read.
    public let secret: Bool
    /// Service to which the variable belongs. Possible values are &quot;project&quot;, &quot;function&quot;
    public let resourceType: String
    /// ID of resource to which the variable belongs. If resourceType is &quot;project&quot;, it is empty. If resourceType is &quot;function&quot;, it is ID of the function.
    public let resourceId: String

    init(
        id: String,
        createdAt: String,
        updatedAt: String,
        key: String,
        value: String,
        secret: Bool,
        resourceType: String,
        resourceId: String
    ) {
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.key = key
        self.value = value
        self.secret = secret
        self.resourceType = resourceType
        self.resourceId = resourceId
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decode(String.self, forKey: .id)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
        self.key = try container.decode(String.self, forKey: .key)
        self.value = try container.decode(String.self, forKey: .value)
        self.secret = try container.decode(Bool.self, forKey: .secret)
        self.resourceType = try container.decode(String.self, forKey: .resourceType)
        self.resourceId = try container.decode(String.self, forKey: .resourceId)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(updatedAt, forKey: .updatedAt)
        try container.encode(key, forKey: .key)
        try container.encode(value, forKey: .value)
        try container.encode(secret, forKey: .secret)
        try container.encode(resourceType, forKey: .resourceType)
        try container.encode(resourceId, forKey: .resourceId)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "$createdAt": createdAt as Any,
            "$updatedAt": updatedAt as Any,
            "key": key as Any,
            "value": value as Any,
            "secret": secret as Any,
            "resourceType": resourceType as Any,
            "resourceId": resourceId as Any
        ]
    }

    public static func from(map: [String: Any] ) -> Variable {
        return Variable(
            id: map["$id"] as! String,
            createdAt: map["$createdAt"] as! String,
            updatedAt: map["$updatedAt"] as! String,
            key: map["key"] as! String,
            value: map["value"] as! String,
            secret: map["secret"] as! Bool,
            resourceType: map["resourceType"] as! String,
            resourceId: map["resourceId"] as! String
        )
    }
}
