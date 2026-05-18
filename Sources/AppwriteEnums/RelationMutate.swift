import Foundation

public enum RelationMutate: String, Codable, CustomStringConvertible {
    case cascade = "cascade"
    case restrict = "restrict"
    case setNull = "setNull"

    public var description: String {
        return rawValue
    }
}
