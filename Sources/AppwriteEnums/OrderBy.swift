import Foundation

public enum OrderBy: String, Codable, CustomStringConvertible {
    case asc = "asc"
    case desc = "desc"

    public var description: String {
        return rawValue
    }
}
