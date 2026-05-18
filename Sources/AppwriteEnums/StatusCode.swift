import Foundation

public enum StatusCode: String, Codable, CustomStringConvertible {
    case movedPermanently301 = "301"
    case found302 = "302"
    case temporaryRedirect307 = "307"
    case permanentRedirect308 = "308"

    public var description: String {
        return rawValue
    }
}
