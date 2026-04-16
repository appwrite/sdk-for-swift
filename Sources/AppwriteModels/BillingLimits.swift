import Foundation
import JSONCodable

/// BillingLimits
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
    public let bandwidth: Int
    /// Storage limit
    public let storage: Int
    /// Users limit
    public let users: Int
    /// Executions limit
    public let executions: Int
    /// GBHours limit
    public let GBHours: Int
    /// Image transformations limit
    public let imageTransformations: Int
    /// Auth phone limit
    public let authPhone: Int
    /// Budget limit percentage
    public let budgetLimit: Int

    init(
        bandwidth: Int,
        storage: Int,
        users: Int,
        executions: Int,
        GBHours: Int,
        imageTransformations: Int,
        authPhone: Int,
        budgetLimit: Int
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

        self.bandwidth = try container.decode(Int.self, forKey: .bandwidth)
        self.storage = try container.decode(Int.self, forKey: .storage)
        self.users = try container.decode(Int.self, forKey: .users)
        self.executions = try container.decode(Int.self, forKey: .executions)
        self.GBHours = try container.decode(Int.self, forKey: .GBHours)
        self.imageTransformations = try container.decode(Int.self, forKey: .imageTransformations)
        self.authPhone = try container.decode(Int.self, forKey: .authPhone)
        self.budgetLimit = try container.decode(Int.self, forKey: .budgetLimit)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(bandwidth, forKey: .bandwidth)
        try container.encode(storage, forKey: .storage)
        try container.encode(users, forKey: .users)
        try container.encode(executions, forKey: .executions)
        try container.encode(GBHours, forKey: .GBHours)
        try container.encode(imageTransformations, forKey: .imageTransformations)
        try container.encode(authPhone, forKey: .authPhone)
        try container.encode(budgetLimit, forKey: .budgetLimit)
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
            bandwidth: map["bandwidth"] as! Int,
            storage: map["storage"] as! Int,
            users: map["users"] as! Int,
            executions: map["executions"] as! Int,
            GBHours: map["GBHours"] as! Int,
            imageTransformations: map["imageTransformations"] as! Int,
            authPhone: map["authPhone"] as! Int,
            budgetLimit: map["budgetLimit"] as! Int
        )
    }
}
