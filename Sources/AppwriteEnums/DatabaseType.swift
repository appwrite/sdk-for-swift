import Foundation

public enum DatabaseType: String, CustomStringConvertible {
    case legacy = "legacy"
    case tablesdb = "tablesdb"

    public var description: String {
        return rawValue
    }
}
