import Foundation

public enum MessagePriority: String, Codable, CustomStringConvertible {
    case normal = "normal"
    case high = "high"

    public var description: String {
        return rawValue
    }
}
