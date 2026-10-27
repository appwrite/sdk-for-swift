import Foundation

public enum OnDuplicate: String, Codable, CustomStringConvertible {
    case fail = "fail"
    case skip = "skip"
    case overwrite = "overwrite"

    public var description: String {
        return rawValue
    }
}
