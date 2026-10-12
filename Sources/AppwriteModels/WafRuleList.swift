import Foundation
import JSONCodable

/// WAF rule list
open class WafRuleList: Codable {

    enum CodingKeys: String, CodingKey {
        case total = "total"
        case rules = "rules"
    }

    /// Total number of rules that matched your query.
    public let total: Int
    /// List of rules.
    public let rules: [AnyCodable]

    init(
        total: Int,
        rules: [AnyCodable]
    ) {
        self.total = total
        self.rules = rules
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.total = try container.contains(.total) ? container.decode(Int.self, forKey: .total) : 0
        self.rules = try container.decode([AnyCodable].self, forKey: .rules)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(total, forKey: .total)
        try container.encode(rules, forKey: .rules)
    }

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "rules": rules as Any,
        ]
    }

    public static func from(map: [String: Any]) -> WafRuleList {
        let defaults: [String: Any] = [
            "total": 0,
        ]
        let map = defaults.merging(map) { _, new in new }

        return WafRuleList(
            total: map["total"] as! Int,
            rules: (map["rules"] as! [Any]).map { AnyCodable($0) }
        )
    }
}
