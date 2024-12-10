import Foundation

public enum SmtpEncryption: String, CustomStringConvertible {
    case `none` = "none"
    case ssl = "ssl"
    case tls = "tls"

    public var description: String {
        return rawValue
    }
}
