import Foundation
import JSONCodable

/// SpecificationList
open class DedicatedDatabaseSpecificationList: Codable {

    enum CodingKeys: String, CodingKey {
        case specifications = "specifications"
        case total = "total"
        case pricing = "pricing"
    }

    /// List of dedicated database specifications.
    public let specifications: [DedicatedDatabaseSpecification]
    /// Total number of specifications.
    public let total: Int
    /// Overage and add-on pricing shared across all specifications.
    public let pricing: DedicatedDatabaseSpecificationPricing

    init(
        specifications: [DedicatedDatabaseSpecification],
        total: Int,
        pricing: DedicatedDatabaseSpecificationPricing
    ) {
        self.specifications = specifications
        self.total = total
        self.pricing = pricing
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.specifications = try container.decode([DedicatedDatabaseSpecification].self, forKey: .specifications)
        self.total = try container.decode(Int.self, forKey: .total)
        self.pricing = try container.decode(DedicatedDatabaseSpecificationPricing.self, forKey: .pricing)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(specifications, forKey: .specifications)
        try container.encode(total, forKey: .total)
        try container.encode(pricing, forKey: .pricing)
    }

    public func toMap() -> [String: Any] {
        return [
            "specifications": specifications.map { $0.toMap() } as Any,
            "total": total as Any,
            "pricing": pricing.toMap() as Any
        ]
    }

    public static func from(map: [String: Any] ) -> DedicatedDatabaseSpecificationList {
        return DedicatedDatabaseSpecificationList(
            specifications: (map["specifications"] as! [[String: Any]]).map { DedicatedDatabaseSpecification.from(map: $0) },
            total: map["total"] as! Int,
            pricing: DedicatedDatabaseSpecificationPricing.from(map: map["pricing"] as! [String: Any])
        )
    }
}
