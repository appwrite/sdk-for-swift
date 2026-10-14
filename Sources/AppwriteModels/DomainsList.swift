import Foundation
import JSONCodable

/// Domains list
open class DomainsList: Codable {

    enum CodingKeys: String, CodingKey {
        case total = "total"
        case domains = "domains"
    }

    /// Total number of domains that matched your query.
    public let total: Int
    /// List of domains.
    public let domains: [Domain]

    init(
        total: Int,
        domains: [Domain]
    ) {
        self.total = total
        self.domains = domains
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.total = try container.contains(.total) ? container.decode(Int.self, forKey: .total) : 0
        self.domains = try container.contains(.domains) ? container.decode([Domain].self, forKey: .domains) : []
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(total, forKey: .total)
        try container.encode(domains, forKey: .domains)
    }

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "domains": domains.map { $0.toMap() } as Any,
        ]
    }

    public static func from(map: [String: Any]) -> DomainsList {
        let defaults: [String: Any] = [
            "total": 0,
            "domains": [Any](),
        ]
        let map = defaults.merging(map) { _, new in new }

        return DomainsList(
            total: map["total"] as! Int,
            domains: (map["domains"] as! [[String: Any]]).map { Domain.from(map: $0) }
        )
    }
}
