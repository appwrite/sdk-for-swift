import Foundation

public enum VCSReferenceType: String, CustomStringConvertible {
    case branch = "branch"
    case commit = "commit"

    public var description: String {
        return rawValue
    }
}
