import Foundation

public enum Compression: String, Codable {
    case `none` = "none"
    case gzip = "gzip"
    case zstd = "zstd"

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}
