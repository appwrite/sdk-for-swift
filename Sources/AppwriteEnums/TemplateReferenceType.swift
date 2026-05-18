import Foundation

public enum TemplateReferenceType: String, Codable, CustomStringConvertible {
    case commit = "commit"
    case branch = "branch"
    case tag = "tag"

    public var description: String {
        return rawValue
    }
}
