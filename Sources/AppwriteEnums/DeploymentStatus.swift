import Foundation

public enum DeploymentStatus: String, CustomStringConvertible {
    case waiting = "waiting"
    case processing = "processing"
    case building = "building"
    case ready = "ready"
    case failed = "failed"

    public var description: String {
        return rawValue
    }
}
