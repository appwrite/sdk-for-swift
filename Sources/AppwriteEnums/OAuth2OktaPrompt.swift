import Foundation

public enum OAuth2OktaPrompt: String, Codable, CustomStringConvertible {
    case `none` = "none"
    case login = "login"
    case consent = "consent"

    public var description: String {
        return rawValue
    }
}
