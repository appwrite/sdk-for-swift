import Foundation

public enum DatabaseType: String, Codable, CustomStringConvertible {
    case legacy = "legacy"
    case tablesdb = "tablesdb"
    case documentsdb = "documentsdb"
    case vectorsdb = "vectorsdb"

    public var description: String {
        return rawValue
    }
}
