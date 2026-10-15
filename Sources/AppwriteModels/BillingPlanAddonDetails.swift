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
    public let currency: String?
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
        currency: String?,
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

        self.supported = try container.contains(.supported) ? container.decode(Bool.self, forKey: .supported) : false
        self.planIncluded = try container.contains(.planIncluded) ? container.decode(Int.self, forKey: .planIncluded) : 0
        self.limit = try container.contains(.limit) ? container.decode(Int.self, forKey: .limit) : 0
        self.type = try container.contains(.type) ? container.decode(String.self, forKey: .type) : "numeric"
        self.currency = try container.decodeIfPresent(String.self, forKey: .currency)
        self.price = try container.contains(.price) ? container.decode(Double.self, forKey: .price) : 0
        self.value = try container.contains(.value) ? container.decode(Int.self, forKey: .value) : 0
        self.invoiceDesc = try container.contains(.invoiceDesc) ? container.decode(String.self, forKey: .invoiceDesc) : ""
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(supported, forKey: .supported)
        try container.encode(planIncluded, forKey: .planIncluded)
        try container.encode(limit, forKey: .limit)
        try container.encode(type, forKey: .type)
        try container.encodeIfPresent(currency, forKey: .currency)
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
            "invoiceDesc": invoiceDesc as Any,
        ]
    }

    public static func from(map: [String: Any]) -> BillingPlanAddonDetails {
        let defaults: [String: Any] = [
            "supported": false,
            "planIncluded": 0,
            "limit": 0,
            "type": "numeric",
            "price": 0.0,
            "value": 0,
            "invoiceDesc": "",
        ]
        let map = defaults.merging(map) { _, new in new }

        return BillingPlanAddonDetails(
            supported: map["supported"] as! Bool,
            planIncluded: map["planIncluded"] as! Int,
            limit: map["limit"] as! Int,
            type: map["type"] as! String,
            currency: map["currency"] as? String,
            price: map["price"] as! Double,
            value: map["value"] as! Int,
            invoiceDesc: map["invoiceDesc"] as! String
        )
    }
}
