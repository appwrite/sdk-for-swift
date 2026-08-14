import Foundation

public enum InvalidationType: String, Codable, CustomStringConvertible {
    case tag = "tag"
    case path = "path"
    case all = "all"

    public var description: String {
        return rawValue
    }
}
