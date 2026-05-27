import Foundation

public enum SiteAdapter: String, Codable, CustomStringConvertible {
    case `static` = "static"
    case ssr = "ssr"

    public var description: String {
        return rawValue
    }
}
