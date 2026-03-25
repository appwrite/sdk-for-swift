import Foundation

public enum VCSReferenceType: String, CustomStringConvertible {
    case branch = "branch"
    case commit = "commit"
    case tag = "tag"

    public var description: String {
        return rawValue
    }
}
