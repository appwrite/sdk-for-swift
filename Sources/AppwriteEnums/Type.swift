import Foundation

public enum Type: String, CustomStringConvertible {
    case tablesdb = "tablesdb"
    case legacy = "legacy"

    public var description: String {
        return rawValue
    }
}
