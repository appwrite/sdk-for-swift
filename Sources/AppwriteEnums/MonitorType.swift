import Foundation

public enum MonitorType: String, Codable, CustomStringConvertible {
    case usage = "usage"
    case http = "http"
    case dns = "dns"
    case tcp = "tcp"
    case smtp = "smtp"
    case budget = "budget"

    public var description: String {
        return rawValue
    }
}
