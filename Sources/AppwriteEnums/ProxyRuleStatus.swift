import Foundation

public enum ProxyRuleStatus: String, CustomStringConvertible {
    case unverified = "unverified"
    case verifying = "verifying"
    case verified = "verified"

    public var description: String {
        return rawValue
    }
}
