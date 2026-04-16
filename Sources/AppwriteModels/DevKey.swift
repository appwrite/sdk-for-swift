import Foundation
import JSONCodable

/// DevKey
open class DevKey: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case createdAt = "$createdAt"
        case updatedAt = "$updatedAt"
        case name = "name"
        case expire = "expire"
        case secret = "secret"
        case accessedAt = "accessedAt"
        case sdks = "sdks"
    }

    /// Key ID.
    public let id: String
    /// Key creation date in ISO 8601 format.
    public let createdAt: String
    /// Key update date in ISO 8601 format.
    public let updatedAt: String
    /// Key name.
    public let name: String
    /// Key expiration date in ISO 8601 format.
    public let expire: String
    /// Secret key.
    public let secret: String
    /// Most recent access date in ISO 8601 format. This attribute is only updated again after 24 hours.
    public let accessedAt: String
    /// List of SDK user agents that used this key.
    public let sdks: [String]

    init(
        id: String,
        createdAt: String,
        updatedAt: String,
        name: String,
        expire: String,
        secret: String,
        accessedAt: String,
        sdks: [String]
    ) {
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.name = name
        self.expire = expire
        self.secret = secret
        self.accessedAt = accessedAt
        self.sdks = sdks
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decode(String.self, forKey: .id)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
        self.name = try container.decode(String.self, forKey: .name)
        self.expire = try container.decode(String.self, forKey: .expire)
        self.secret = try container.decode(String.self, forKey: .secret)
        self.accessedAt = try container.decode(String.self, forKey: .accessedAt)
        self.sdks = try container.decode([String].self, forKey: .sdks)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(updatedAt, forKey: .updatedAt)
        try container.encode(name, forKey: .name)
        try container.encode(expire, forKey: .expire)
        try container.encode(secret, forKey: .secret)
        try container.encode(accessedAt, forKey: .accessedAt)
        try container.encode(sdks, forKey: .sdks)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "$createdAt": createdAt as Any,
            "$updatedAt": updatedAt as Any,
            "name": name as Any,
            "expire": expire as Any,
            "secret": secret as Any,
            "accessedAt": accessedAt as Any,
            "sdks": sdks as Any
        ]
    }

    public static func from(map: [String: Any] ) -> DevKey {
        return DevKey(
            id: map["$id"] as! String,
            createdAt: map["$createdAt"] as! String,
            updatedAt: map["$updatedAt"] as! String,
            name: map["name"] as! String,
            expire: map["expire"] as! String,
            secret: map["secret"] as! String,
            accessedAt: map["accessedAt"] as! String,
            sdks: map["sdks"] as! [String]
        )
    }
}
