import Foundation

public enum RedirectStatusCode: String, Codable, CustomStringConvertible {
    case movedPermanently = "301"
    case found = "302"
    case temporaryRedirect = "307"
    case permanentRedirect = "308"

    public var description: String {
        return rawValue
    }
}
