import Foundation

public enum DatabaseType: String, CustomStringConvertible {
    case legacy = "legacy"
    case tablesdb = "tablesdb"
    case documentsdb = "documentsdb"
    case vectorsdb = "vectorsdb"

    public var description: String {
        return rawValue
    }
}
