import Foundation

public enum IndexType: String, Codable {
    case key = "key"
    case fulltext = "fulltext"
    case unique = "unique"
    case spatial = "spatial"

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}
