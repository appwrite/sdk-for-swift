import Foundation
import JSONCodable

/// ResourceToken
open class ResourceToken: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case createdAt = "$createdAt"
        case resourceId = "resourceId"
        case resourceType = "resourceType"
        case expire = "expire"
        case secret = "secret"
        case accessedAt = "accessedAt"
    }

    /// Token ID.
    public let id: String
    /// Token creation date in ISO 8601 format.
    public let createdAt: String
    /// Resource ID.
    public let resourceId: String
    /// Resource type.
    public let resourceType: String
    /// Token expiration date in ISO 8601 format.
    public let expire: String
    /// JWT encoded string.
    public let secret: String
    /// Most recent access date in ISO 8601 format. This attribute is only updated again after 24 hours.
    public let accessedAt: String

    init(
        id: String,
        createdAt: String,
        resourceId: String,
        resourceType: String,
        expire: String,
        secret: String,
        accessedAt: String
    ) {
        self.id = id
        self.createdAt = createdAt
        self.resourceId = resourceId
        self.resourceType = resourceType
        self.expire = expire
        self.secret = secret
        self.accessedAt = accessedAt
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.contains(.id) ? container.decode(String.self, forKey: .id) : ""
        self.createdAt = try container.contains(.createdAt) ? container.decode(String.self, forKey: .createdAt) : ""
        self.resourceId = try container.contains(.resourceId) ? container.decode(String.self, forKey: .resourceId) : ""
        self.resourceType = try container.contains(.resourceType) ? container.decode(String.self, forKey: .resourceType) : ""
        self.expire = try container.contains(.expire) ? container.decode(String.self, forKey: .expire) : ""
        self.secret = try container.contains(.secret) ? container.decode(String.self, forKey: .secret) : ""
        self.accessedAt = try container.contains(.accessedAt) ? container.decode(String.self, forKey: .accessedAt) : ""
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(resourceId, forKey: .resourceId)
        try container.encode(resourceType, forKey: .resourceType)
        try container.encode(expire, forKey: .expire)
        try container.encode(secret, forKey: .secret)
        try container.encode(accessedAt, forKey: .accessedAt)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "$createdAt": createdAt as Any,
            "resourceId": resourceId as Any,
            "resourceType": resourceType as Any,
            "expire": expire as Any,
            "secret": secret as Any,
            "accessedAt": accessedAt as Any,
        ]
    }

    public static func from(map: [String: Any]) -> ResourceToken {
        let defaults: [String: Any] = [
            "$id": "",
            "$createdAt": "",
            "resourceId": "",
            "resourceType": "",
            "expire": "",
            "secret": "",
            "accessedAt": "",
        ]
        let map = defaults.merging(map) { _, new in new }

        return ResourceToken(
            id: map["$id"] as! String,
            createdAt: map["$createdAt"] as! String,
            resourceId: map["resourceId"] as! String,
            resourceType: map["resourceType"] as! String,
            expire: map["expire"] as! String,
            secret: map["secret"] as! String,
            accessedAt: map["accessedAt"] as! String
        )
    }
}
