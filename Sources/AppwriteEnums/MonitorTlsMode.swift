import Foundation

public enum MonitorTlsMode: String, Codable, CustomStringConvertible {
    case `none` = "none"
    case starttls = "starttls"
    case implicit = "implicit"
    case auto = "auto"

    public var description: String {
        return rawValue
    }
}
