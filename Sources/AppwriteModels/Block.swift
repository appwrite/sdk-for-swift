import Foundation
import JSONCodable

/// Block
open class Block: Codable {

    enum CodingKeys: String, CodingKey {
        case createdAt = "$createdAt"
        case resourceType = "resourceType"
        case resourceId = "resourceId"
        case mode = "mode"
        case expiredAt = "expiredAt"
    }

    /// Block creation date in ISO 8601 format.
    public let createdAt: String
    /// Resource type that is blocked
    public let resourceType: String
    /// Resource identifier that is blocked
    public let resourceId: String
    /// Block mode. full blocks reads and writes; readOnly blocks writes only.
    public let mode: String
    /// Block expiration date in ISO 8601 format. Can be null if the block does not expire.
    public let expiredAt: String?

    init(
        createdAt: String,
        resourceType: String,
        resourceId: String,
        mode: String,
        expiredAt: String?
    ) {
        self.createdAt = createdAt
        self.resourceType = resourceType
        self.resourceId = resourceId
        self.mode = mode
        self.expiredAt = expiredAt
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.createdAt = try container.contains(.createdAt) ? container.decode(String.self, forKey: .createdAt) : ""
        self.resourceType = try container.contains(.resourceType) ? container.decode(String.self, forKey: .resourceType) : ""
        self.resourceId = try container.contains(.resourceId) ? container.decode(String.self, forKey: .resourceId) : ""
        self.mode = try container.contains(.mode) ? container.decode(String.self, forKey: .mode) : "full"
        self.expiredAt = try container.decodeIfPresent(String.self, forKey: .expiredAt)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(resourceType, forKey: .resourceType)
        try container.encode(resourceId, forKey: .resourceId)
        try container.encode(mode, forKey: .mode)
        try container.encodeIfPresent(expiredAt, forKey: .expiredAt)
    }

    public func toMap() -> [String: Any] {
        return [
            "$createdAt": createdAt as Any,
            "resourceType": resourceType as Any,
            "resourceId": resourceId as Any,
            "mode": mode as Any,
            "expiredAt": expiredAt as Any,
        ]
    }

    public static func from(map: [String: Any]) -> Block {
        let defaults: [String: Any] = [
            "$createdAt": "",
            "resourceType": "",
            "resourceId": "",
            "mode": "full",
        ]
        let map = defaults.merging(map) { _, new in new }

        return Block(
            createdAt: map["$createdAt"] as! String,
            resourceType: map["resourceType"] as! String,
            resourceId: map["resourceId"] as! String,
            mode: map["mode"] as! String,
            expiredAt: map["expiredAt"] as? String
        )
    }
}
