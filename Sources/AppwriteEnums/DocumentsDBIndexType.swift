import Foundation

public enum DocumentsDBIndexType: String, Codable, CustomStringConvertible {
    case key = "key"
    case fulltext = "fulltext"
    case unique = "unique"

    public var description: String {
        return rawValue
    }
}
