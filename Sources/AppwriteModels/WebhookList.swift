
/// Webhooks List
public class WebhookList {

    /// Total sum of items in the list.
    public let sum: Int

    /// List of webhooks.
    public let webhooks: [Webhook]

    init(
        sum: Int,
        webhooks: [Webhook]
    ) {
        self.sum = sum
        self.webhooks = webhooks
    }

    public static func from(map: [String: Any]) -> WebhookList {
        return WebhookList(
            sum: map["sum"] as! Int,
            webhooks: (map["webhooks"] as! [[String: Any]]).map { Webhook.from(map: $0) }
        )
    }

    public func toMap() -> [String: Any] {
        return [
            "sum": sum as Any,
            "webhooks": webhooks.map { $0.toMap() } as Any
        ]
    }
                                                                                                                                                                                                                            
}