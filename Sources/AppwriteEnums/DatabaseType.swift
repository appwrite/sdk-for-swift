import Foundation

public enum DatabaseType: String, Codable, CustomStringConvertible {
    case legacy = "legacy"
    case tablesdb = "tablesdb"
    case documentsdb = "documentsdb"
    case vectorsdb = "vectorsdb"
    case mysql = "mysql"
    case postgresql = "postgresql"
    case mongodb = "mongodb"

    public var description: String {
        return rawValue
    }
}
