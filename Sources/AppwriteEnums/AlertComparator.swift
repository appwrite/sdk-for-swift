import Foundation

public enum AlertComparator: String, Codable, CustomStringConvertible {
    case greaterThan = "greaterThan"
    case greaterThanEqual = "greaterThanEqual"
    case lessThan = "lessThan"
    case lessThanEqual = "lessThanEqual"

    public var description: String {
        return rawValue
    }
}
