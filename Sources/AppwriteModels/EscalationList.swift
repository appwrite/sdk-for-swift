import Foundation
import JSONCodable

/// Escalations List
open class EscalationList: Codable {

    enum CodingKeys: String, CodingKey {
        case total = "total"
        case escalations = "escalations"
    }

    /// Total number of escalations that matched your query.
    public let total: Int
    /// List of escalations.
    public let escalations: [Escalation]

    init(
        total: Int,
        escalations: [Escalation]
    ) {
        self.total = total
        self.escalations = escalations
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.total = try container.contains(.total) ? container.decode(Int.self, forKey: .total) : 0
        self.escalations = try container.contains(.escalations) ? container.decode([Escalation].self, forKey: .escalations) : []
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(total, forKey: .total)
        try container.encode(escalations, forKey: .escalations)
    }

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "escalations": escalations.map { $0.toMap() } as Any,
        ]
    }

    public static func from(map: [String: Any]) -> EscalationList {
        let defaults: [String: Any] = [
            "total": 0,
            "escalations": [Any](),
        ]
        let map = defaults.merging(map) { _, new in new }

        return EscalationList(
            total: map["total"] as! Int,
            escalations: (map["escalations"] as! [[String: Any]]).map { Escalation.from(map: $0) }
        )
    }
}
