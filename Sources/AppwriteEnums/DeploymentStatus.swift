import Foundation

public enum DeploymentStatus: String, Codable, CustomStringConvertible {
    case waiting = "waiting"
    case processing = "processing"
    case building = "building"
    case ready = "ready"
    case canceled = "canceled"
    case failed = "failed"

    public var description: String {
        return rawValue
    }
}
