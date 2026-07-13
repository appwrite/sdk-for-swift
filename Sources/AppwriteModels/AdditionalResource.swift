import Foundation
import JSONCodable

/// AdditionalResource
open class AdditionalResource: Codable {

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case unit = "unit"
        case currency = "currency"
        case price = "price"
        case value = "value"
        case invoiceDesc = "invoiceDesc"
    }

    /// Resource name
    public let name: String
    /// Resource unit
    public let unit: String
    /// Price currency
    public let currency: String
    /// Price
    public let price: Double
    /// Resource value
    public let value: Int
    /// Description on invoice
    public let invoiceDesc: String

    init(
        name: String,
        unit: String,
        currency: String,
        price: Double,
        value: Int,
        invoiceDesc: String
    ) {
        self.name = name
        self.unit = unit
        self.currency = currency
        self.price = price
        self.value = value
        self.invoiceDesc = invoiceDesc
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.name = try container.decode(String.self, forKey: .name)
        self.unit = try container.decode(String.self, forKey: .unit)
        self.currency = try container.decode(String.self, forKey: .currency)
        self.price = try container.decode(Double.self, forKey: .price)
        self.value = try container.decode(Int.self, forKey: .value)
        self.invoiceDesc = try container.decode(String.self, forKey: .invoiceDesc)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(name, forKey: .name)
        try container.encode(unit, forKey: .unit)
        try container.encode(currency, forKey: .currency)
        try container.encode(price, forKey: .price)
        try container.encode(value, forKey: .value)
        try container.encode(invoiceDesc, forKey: .invoiceDesc)
    }

    public func toMap() -> [String: Any] {
        return [
            "name": name as Any,
            "unit": unit as Any,
            "currency": currency as Any,
            "price": price as Any,
            "value": value as Any,
            "invoiceDesc": invoiceDesc as Any
        ]
    }

    public static func from(map: [String: Any] ) -> AdditionalResource {
        return AdditionalResource(
            name: map["name"] as! String,
            unit: map["unit"] as! String,
            currency: map["currency"] as! String,
            price: map["price"] as! Double,
            value: map["value"] as! Int,
            invoiceDesc: map["invoiceDesc"] as! String
        )
    }
}
