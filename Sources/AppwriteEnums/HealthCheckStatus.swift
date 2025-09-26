import Foundation

public enum HealthCheckStatus: String, CustomStringConvertible {
    case pass = "pass"
    case fail = "fail"

    public var description: String {
        return rawValue
    }
}
