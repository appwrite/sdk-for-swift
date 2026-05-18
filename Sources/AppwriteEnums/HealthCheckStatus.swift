import Foundation

public enum HealthCheckStatus: String, Codable, CustomStringConvertible {
    case pass = "pass"
    case fail = "fail"

    public var description: String {
        return rawValue
    }
}
