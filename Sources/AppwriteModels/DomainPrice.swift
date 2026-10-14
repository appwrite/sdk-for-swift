import Foundation
import JSONCodable

/// DomainPrice
open class DomainPrice: Codable {

    enum CodingKeys: String, CodingKey {
        case domain = "domain"
        case tld = "tld"
        case available = "available"
        case price = "price"
        case periodYears = "periodYears"
        case premium = "premium"
        case renewalPrice = "renewalPrice"
        case renewalPeriodYears = "renewalPeriodYears"
    }

    /// Domain name.
    public let domain: String
    /// Top-level domain for the requested domain.
    public let tld: String
    /// Whether the domain is currently available for registration.
    public let available: Bool
    /// Domain registration price. Null when the price could not be resolved, for example for an unsupported TLD.
    public let price: Double?
    /// Price period in years.
    public let periodYears: Int
    /// Whether the domain is a premium domain.
    public let premium: Bool
    /// Domain renewal price for the same period. Null when the domain was not priced or the registrar has no renewal price for it.
    public let renewalPrice: Double?
    /// Renewal price period in years.
    public let renewalPeriodYears: Int

    init(
        domain: String,
        tld: String,
        available: Bool,
        price: Double?,
        periodYears: Int,
        premium: Bool,
        renewalPrice: Double?,
        renewalPeriodYears: Int
    ) {
        self.domain = domain
        self.tld = tld
        self.available = available
        self.price = price
        self.periodYears = periodYears
        self.premium = premium
        self.renewalPrice = renewalPrice
        self.renewalPeriodYears = renewalPeriodYears
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.domain = try container.contains(.domain) ? container.decode(String.self, forKey: .domain) : ""
        self.tld = try container.contains(.tld) ? container.decode(String.self, forKey: .tld) : ""
        self.available = try container.contains(.available) ? container.decode(Bool.self, forKey: .available) : false
        self.price = try container.decodeIfPresent(Double.self, forKey: .price)
        self.periodYears = try container.contains(.periodYears) ? container.decode(Int.self, forKey: .periodYears) : 1
        self.premium = try container.contains(.premium) ? container.decode(Bool.self, forKey: .premium) : false
        self.renewalPrice = try container.decodeIfPresent(Double.self, forKey: .renewalPrice)
        self.renewalPeriodYears = try container.contains(.renewalPeriodYears) ? container.decode(Int.self, forKey: .renewalPeriodYears) : 1
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(domain, forKey: .domain)
        try container.encode(tld, forKey: .tld)
        try container.encode(available, forKey: .available)
        try container.encodeIfPresent(price, forKey: .price)
        try container.encode(periodYears, forKey: .periodYears)
        try container.encode(premium, forKey: .premium)
        try container.encodeIfPresent(renewalPrice, forKey: .renewalPrice)
        try container.encode(renewalPeriodYears, forKey: .renewalPeriodYears)
    }

    public func toMap() -> [String: Any] {
        return [
            "domain": domain as Any,
            "tld": tld as Any,
            "available": available as Any,
            "price": price as Any,
            "periodYears": periodYears as Any,
            "premium": premium as Any,
            "renewalPrice": renewalPrice as Any,
            "renewalPeriodYears": renewalPeriodYears as Any,
        ]
    }

    public static func from(map: [String: Any]) -> DomainPrice {
        let defaults: [String: Any] = [
            "domain": "",
            "tld": "",
            "available": false,
            "periodYears": 1,
            "premium": false,
            "renewalPeriodYears": 1,
        ]
        let map = defaults.merging(map) { _, new in new }

        return DomainPrice(
            domain: map["domain"] as! String,
            tld: map["tld"] as! String,
            available: map["available"] as! Bool,
            price: map["price"] as? Double,
            periodYears: map["periodYears"] as! Int,
            premium: map["premium"] as! Bool,
            renewalPrice: map["renewalPrice"] as? Double,
            renewalPeriodYears: map["renewalPeriodYears"] as! Int
        )
    }
}
