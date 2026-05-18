import Foundation

public enum OAuth2GooglePrompt: String, Codable, CustomStringConvertible {
    case `none` = "none"
    case consent = "consent"
    case selectAccount = "select_account"

    public var description: String {
        return rawValue
    }
}
