import Foundation

public enum MessageType: String, Codable {
    case draft = "draft"
    case cancelled = "cancelled"
    case processing = "processing"

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}
