import Foundation

public enum OAuth2OidcPrompt: String, Codable, CustomStringConvertible {
    case `none` = "none"
    case login = "login"
    case consent = "consent"
    case selectAccount = "select_account"

    public var description: String {
        return rawValue
    }
}
