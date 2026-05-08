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
        case projectName = "projectName"
        case region = "region"
        case organizationName = "organizationName"
        case organizationId = "organizationId"
        case billingPlan = "billingPlan"
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
    /// Name of the project this block applies to.
    public let projectName: String
    /// Region of the project this block applies to.
    public let region: String
    /// Name of the organization that owns the project.
    public let organizationName: String
    /// ID of the organization that owns the project.
    public let organizationId: String
    /// Billing plan of the organization that owns the project.
    public let billingPlan: String

    init(
        createdAt: String,
        resourceType: String,
        resourceId: String,
        reason: String?,
        expiredAt: String?,
        projectName: String,
        region: String,
        organizationName: String,
        organizationId: String,
        billingPlan: String
    ) {
        self.createdAt = createdAt
        self.resourceType = resourceType
        self.resourceId = resourceId
        self.reason = reason
        self.expiredAt = expiredAt
        self.projectName = projectName
        self.region = region
        self.organizationName = organizationName
        self.organizationId = organizationId
        self.billingPlan = billingPlan
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.resourceType = try container.decode(String.self, forKey: .resourceType)
        self.resourceId = try container.decode(String.self, forKey: .resourceId)
        self.reason = try container.decodeIfPresent(String.self, forKey: .reason)
        self.expiredAt = try container.decodeIfPresent(String.self, forKey: .expiredAt)
        self.projectName = try container.decode(String.self, forKey: .projectName)
        self.region = try container.decode(String.self, forKey: .region)
        self.organizationName = try container.decode(String.self, forKey: .organizationName)
        self.organizationId = try container.decode(String.self, forKey: .organizationId)
        self.billingPlan = try container.decode(String.self, forKey: .billingPlan)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(resourceType, forKey: .resourceType)
        try container.encode(resourceId, forKey: .resourceId)
        try container.encodeIfPresent(reason, forKey: .reason)
        try container.encodeIfPresent(expiredAt, forKey: .expiredAt)
        try container.encode(projectName, forKey: .projectName)
        try container.encode(region, forKey: .region)
        try container.encode(organizationName, forKey: .organizationName)
        try container.encode(organizationId, forKey: .organizationId)
        try container.encode(billingPlan, forKey: .billingPlan)
    }

    public func toMap() -> [String: Any] {
        return [
            "$createdAt": createdAt as Any,
            "resourceType": resourceType as Any,
            "resourceId": resourceId as Any,
            "reason": reason as Any,
            "expiredAt": expiredAt as Any,
            "projectName": projectName as Any,
            "region": region as Any,
            "organizationName": organizationName as Any,
            "organizationId": organizationId as Any,
            "billingPlan": billingPlan as Any
        ]
    }

    public static func from(map: [String: Any] ) -> Block {
        return Block(
            createdAt: map["$createdAt"] as! String,
            resourceType: map["resourceType"] as! String,
            resourceId: map["resourceId"] as! String,
            reason: map["reason"] as? String,
            expiredAt: map["expiredAt"] as? String,
            projectName: map["projectName"] as! String,
            region: map["region"] as! String,
            organizationName: map["organizationName"] as! String,
            organizationId: map["organizationId"] as! String,
            billingPlan: map["billingPlan"] as! String
        )
    }
}
