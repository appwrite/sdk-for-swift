import Foundation
import JSONCodable

/// Details
open class BillingPlanAddonDetails: Codable {

    enum CodingKeys: String, CodingKey {
        case supported = "supported"
        case planIncluded = "planIncluded"
        case limit = "limit"
        case type = "type"
        case currency = "currency"
        case price = "price"
        case value = "value"
        case invoiceDesc = "invoiceDesc"
    }

    /// Is the addon supported in the plan?
    public let supported: Bool
    /// Addon plan included value
    public let planIncluded: Int
    /// Addon limit
    public let limit: Int
    /// Addon type
    public let type: String
    /// Price currency
    public let currency: String
    /// Price
    public let price: Double
    /// Resource value
    public let value: Int
    /// Description on invoice
    public let invoiceDesc: String

    init(
        supported: Bool,
        planIncluded: Int,
        limit: Int,
        type: String,
        currency: String,
        price: Double,
        value: Int,
        invoiceDesc: String
    ) {
        self.supported = supported
        self.planIncluded = planIncluded
        self.limit = limit
        self.type = type
        self.currency = currency
        self.price = price
        self.value = value
        self.invoiceDesc = invoiceDesc
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.supported = try container.decode(Bool.self, forKey: .supported)
        self.planIncluded = try container.decode(Int.self, forKey: .planIncluded)
        self.limit = try container.decode(Int.self, forKey: .limit)
        self.type = try container.decode(String.self, forKey: .type)
        self.currency = try container.decode(String.self, forKey: .currency)
        self.price = try container.decode(Double.self, forKey: .price)
        self.value = try container.decode(Int.self, forKey: .value)
        self.invoiceDesc = try container.decode(String.self, forKey: .invoiceDesc)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(supported, forKey: .supported)
        try container.encode(planIncluded, forKey: .planIncluded)
        try container.encode(limit, forKey: .limit)
        try container.encode(type, forKey: .type)
        try container.encode(currency, forKey: .currency)
        try container.encode(price, forKey: .price)
        try container.encode(value, forKey: .value)
        try container.encode(invoiceDesc, forKey: .invoiceDesc)
    }

    public func toMap() -> [String: Any] {
        return [
            "supported": supported as Any,
            "planIncluded": planIncluded as Any,
            "limit": limit as Any,
            "type": type as Any,
            "currency": currency as Any,
            "price": price as Any,
            "value": value as Any,
            "invoiceDesc": invoiceDesc as Any
        ]
    }

    public static func from(map: [String: Any] ) -> BillingPlanAddonDetails {
        return BillingPlanAddonDetails(
            supported: map["supported"] as! Bool,
            planIncluded: map["planIncluded"] as! Int,
            limit: map["limit"] as! Int,
            type: map["type"] as! String,
            currency: map["currency"] as! String,
            price: map["price"] as! Double,
            value: map["value"] as! Int,
            invoiceDesc: map["invoiceDesc"] as! String
        )
    }
}
