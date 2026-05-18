import Foundation

public enum ProjectSMTPSecure: String, Codable, CustomStringConvertible {
    case tls = "tls"
    case ssl = "ssl"

    public var description: String {
        return rawValue
    }
}
