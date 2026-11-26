import Foundation

public enum MonitorResourceType: String, Codable, CustomStringConvertible {
    case project = "project"
    case database = "database"
    case bucket = "bucket"
    case function = "function"
    case site = "site"
    case dedicatedDatabase = "dedicatedDatabase"
    case organization = "organization"

    public var description: String {
        return rawValue
    }
}
