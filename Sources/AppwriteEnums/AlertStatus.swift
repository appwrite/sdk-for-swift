import Foundation

public enum AlertStatus: String, Codable, CustomStringConvertible {
    case firing = "firing"
    case resolved = "resolved"

    public var description: String {
        return rawValue
    }
}
