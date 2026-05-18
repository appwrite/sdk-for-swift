import Foundation

public enum SmtpEncryption: String, Codable, CustomStringConvertible {
    case `none` = "none"
    case ssl = "ssl"
    case tls = "tls"

    public var description: String {
        return rawValue
    }
}
