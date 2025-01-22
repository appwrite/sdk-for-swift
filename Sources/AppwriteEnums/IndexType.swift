import Foundation

public enum IndexType: String, CustomStringConvertible {
    case key = "key"
    case fulltext = "fulltext"
    case unique = "unique"

    public var description: String {
        return rawValue
    }
}
