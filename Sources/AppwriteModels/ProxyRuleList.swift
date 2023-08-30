import Foundation
import JSONCodable

/// Rule List
public class ProxyRuleList {

    /// Total number of rules documents that matched your query.
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
