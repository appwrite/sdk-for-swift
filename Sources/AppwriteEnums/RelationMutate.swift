import Foundation

public enum RelationMutate: String, Codable {
    case cascade = "cascade"
    case restrict = "restrict"
    case setNull = "setNull"

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}
