import Foundation
import JSONCodable

/// Webhooks List
open class WebhookList: Codable {

    enum CodingKeys: String, CodingKey {
        case total = "total"
        case webhooks = "webhooks"
    }

    /// Total number of webhooks that matched your query.
    public let total: Int
    /// List of webhooks.
    public let webhooks: [Webhook]

    init(
        total: Int,
        webhooks: [Webhook]
    ) {
        self.total = total
        self.webhooks = webhooks
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.total = try container.contains(.total) ? container.decode(Int.self, forKey: .total) : 0
        self.webhooks = try container.contains(.webhooks) ? container.decode([Webhook].self, forKey: .webhooks) : []
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(total, forKey: .total)
        try container.encode(webhooks, forKey: .webhooks)
    }

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "webhooks": webhooks.map { $0.toMap() } as Any,
        ]
    }

    public static func from(map: [String: Any]) -> WebhookList {
        let defaults: [String: Any] = [
            "total": 0,
            "webhooks": [Any](),
        ]
        let map = defaults.merging(map) { _, new in new }

        return WebhookList(
            total: map["total"] as! Int,
            webhooks: (map["webhooks"] as! [[String: Any]]).map { Webhook.from(map: $0) }
        )
    }
}
