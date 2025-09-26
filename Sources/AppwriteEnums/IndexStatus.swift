import Foundation

public enum IndexStatus: String, CustomStringConvertible {
    case available = "available"
    case processing = "processing"
    case deleting = "deleting"
    case stuck = "stuck"
    case failed = "failed"

    public var description: String {
        return rawValue
    }
}
