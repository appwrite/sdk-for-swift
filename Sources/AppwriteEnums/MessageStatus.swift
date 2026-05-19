import Foundation

public enum MessageStatus: String, Codable, CustomStringConvertible {
    case draft = "draft"
    case processing = "processing"
    case scheduled = "scheduled"
    case sent = "sent"
    case failed = "failed"

    public var description: String {
        return rawValue
    }
}
