import Foundation

public enum RelationshipType: String, Codable, CustomStringConvertible {
    case oneToOne = "oneToOne"
    case manyToOne = "manyToOne"
    case manyToMany = "manyToMany"
    case oneToMany = "oneToMany"

    public var description: String {
        return rawValue
    }
}
