import Foundation
import JSONCodable

/// Rule List
open class ProxyRuleList: Codable {

    enum CodingKeys: String, CodingKey {
        case total = "total"
        case rules = "rules"
    }

    /// Total number of rules that matched your query.
    public let total: Int
    /// List of rules.
    public let rules: [ProxyRule]

    init(
        total: Int,
        rules: [ProxyRule]
    ) {
        self.total = total
        self.rules = rules
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.total = try container.decode(Int.self, forKey: .total)
        self.rules = try container.decode([ProxyRule].self, forKey: .rules)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(total, forKey: .total)
        try container.encode(rules, forKey: .rules)
    }

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "rules": rules.map { $0.toMap() } as Any
        ]
    }

    public static func from(map: [String: Any] ) -> ProxyRuleList {
        return ProxyRuleList(
            total: map["total"] as! Int,
            rules: (map["rules"] as! [[String: Any]]).map { ProxyRule.from(map: $0) }
        )
    }
}
