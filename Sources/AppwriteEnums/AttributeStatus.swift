import Foundation

public enum AttributeStatus: String, Codable, CustomStringConvertible {
    case available = "available"
    case processing = "processing"
    case deleting = "deleting"
    case stuck = "stuck"
    case failed = "failed"

    public var description: String {
        return rawValue
    }
}
