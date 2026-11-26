import Foundation

public enum MonitorStatus: String, Codable, CustomStringConvertible {
    case ok = "ok"
    case firing = "firing"

    public var description: String {
        return rawValue
    }
}
