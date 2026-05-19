import Foundation

public enum HealthAntivirusStatus: String, Codable, CustomStringConvertible {
    case disabled = "disabled"
    case offline = "offline"
    case online = "online"

    public var description: String {
        return rawValue
    }
}
