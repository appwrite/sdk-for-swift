import Foundation

public enum RelationMutate: String, CustomStringConvertible {
    case cascade = "cascade"
    case restrict = "restrict"
    case setNull = "setNull"

    public var description: String {
        return rawValue
    }
}
