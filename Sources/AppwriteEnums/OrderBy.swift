import Foundation

public enum OrderBy: String, CustomStringConvertible {
    case asc = "asc"
    case desc = "desc"

    public var description: String {
        return rawValue
    }
}
