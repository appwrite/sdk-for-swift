import Foundation

public enum DatabaseStatus: String, Codable, CustomStringConvertible {
    case provisioning = "provisioning"
    case ready = "ready"
    case failed = "failed"

    public var description: String {
        return rawValue
    }
}
