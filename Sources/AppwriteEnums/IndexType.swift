import Foundation

public enum IndexType: String, CustomStringConvertible {
    case key = "key"
    case fulltext = "fulltext"
    case unique = "unique"
    case spatial = "spatial"

    public var description: String {
        return rawValue
    }
}
