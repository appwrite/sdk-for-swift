import Foundation

public enum Compression: String, CustomStringConvertible {
    case `none` = "none"
    case gzip = "gzip"
    case zstd = "zstd"

    public var description: String {
        return rawValue
    }
}
