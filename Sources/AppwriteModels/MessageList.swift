import Foundation
import JSONCodable

/// Message list
public class MessageList {

    /// Total number of messages documents that matched your query.
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

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "messages": messages.map { $0.toMap() } as Any
        ]
    }

    public static func from(map: [String: Any] ) -> MessageList {
        return MessageList(
            total: map["total"] as! Int,
            messages: (map["messages"] as! [[String: Any]]).map { Message.from(map: $0) }
        )
    }
}
