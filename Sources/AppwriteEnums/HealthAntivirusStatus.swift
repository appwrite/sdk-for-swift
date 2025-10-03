import Foundation

public enum HealthAntivirusStatus: String, CustomStringConvertible {
    case disabled = "disabled"
    case offline = "offline"
    case online = "online"

    public var description: String {
        return rawValue
    }
}
