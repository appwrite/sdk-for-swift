import Foundation

public enum OAuth2Auth0Prompt: String, Codable, CustomStringConvertible {
    case `none` = "none"
    case login = "login"
    case consent = "consent"

    public var description: String {
        return rawValue
    }
}
