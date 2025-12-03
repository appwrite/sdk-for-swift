import Foundation

public enum TemplateReferenceType: String, CustomStringConvertible {
    case branch = "branch"
    case commit = "commit"
    case tag = "tag"

    public var description: String {
        return rawValue
    }
}
