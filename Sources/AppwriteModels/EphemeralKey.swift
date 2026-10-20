import Foundation
import JSONCodable

/// Ephemeral Key
open class EphemeralKey: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case createdAt = "$createdAt"
        case updatedAt = "$updatedAt"
        case name = "name"
        case description = "description"
        case expire = "expire"
        case scopes = "scopes"
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
    /// Optional description for the key.
    public let description: String
    /// Key expiration date in ISO 8601 format.
    public let expire: String
    /// Allowed permission scopes.
    public let scopes: [String]
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
        description: String,
        expire: String,
        scopes: [String],
        secret: String,
        accessedAt: String,
        sdks: [String]
    ) {
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.name = name
        self.description = description
        self.expire = expire
        self.scopes = scopes
        self.secret = secret
        self.accessedAt = accessedAt
        self.sdks = sdks
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.contains(.id) ? container.decode(String.self, forKey: .id) : ""
        self.createdAt = try container.contains(.createdAt) ? container.decode(String.self, forKey: .createdAt) : ""
        self.updatedAt = try container.contains(.updatedAt) ? container.decode(String.self, forKey: .updatedAt) : ""
        self.name = try container.contains(.name) ? container.decode(String.self, forKey: .name) : ""
        self.description = try container.contains(.description) ? container.decode(String.self, forKey: .description) : ""
        self.expire = try container.contains(.expire) ? container.decode(String.self, forKey: .expire) : ""
        self.scopes = try container.contains(.scopes) ? container.decode([String].self, forKey: .scopes) : []
        self.secret = try container.contains(.secret) ? container.decode(String.self, forKey: .secret) : ""
        self.accessedAt = try container.contains(.accessedAt) ? container.decode(String.self, forKey: .accessedAt) : ""
        self.sdks = try container.contains(.sdks) ? container.decode([String].self, forKey: .sdks) : []
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(updatedAt, forKey: .updatedAt)
        try container.encode(name, forKey: .name)
        try container.encode(description, forKey: .description)
        try container.encode(expire, forKey: .expire)
        try container.encode(scopes, forKey: .scopes)
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
            "description": description as Any,
            "expire": expire as Any,
            "scopes": scopes as Any,
            "secret": secret as Any,
            "accessedAt": accessedAt as Any,
            "sdks": sdks as Any,
        ]
    }

    public static func from(map: [String: Any]) -> EphemeralKey {
        let defaults: [String: Any] = [
            "$id": "",
            "$createdAt": "",
            "$updatedAt": "",
            "name": "",
            "description": "",
            "expire": "",
            "scopes": [Any](),
            "secret": "",
            "accessedAt": "",
            "sdks": [Any](),
        ]
        let map = defaults.merging(map) { _, new in new }

        return EphemeralKey(
            id: map["$id"] as! String,
            createdAt: map["$createdAt"] as! String,
            updatedAt: map["$updatedAt"] as! String,
            name: map["name"] as! String,
            description: map["description"] as! String,
            expire: map["expire"] as! String,
            scopes: map["scopes"] as! [String],
            secret: map["secret"] as! String,
            accessedAt: map["accessedAt"] as! String,
            sdks: map["sdks"] as! [String]
        )
    }
}
