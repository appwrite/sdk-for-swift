import Foundation

public enum RelationshipType: String, Codable {
    case oneToOne = "oneToOne"
    case manyToOne = "manyToOne"
    case manyToMany = "manyToMany"
    case oneToMany = "oneToMany"

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}
