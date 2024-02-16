import Foundation

public enum MessageStatus: String, Codable {
    case draft = "draft"
    case scheduled = "scheduled"
    case processing = "processing"

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}
