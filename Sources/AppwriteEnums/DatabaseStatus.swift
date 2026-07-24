import Foundation

public enum DatabaseStatus: String, Codable, CustomStringConvertible {
    case provisioning = "provisioning"
    case ready = "ready"
    case inactive = "inactive"
    case paused = "paused"
    case failed = "failed"
    case deleting = "deleting"
    case deleted = "deleted"
    case restoring = "restoring"
    case scaling = "scaling"
    case upgrading = "upgrading"
    case migrating = "migrating"
    case pausing = "pausing"
    case resuming = "resuming"
    case failingOver = "failing-over"

    public var description: String {
        return rawValue
    }
}
