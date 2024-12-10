import Foundation

public enum RelationshipType: String, CustomStringConvertible {
    case oneToOne = "oneToOne"
    case manyToOne = "manyToOne"
    case manyToMany = "manyToMany"
    case oneToMany = "oneToMany"

    public var description: String {
        return rawValue
    }
}
