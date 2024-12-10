import Foundation

public enum MessagePriority: String, CustomStringConvertible {
    case normal = "normal"
    case high = "high"

    public var description: String {
        return rawValue
    }
}
