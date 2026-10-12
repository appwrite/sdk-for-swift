import Foundation
import JSONCodable

/// Message list
open class MessageList: Codable {

    enum CodingKeys: String, CodingKey {
        case total = "total"
        case messages = "messages"
    }

    /// Total number of messages that matched your query.
    public let total: Int
    /// List of messages.
    public let messages: [Message]

    init(
        total: Int,
        messages: [Message]
    ) {
        self.total = total
        self.messages = messages
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.total = try container.contains(.total) ? container.decode(Int.self, forKey: .total) : 0
        self.messages = try container.decode([Message].self, forKey: .messages)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(total, forKey: .total)
        try container.encode(messages, forKey: .messages)
    }

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "messages": messages.map { $0.toMap() } as Any,
        ]
    }

    public static func from(map: [String: Any]) -> MessageList {
        let defaults: [String: Any] = [
            "total": 0,
        ]
        let map = defaults.merging(map) { _, new in new }

        return MessageList(
            total: map["total"] as! Int,
            messages: (map["messages"] as! [[String: Any]]).map { Message.from(map: $0) }
        )
    }
}
