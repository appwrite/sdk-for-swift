import Foundation
import JSONCodable

/// Limits
open class BillingLimits: Codable {

    enum CodingKeys: String, CodingKey {
        case bandwidth = "bandwidth"
        case storage = "storage"
        case users = "users"
        case executions = "executions"
        case GBHours = "GBHours"
        case imageTransformations = "imageTransformations"
        case authPhone = "authPhone"
        case budgetLimit = "budgetLimit"
    }

    /// Bandwidth limit
    public let bandwidth: Int?
    /// Storage limit
    public let storage: Int?
    /// Users limit
    public let users: Int?
    /// Executions limit
    public let executions: Int?
    /// GBHours limit
    public let GBHours: Int?
    /// Image transformations limit
    public let imageTransformations: Int?
    /// Auth phone limit
    public let authPhone: Int?
    /// Budget limit percentage
    public let budgetLimit: Int?

    init(
        bandwidth: Int?,
        storage: Int?,
        users: Int?,
        executions: Int?,
        GBHours: Int?,
        imageTransformations: Int?,
        authPhone: Int?,
        budgetLimit: Int?
    ) {
        self.bandwidth = bandwidth
        self.storage = storage
        self.users = users
        self.executions = executions
        self.GBHours = GBHours
        self.imageTransformations = imageTransformations
        self.authPhone = authPhone
        self.budgetLimit = budgetLimit
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.bandwidth = try container.decodeIfPresent(Int.self, forKey: .bandwidth)
        self.storage = try container.decodeIfPresent(Int.self, forKey: .storage)
        self.users = try container.decodeIfPresent(Int.self, forKey: .users)
        self.executions = try container.decodeIfPresent(Int.self, forKey: .executions)
        self.GBHours = try container.decodeIfPresent(Int.self, forKey: .GBHours)
        self.imageTransformations = try container.decodeIfPresent(Int.self, forKey: .imageTransformations)
        self.authPhone = try container.decodeIfPresent(Int.self, forKey: .authPhone)
        self.budgetLimit = try container.decodeIfPresent(Int.self, forKey: .budgetLimit)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(bandwidth, forKey: .bandwidth)
        try container.encodeIfPresent(storage, forKey: .storage)
        try container.encodeIfPresent(users, forKey: .users)
        try container.encodeIfPresent(executions, forKey: .executions)
        try container.encodeIfPresent(GBHours, forKey: .GBHours)
        try container.encodeIfPresent(imageTransformations, forKey: .imageTransformations)
        try container.encodeIfPresent(authPhone, forKey: .authPhone)
        try container.encodeIfPresent(budgetLimit, forKey: .budgetLimit)
    }

    public func toMap() -> [String: Any] {
        return [
            "bandwidth": bandwidth as Any,
            "storage": storage as Any,
            "users": users as Any,
            "executions": executions as Any,
            "GBHours": GBHours as Any,
            "imageTransformations": imageTransformations as Any,
            "authPhone": authPhone as Any,
            "budgetLimit": budgetLimit as Any
        ]
    }

    public static func from(map: [String: Any] ) -> BillingLimits {
        return BillingLimits(
            bandwidth: map["bandwidth"] as? Int,
            storage: map["storage"] as? Int,
            users: map["users"] as? Int,
            executions: map["executions"] as? Int,
            GBHours: map["GBHours"] as? Int,
            imageTransformations: map["imageTransformations"] as? Int,
            authPhone: map["authPhone"] as? Int,
            budgetLimit: map["budgetLimit"] as? Int
        )
    }
}
