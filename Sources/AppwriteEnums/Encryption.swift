import Foundation

public enum Encryption: String, Codable {
    case `none` = "none"
    case ssl = "ssl"
    case tls = "tls"

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}
