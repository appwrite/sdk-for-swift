import Foundation
import JSONCodable

/// Presence
open class Presence<T : Codable>: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case sequence = "$sequence"
        case createdAt = "$createdAt"
        case updatedAt = "$updatedAt"
        case permissions = "$permissions"
        case userInternalId = "userInternalId"
        case userId = "userId"
        case status = "status"
        case source = "source"
        case expiresAt = "expiresAt"
        case data
    }

    /// Presence ID.
    public let id: String
    /// Presence sequence ID.
    public let sequence: String
    /// Presence creation date in ISO 8601 format.
    public let createdAt: String
    /// Presence update date in ISO 8601 format.
    public let updatedAt: String
    /// Presence permissions. [Learn more about permissions](https://appwrite.io/docs/permissions).
    public let permissions: [String]
    /// User internal ID.
    public let userInternalId: String
    /// User ID.
    public let userId: String
    /// Presence status.
    public let status: String?
    /// Presence source.
    public let source: String
    /// Presence expiry date in ISO 8601 format.
    public let expiresAt: String?
    /// Additional properties
    public let data: T

    init(
        id: String,
        sequence: String,
        createdAt: String,
        updatedAt: String,
        permissions: [String],
        userInternalId: String,
        userId: String,
        status: String?,
        source: String,
        expiresAt: String?,
        data: T
    ) {
        self.id = id
        self.sequence = sequence
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.permissions = permissions
        self.userInternalId = userInternalId
        self.userId = userId
        self.status = status
        self.source = source
        self.expiresAt = expiresAt
        self.data = data
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decode(String.self, forKey: .id)
        self.sequence = try container.decode(String.self, forKey: .sequence)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
        self.permissions = try container.decode([String].self, forKey: .permissions)
        self.userInternalId = try container.decode(String.self, forKey: .userInternalId)
        self.userId = try container.decode(String.self, forKey: .userId)
        self.status = try container.decodeIfPresent(String.self, forKey: .status)
        self.source = try container.decode(String.self, forKey: .source)
        self.expiresAt = try container.decodeIfPresent(String.self, forKey: .expiresAt)
        self.data = try container.decode(T.self, forKey: .data)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(sequence, forKey: .sequence)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(updatedAt, forKey: .updatedAt)
        try container.encode(permissions, forKey: .permissions)
        try container.encode(userInternalId, forKey: .userInternalId)
        try container.encode(userId, forKey: .userId)
        try container.encodeIfPresent(status, forKey: .status)
        try container.encode(source, forKey: .source)
        try container.encodeIfPresent(expiresAt, forKey: .expiresAt)
        try container.encode(data, forKey: .data)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "$sequence": sequence as Any,
            "$createdAt": createdAt as Any,
            "$updatedAt": updatedAt as Any,
            "$permissions": permissions as Any,
            "userInternalId": userInternalId as Any,
            "userId": userId as Any,
            "status": status as Any,
            "source": source as Any,
            "expiresAt": expiresAt as Any,
            "data": try! JSONEncoder().encode(data)
        ]
    }

    public static func from(map: [String: Any] ) -> Presence {
        return Presence(
            id: map["$id"] as! String,
            sequence: map["$sequence"] as! String,
            createdAt: map["$createdAt"] as! String,
            updatedAt: map["$updatedAt"] as! String,
            permissions: map["$permissions"] as! [String],
            userInternalId: map["userInternalId"] as! String,
            userId: map["userId"] as! String,
            status: map["status"] as? String,
            source: map["source"] as! String,
            expiresAt: map["expiresAt"] as? String,
            data: try! JSONDecoder().decode(T.self, from: JSONSerialization.data(withJSONObject: map["data"] as? [String: Any] ?? map, options: []))
        )
    }
}
