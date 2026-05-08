import Foundation

public enum Secure: String, CustomStringConvertible {
    case tls = "tls"
    case ssl = "ssl"

    public var description: String {
        return rawValue
    }
}
