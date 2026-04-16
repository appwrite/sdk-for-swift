import Foundation
import JSONCodable

/// Block
open class Block: Codable {

    enum CodingKeys: String, CodingKey {
        case createdAt = "$createdAt"
        case resourceType = "resourceType"
        case resourceId = "resourceId"
        case reason = "reason"
        case expiredAt = "expiredAt"
    }

    /// Block creation date in ISO 8601 format.
    public let createdAt: String
    /// Resource type that is blocked
    public let resourceType: String
    /// Resource identifier that is blocked
    public let resourceId: String
    /// Reason for the block. Can be null if no reason was provided.
    public let reason: String?
    /// Block expiration date in ISO 8601 format. Can be null if the block does not expire.
    public let expiredAt: String?

    init(
        createdAt: String,
        resourceType: String,
        resourceId: String,
        reason: String?,
        expiredAt: String?
    ) {
        self.createdAt = createdAt
        self.resourceType = resourceType
        self.resourceId = resourceId
        self.reason = reason
        self.expiredAt = expiredAt
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.resourceType = try container.decode(String.self, forKey: .resourceType)
        self.resourceId = try container.decode(String.self, forKey: .resourceId)
        self.reason = try container.decodeIfPresent(String.self, forKey: .reason)
        self.expiredAt = try container.decodeIfPresent(String.self, forKey: .expiredAt)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(resourceType, forKey: .resourceType)
        try container.encode(resourceId, forKey: .resourceId)
        try container.encodeIfPresent(reason, forKey: .reason)
        try container.encodeIfPresent(expiredAt, forKey: .expiredAt)
    }

    public func toMap() -> [String: Any] {
        return [
            "$createdAt": createdAt as Any,
            "resourceType": resourceType as Any,
            "resourceId": resourceId as Any,
            "reason": reason as Any,
            "expiredAt": expiredAt as Any
        ]
    }

    public static func from(map: [String: Any] ) -> Block {
        return Block(
            createdAt: map["$createdAt"] as! String,
            resourceType: map["resourceType"] as! String,
            resourceId: map["resourceId"] as! String,
            reason: map["reason"] as? String,
            expiredAt: map["expiredAt"] as? String
        )
    }
}
