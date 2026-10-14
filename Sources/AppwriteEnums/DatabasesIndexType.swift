import Foundation

public enum DatabasesIndexType: String, Codable, CustomStringConvertible {
    case key = "key"
    case fulltext = "fulltext"
    case unique = "unique"
    case spatial = "spatial"
    case trigram = "trigram"

    public var description: String {
        return rawValue
    }
}
