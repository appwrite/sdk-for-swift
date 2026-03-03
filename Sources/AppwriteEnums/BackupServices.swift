import Foundation

public enum BackupServices: String, CustomStringConvertible {
    case databases = "databases"
    case functions = "functions"
    case storage = "storage"

    public var description: String {
        return rawValue
    }
}
