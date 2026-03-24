import Foundation

public enum BackupServices: String, CustomStringConvertible {
    case databases = "databases"
    case tablesdb = "tablesdb"
    case documentsdb = "documentsdb"
    case vectorsdb = "vectorsdb"
    case functions = "functions"
    case storage = "storage"

    public var description: String {
        return rawValue
    }
}
