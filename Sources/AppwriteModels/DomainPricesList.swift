import Foundation
import JSONCodable

/// Domain prices list
open class DomainPricesList: Codable {

    enum CodingKeys: String, CodingKey {
        case total = "total"
        case prices = "prices"
    }

    /// Total number of prices that matched your query.
    public let total: Int
    /// List of prices.
    public let prices: [DomainPrice]

    init(
        total: Int,
        prices: [DomainPrice]
    ) {
        self.total = total
        self.prices = prices
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.total = try container.contains(.total) ? container.decode(Int.self, forKey: .total) : 0
        self.prices = try container.decode([DomainPrice].self, forKey: .prices)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(total, forKey: .total)
        try container.encode(prices, forKey: .prices)
    }

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "prices": prices.map { $0.toMap() } as Any,
        ]
    }

    public static func from(map: [String: Any]) -> DomainPricesList {
        let defaults: [String: Any] = [
            "total": 0,
        ]
        let map = defaults.merging(map) { _, new in new }

        return DomainPricesList(
            total: map["total"] as! Int,
            prices: (map["prices"] as! [[String: Any]]).map { DomainPrice.from(map: $0) }
        )
    }
}
