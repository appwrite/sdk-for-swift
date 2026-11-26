import Foundation

public enum MonitorSeverity: String, Codable, CustomStringConvertible {
    case info = "info"
    case warning = "warning"
    case error = "error"
    case critical = "critical"

    public var description: String {
        return rawValue
    }
}
