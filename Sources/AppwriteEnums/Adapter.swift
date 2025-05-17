import Foundation

public enum Adapter: String, CustomStringConvertible {
    case `static` = "static"
    case ssr = "ssr"

    public var description: String {
        return rawValue
    }
}
